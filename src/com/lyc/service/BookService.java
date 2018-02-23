package com.lyc.service;

import com.lyc.entity.*;
import com.lyc.exception.BookException;
import com.lyc.util.BorrowCurrentHelper;
import com.lyc.util.BorrowHistoryHelper;
import com.lyc.util.Constant;
import com.lyc.util.Utils;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by user on 2018/2/8.
 */
@Service
public class BookService extends HibernateDaoSupport {

    @Autowired
    public void setSF(SessionFactory sf){
        super.setSessionFactory(sf);
    }

    public List<Books> getBooks(){
        return (List<Books>) getHibernateTemplate().find("from Books ");
    }

    public List<BorrowCurrentHelper> getBorrowCurrents(int user_id){
        List<BorrowCurrentHelper> borrowCurrentHelpers=new ArrayList<>();
        List<BorrowCurrent> borrowCurrents=(List<BorrowCurrent>) getHibernateTemplate().find("from BorrowCurrent where user_id="+user_id);
        if(borrowCurrents!=null&&borrowCurrents.size()>0){
            for(BorrowCurrent borrowCurrent:borrowCurrents){
                BorrowCurrentHelper borrowCurrentHelper=new BorrowCurrentHelper();
                borrowCurrentHelper.setBc_id(borrowCurrent.getId());
                SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date borrow_date=borrowCurrent.getBr_date();
                Date back_date=new Date();
                int days=Utils.differentDaysByMillisecond(borrow_date,back_date);
                String back;
                long shouldBackTime=borrow_date.getTime()+1000*3600*24*7;
                if(days<6){
                    back="<span style='color:green'>剩余免费借书时长："+warningTime(shouldBackTime-back_date.getTime())+"</span>";
                }else if(days==6){
                    back="<span style='color:orange'>请及时还书，剩余时长："+warningTime(shouldBackTime-back_date.getTime())+"!</span>";
                } else {
                    back="<span style='color:red'>计费中，超出时长："+warningTime(back_date.getTime()-shouldBackTime)+"！</span>";
                }
                borrowCurrentHelper.setBack(back);
                borrowCurrentHelper.setDate(simpleDateFormat.format(borrow_date));
                Books books=getHibernateTemplate().load(Books.class,borrowCurrent.getBook_id());
                String book_name=books.getName();
                borrowCurrentHelper.setBook_name(book_name);
                borrowCurrentHelpers.add(borrowCurrentHelper);
            }
        }
        return borrowCurrentHelpers;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = BookException.class)
    public void borrow(List<Boolean> bls,int user_id) throws BookException {
        List<BorrowCurrent> bcs= (List<BorrowCurrent>) getHibernateTemplate().find("from BorrowCurrent where user_id="+user_id);
        int canBC= Constant.MAX_BORROW_COUNT;
        if(bcs!=null)canBC-=bcs.size();
        for(int i=0;i<bls.size();i++){
            if(bls.get(i)){
                if(canBC<=0)throw new BookException("超出借书数量上限，每人最多允许借书"+Constant.MAX_BORROW_COUNT+"本，您已借"+bcs.size()+"本");
                canBC--;
                BorrowCurrent borrowCurrent=new BorrowCurrent();
                borrowCurrent.setBook_id(i+1);
                borrowCurrent.setUser_id(user_id);
                borrowCurrent.setBr_date(new Date());
                getHibernateTemplate().save(borrowCurrent);
            }
        }

    }

    private String warningTime(long lg){
        int day= (int) (lg/(1000*3600*24));
        int hour= (int) ((lg-(long)1000*3600*24*day)/(1000*3600));
        int min= (int) ((lg-(long)1000*3600*24*day-1000*3600*hour)/(1000*60));
        int second=(int) ((lg-(long)1000*3600*24*day-1000*3600*hour-1000*60*min)/1000);
        return day+"天"+hour+"小时"+min+"分"+second+"秒";
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void back(int bc_id) throws BookException {
        BorrowCurrent borrowCurrent=getHibernateTemplate().load(BorrowCurrent.class,bc_id);
        Date borrow_date=borrowCurrent.getBr_date();
        int days=Utils.differentDaysByMillisecond(borrow_date,new Date());
        BigDecimal cost;
        if(days>6){
            cost=Constant.BOOK_DATE_PRICE.multiply(new BigDecimal(days-6));
            User user=getHibernateTemplate().load(User.class,borrowCurrent.getUser_id());
            BigDecimal before_money=user.getMoney();
            int var1=cost.compareTo(before_money);
            if(var1>0){
                throw new BookException("一卡通余额不足");
            }
            user.setMoney(user.getMoney().subtract(cost));
            RechargeRecord rechargeRecord=new RechargeRecord();
            rechargeRecord.setTime(new Date());
            rechargeRecord.setBefore_money(before_money);
            rechargeRecord.setEnd_money(user.getMoney());
            rechargeRecord.setUser_id(borrowCurrent.getUser_id());
            rechargeRecord.setType(Constant.BORROW_TYPE);
            getHibernateTemplate().save(rechargeRecord);
            getHibernateTemplate().save(user);
        }else {
            cost=new BigDecimal(0);
        }
        BorrowHistory borrowHistory=new BorrowHistory();
        borrowHistory.setUser_id(borrowCurrent.getUser_id());
        borrowHistory.setBook_id(borrowCurrent.getBook_id());
        borrowHistory.setBorrow_date(borrowCurrent.getBr_date());
        borrowHistory.setBack_date(new Date());
        borrowHistory.setCost(cost);
        getHibernateTemplate().save(borrowHistory);
        getHibernateTemplate().delete(borrowCurrent);
    }

    public List<BorrowHistoryHelper> getBorrowHistorys(int user_id){
        List<BorrowHistoryHelper> borrowHistoryHelpers=new ArrayList<>();
        List<BorrowHistory> borrowHistories= (List<BorrowHistory>) getHibernateTemplate().find("from BorrowHistory where user_id="+user_id);
        if(borrowHistories!=null&&borrowHistories.size()>0){
            for(BorrowHistory borrowHistory:borrowHistories){
                BorrowHistoryHelper borrowHistoryHelper=new BorrowHistoryHelper();
                SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                borrowHistoryHelper.setBorrow_date(simpleDateFormat.format(borrowHistory.getBorrow_date()));
                borrowHistoryHelper.setBack_date(simpleDateFormat.format(borrowHistory.getBack_date()));
                Books books=getHibernateTemplate().load(Books.class,borrowHistory.getBook_id());
                borrowHistoryHelper.setBook_name(books.getName());
                borrowHistoryHelper.setCost(borrowHistory.getCost());
                borrowHistoryHelper.setId(borrowHistory.getId());
                borrowHistoryHelpers.add(borrowHistoryHelper);
            }
        }
        return borrowHistoryHelpers;
    }

    public Map<String,Integer> findUnBack(int user_id){
        Map<String,Integer> map=new HashMap<>();
        List<BorrowCurrent> borrowCurrents= (List<BorrowCurrent>) getHibernateTemplate().find("from BorrowCurrent where user_id="+user_id);
        int warn=0,bigWarn=0;
        if(borrowCurrents!=null&&borrowCurrents.size()>0){
            for(BorrowCurrent borrowCurrent:borrowCurrents){
                int days=Utils.differentDaysByMillisecond(borrowCurrent.getBr_date(),new Date());
                if(days==6){
                    warn++;
                }else if(days>6){
                    bigWarn++;
                }
            }
        }
        map.put("warn",warn);
        map.put("bigWarn",bigWarn);
        return map;
    }
}
