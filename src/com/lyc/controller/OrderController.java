package com.lyc.controller;

import com.lyc.service.FoodService;
import com.lyc.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by user on 2018/2/7.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private FoodService foodService;

    @RequestMapping
    public String index(HttpServletRequest request, Model model){
        model.addAttribute("foods",foodService.getFoods());
        return Utils.index(request,model,"order");
    }
}
