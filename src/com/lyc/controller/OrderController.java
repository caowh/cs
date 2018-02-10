package com.lyc.controller;

import com.lyc.entity.User;
import com.lyc.service.FoodService;
import com.lyc.service.OrderService;
import com.lyc.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by user on 2018/2/7.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private FoodService foodService;

    @Autowired
    private OrderService orderService;

    @RequestMapping
    public String index(HttpServletRequest request, Model model){
        model.addAttribute("foods",foodService.getFoods());
        User user =  (User) request.getSession().getAttribute("user");
        model.addAttribute("orders",orderService.findOrders(user.getId()));
        return Utils.index(request,model,"order");
    }

    @RequestMapping("/buy")
    @ResponseBody
    public Map recharge(@RequestBody ArrayList<String> numbers,HttpServletRequest request){
        Map map=new HashMap();
        User user =  (User) request.getSession().getAttribute("user");
        try {
            orderService.buyFood(numbers,user.getId());
            map.put("result","success");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("result","failed");
            map.put("message",e.getMessage());
        }
        return map;
    }
}
