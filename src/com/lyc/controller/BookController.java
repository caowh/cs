package com.lyc.controller;

import com.lyc.entity.User;
import com.lyc.exception.BookException;
import com.lyc.service.BookService;
import com.lyc.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by user on 2018/2/9.
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping
    public String index(HttpServletRequest request, Model model){
        model.addAttribute("books",bookService.getBooks());
        User user=(User) request.getSession().getAttribute("user");
        model.addAttribute("borrowCurrentHelpers",bookService.getBorrowCurrents(user.getId()));
        model.addAttribute("borrowHistoryHelpers",bookService.getBorrowHistorys(user.getId()));
        return Utils.index(request,model,"book");
    }

    @RequestMapping("/unBack")
    @ResponseBody
    public Map unBack(HttpServletRequest request){
        User user=(User) request.getSession().getAttribute("user");
        return bookService.findUnBack(user.getId());
    }

    @RequestMapping("/borrow")
    @ResponseBody
    public Map borrow(@RequestBody List<Boolean> bls,HttpServletRequest request){
        Map map=new HashMap();
        User user=(User) request.getSession().getAttribute("user");
        try {
            bookService.borrow(bls,user.getId());
            map.put("result","success");
        } catch (BookException e) {
            map.put("result","failed");
            map.put("message",e.getMessage());
        }
        return map;
    }

    @RequestMapping("/back")
    @ResponseBody
    public Map back(@RequestParam int id){
        Map map=new HashMap();
        try {
            bookService.back(id);
            map.put("result","success");
        } catch (BookException e) {
            map.put("result","failed");
            map.put("message",e.getMessage());
        }
        return map;
    }

}
