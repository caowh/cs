package com.lyc.controller;


import com.lyc.entity.User;
import com.lyc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "saveUser", method = RequestMethod.GET)
    @ResponseBody
    public String saveUser(){
        User user=new User();
        user.setUsername("test");
        user.setPassword("test");
        user.setSex("男");
        user.setStatus(0);
        user.setAdmin(0);
        userService.save(user);
        return "success!";
    }
}
