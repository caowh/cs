package com.lyc.controller;

import com.lyc.entity.User;
import com.lyc.service.UserService;
import com.lyc.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by user on 2018/2/1.
 */
@Controller
@RequestMapping("/normalManager")
public class NormalManagerController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public String index(HttpServletRequest request, Model model){
        return Utils.index(request,model,"normalManager");
    }

    @RequestMapping("/addPage")
    public String addPage(HttpServletRequest request, Model model){
        return Utils.index(request,model,"addPageM");
    }

    @RequestMapping("/editPage")
    public String editPage(HttpServletRequest request, Model model){
        String id=request.getParameter("id");
        model.addAttribute("user",userService.get(Integer.parseInt(id)));
        return Utils.index(request,model,"editPageM");
    }
}
