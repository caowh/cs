package com.lyc.controller;


import com.lyc.entity.User;
import com.lyc.service.FoodService;
import com.lyc.service.OrderService;
import com.lyc.service.RechargeRecordService;
import com.lyc.service.UserService;
import com.lyc.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @Autowired
    private FoodService foodService;

    @Autowired
    private RechargeRecordService rechargeRecordService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "getVersion", method = RequestMethod.GET)
    @ResponseBody
    public String getVersion(){
        return "v1.4.7.20180223";
    }

    @RequestMapping(value = "index")
    public  String index(HttpServletRequest request, Model model){
        String result=Utils.index(request,model,"index");
        if(model.asMap().get("content").toString().equals("order")){
            model.addAttribute("foods",foodService.getFoods());
            User user =  (User) request.getSession().getAttribute("user");
            model.addAttribute("orders",orderService.findOrders(user.getId()));
        }
        return result;
    }

    @RequestMapping(value = "rechargePage")
    public  String rechargePage(HttpServletRequest request, Model model){
        User user =  (User) request.getSession().getAttribute("user");
        model.addAttribute("money",userService.get(user.getId()).getMoney());
        model.addAttribute("rechargeRecords",rechargeRecordService.getRechargeRecords(user.getId()));
        return Utils.index(request,model,"rechargePage");
    }

    @RequestMapping("recharge")
    @ResponseBody
    public Map recharge(@RequestBody Map map,HttpServletRequest request){
        Map map1=new HashMap();
        String type=map.get("type").toString();
        BigDecimal money= Utils.getBigDecimal(map.get("money"));
        User user =  (User) request.getSession().getAttribute("user");
        try {
            userService.modifyToRecharge(money,type,user.getId());
            map1.put("result","success");
        } catch (Exception e) {
            map1.put("result","failed");
            map1.put("message",e.getMessage());
        }
        return map1;
    }

    @RequestMapping(value = "logout")
    public String logout(HttpServletRequest request){
        request.getSession().setAttribute("user",null);
        return "logout";
    }



    @RequestMapping("userList")
    @ResponseBody
    public List<User> userList(@RequestBody User user){
        List<User> users=userService.list(user);
        if(users==null){
            return new ArrayList<>();
        }
        return users;
    }


    @RequestMapping("updateUser")
    @ResponseBody
    public Map updateUser(@RequestBody User user,HttpServletRequest request){
        Map map=new HashMap();
        if(user.getId()==0){
            User cUser=(User)request.getSession().getAttribute("user");
            user.setId(cUser.getId());
        }
        try {
            userService.update(user);
            map.put("result","success");
        } catch (Exception e) {
            map.put("result","failed");
            String message=e.getMessage();
            if(message.contains("UK_9l5en6oc0n83mdf145gralf06")){
                map.put("message","身份证号码已存在");
            }else {
                map.put("message",e.getMessage());
            }
        }
        return map;
    }


    @RequestMapping("addUser")
    @ResponseBody
    public Map addUser(@RequestBody User user){
        Map map=new HashMap();
        user.setPassword(user.getIdentify().substring(12,18));
        try {
            userService.save(user);
            map.put("result","success");
            map.put("id",user.getId());
        } catch (Exception e) {
            map.put("result","failed");
            String message=e.getMessage();
            if(message.contains("UK_9l5en6oc0n83mdf145gralf06")){
                map.put("message","身份证号码已存在");
            }else {
                map.put("message",e.getMessage());
            }

        }
        return map;
    }


    @RequestMapping("/deleteUserByIds")
    @ResponseBody
    public Map deleteUserByIds(@RequestBody int[] ids){
        Map map=new HashMap();
        try {
            userService.deleteList(ids);
            map.put("result","success");
        } catch (Exception e) {
            map.put("result","failed");
            map.put("message",e.getMessage());
        }
        return map;
    }
}
