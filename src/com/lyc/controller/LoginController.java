package com.lyc.controller;

import com.lyc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/1/28 0028.
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login")
    @ResponseBody
    public String login(){
        String username=userService.login(5,"admin");
        if(username==null){
            return "登录失败!";
        }
        return "登录成功!";
    }
}
