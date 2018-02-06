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
@RequestMapping("/student")
public class studentController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public String index(HttpServletRequest request, Model model){
        return Utils.index(request,model,"student");
    }

    @RequestMapping("/addPage")
    public String addPage(HttpServletRequest request, Model model){
        return Utils.index(request,model,"addPage");
    }

    @RequestMapping("/editPage")
    public String editPage(HttpServletRequest request, Model model){
        String id=request.getParameter("id");
        model.addAttribute("user",userService.get(Integer.parseInt(id)));
        return Utils.index(request,model,"editPage");
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map add(@RequestBody User user){
        Map map=new HashMap();
        user.setPassword(user.getIdentify().substring(12,17));
        user.setAdmin(2);
        user.setStatus(1);
        try {
            userService.save(user);
            map.put("result","success");
            map.put("id",user.getId());
        } catch (Exception e) {
            map.put("result","failed");
            String message=e.getMessage();
            if(message.contains("UK_9l5en6oc0n83mdf145gralf06")){
                map.put("message","身份证号码已存在");
            }else {
                map.put("message",e.getMessage());
            }

        }
        return map;
    }


    @RequestMapping("/deleteList")
    @ResponseBody
    public Map deleteList(@RequestBody int[] ids){
        Map map=new HashMap();
        try {
            userService.deleteList(ids);
            map.put("result","success");
        } catch (Exception e) {
            map.put("result","failed");
            map.put("message",e.getMessage());
        }
        return map;
    }
}
