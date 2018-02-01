package com.lyc.util;

import com.lyc.entity.User;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by user on 2018/2/1.
 */
public class Utils {

    public static String index(HttpServletRequest request, Model model,String module){
        User user =  (User) request.getSession().getAttribute("user");
        model.addAttribute("username",user.getUsername());
        if(user.getAdmin()==0){
            model.addAttribute("nav"," <li>\n" +
                    "          <a href=\"/student\">\n" +
                    "            <i class=\"icon-desktop\">\n" +
                    "            </i>\n" +
                    "            学生一卡通管理\n" +
                    "          </a>\n" +
                    "        </li>\n" +
                    "        <li>\n" +
                    "          <a href=\"/normalManager\">\n" +
                    "            <i class=\"icon-desktop\">\n" +
                    "            </i>\n" +
                    "            管理员管理\n" +
                    "          </a>\n" +
                    "        </li>");
            if(module.equals("index")){
                model.addAttribute("content","student");
            }else {
                model.addAttribute("content",module);
            }
        }else if(user.getAdmin()==1){
            model.addAttribute("nav"," <li>\n" +
                    "          <a href=\"javascript:void(0);\">\n" +
                    "            <i class=\"icon-desktop\">\n" +
                    "            </i>\n" +
                    "            学生一卡通管理\n" +
                    "          </a>\n" +
                    "        </li>");
        }else {
            model.addAttribute("nav","<li>\n" +
                    "          <a href=\"javascript:void(0);\">\n" +
                    "            <i class=\"icon-desktop\">\n" +
                    "            </i>\n" +
                    "            食堂就餐\n" +
                    "          </a>\n" +
                    "        </li>\n" +
                    "        <li>\n" +
                    "          <a href=\"javascript:void(0);\">\n" +
                    "            <i class=\"icon-desktop\">\n" +
                    "            </i>\n" +
                    "            图书借阅\n" +
                    "          </a>\n" +
                    "        </li>");
        }
        return "index";
    }
}
