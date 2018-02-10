package com.lyc.service;

import com.lyc.entity.Food;
import com.lyc.entity.OrderFood;
import com.lyc.entity.RechargeRecord;
import com.lyc.entity.User;
import com.lyc.exception.OrderException;
import com.lyc.util.Constant;
import com.lyc.util.OrderHelper;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

/**
 * Created by user on 2018/2/8.
 */
@Service
public class OrderService extends HibernateDaoSupport {

    @Autowired
    public void setSF(SessionFactory sf){
        super.setSessionFactory(sf);
    }

    @Transactional(rollbackFor = OrderException.class)
    public void buyFood(ArrayList<String> numbers,int user_id) throws Exception {
        Map<Food,Integer> map=new HashMap<>();
        isFoodEnough(numbers,map);
        Iterator<Map.Entry<Food, Integer>> iterator=map.entrySet().iterator();
        BigDecimal cost=new BigDecimal(0);
        List<OrderFood> orderFoods =new ArrayList<>();
        while (iterator.hasNext()){
            Map.Entry<Food, Integer> entry=iterator.next();
            Food food=entry.getKey();
            int count=entry.getValue();
            food.setLeftCount(food.getLeftCount()-count);
            BigDecimal var=new BigDecimal(count);
            cost=cost.add(food.getPrice().multiply(var));
            OrderFood orderFood =new OrderFood();
            orderFood.setFood_id(food.getId());
            orderFood.setFood_number(count);
            orderFoods.add(orderFood);
            getHibernateTemplate().save(food);
        }
        User user=getHibernateTemplate().load(User.class,user_id);
        BigDecimal before_money=user.getMoney();
        int var1=cost.compareTo(before_money);
        if(var1>0){
            throw new OrderException("一卡通余额不足");
        }
        user.setMoney(user.getMoney().subtract(cost));
        RechargeRecord rechargeRecord=new RechargeRecord();
        rechargeRecord.setTime(new Date());
        rechargeRecord.setBefore_money(before_money);
        rechargeRecord.setEnd_money(user.getMoney());
        rechargeRecord.setUser_id(user_id);
        rechargeRecord.setType(Constant.ORDER_TYPE);

        getHibernateTemplate().save(user);
        getHibernateTemplate().save(rechargeRecord);
        for(OrderFood orderFood : orderFoods){
            orderFood.setRr_id(rechargeRecord.getId());
            getHibernateTemplate().save(orderFood);
        }
    }

    private void isFoodEnough(ArrayList<String> numbers,Map map) throws OrderException {
        for(int i=0;i<4;i++){
            String foodStr=numbers.get(i);
            if(!foodStr.equals("")&&!foodStr.equals("0")){
                int foodCount=Integer.parseInt(foodStr);
                Food food=getHibernateTemplate().load(Food.class,i+1);
                if(food.getLeftCount()<foodCount){
                    throw new OrderException(food.getName()+"数量不足");
                }
                map.put(food,foodCount);
            }
        }
    }

    public List<OrderHelper> findOrders(int user_id){
        List<OrderHelper> orderHelpers=new ArrayList<>();
        List<RechargeRecord> rechargeRecords= (List<RechargeRecord>) getHibernateTemplate().find("from RechargeRecord where user_id="+user_id+" and type='"+Constant.ORDER_TYPE+"'");
        if(rechargeRecords!=null&&rechargeRecords.size()>0){
            for(RechargeRecord rechargeRecord:rechargeRecords){
                OrderHelper orderHelper=new OrderHelper();
                int id=rechargeRecord.getId();
                orderHelper.setId(id);
                orderHelper.setCost(rechargeRecord.getBefore_money().subtract(rechargeRecord.getEnd_money()));
                orderHelper.setTime(rechargeRecord.getTime());
                String msg="";
                List<OrderFood> orderFoods = (List<OrderFood>) getHibernateTemplate().find("from OrderFood where rr_id="+id);
                for(OrderFood orderFood : orderFoods){
                    int food_id= orderFood.getFood_id();
                    Food food=getHibernateTemplate().load(Food.class,food_id);
                    msg+=food.getName()+"×"+ orderFood.getFood_number()+"、";
                }
                orderHelper.setMsg(msg.substring(0,msg.length()-1));
                orderHelpers.add(orderHelper);
            }
        }
        return orderHelpers;
    }
}
