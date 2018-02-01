package com.lyc.controller;

import com.lyc.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by user on 2018/2/1.
 */
@Controller
@RequestMapping("/normalManager")
public class NormalManagerController {

    @RequestMapping
    public String index(HttpServletRequest request, Model model){
        return Utils.index(request,model,"normalManager");
    }
}
