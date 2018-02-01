package com.lyc.controller;


import com.lyc.entity.User;
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
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "saveUser", method = RequestMethod.GET)
    @ResponseBody
    public String saveUser(){
        User user=new User();
        user.setUsername("admin");
        user.setPassword("admin");
        user.setSex("男");
        user.setStatus(0);
        user.setAdmin(0);
        userService.save(user);
        return "success!";
    }

    @RequestMapping(value = "index")
    public  String index(HttpServletRequest request, Model model){
        return Utils.index(request,model,"index");
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
}
