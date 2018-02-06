package com.lyc.controller;

import com.lyc.entity.User;
import com.lyc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


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
        int id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
            User user=userService.loadLogin(id,request.getParameter("password"));
            if(user==null){
                result="failed";
            }else {
                request.getSession().setAttribute("user",user);
                result="success";
            }
        } catch (NumberFormatException e) {
            result="failed";
        }
        return result;
    }
}
