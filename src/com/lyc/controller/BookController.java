package com.lyc.controller;

import com.lyc.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by user on 2018/2/9.
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @RequestMapping
    public String index(HttpServletRequest request, Model model){
        return Utils.index(request,model,"book");
    }
}
