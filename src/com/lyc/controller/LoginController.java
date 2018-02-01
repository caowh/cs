package com.lyc.controller;

import com.lyc.entity.User;
import com.lyc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/1/28 0028.
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login")
    @ResponseBody
    public String login(HttpServletRequest request){
        String result;
        User user=userService.login(Integer.parseInt(request.getParameter("id")),request.getParameter("password"));
        if(user==null){
            result="failed";
        }else {
            request.getSession().setAttribute("user",user);
            result="success";
        }
        return result;
    }
}
