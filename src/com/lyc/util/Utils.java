package com.lyc.util;

import com.lyc.entity.User;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.BigInteger;

/**
 * Created by user on 2018/2/1.
 */
public class Utils {

    public static String index(HttpServletRequest request, Model model,String module){
        User user =  (User) request.getSession().getAttribute("user");
        model.addAttribute("username",user.getUsername());
        if(user.getAdmin()==3){
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
                    "          <a href=\"/student\">\n" +
                    "            <i class=\"icon-desktop\">\n" +
                    "            </i>\n" +
                    "            学生一卡通管理\n" +
                    "          </a>\n" +
                    "        </li>");
            if(module.equals("index")){
                model.addAttribute("content","student");
            }else {
                model.addAttribute("content",module);
            }
        }else {
            model.addAttribute("nav","<li>\n" +
                    "          <a href=\"/order\">\n" +
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
            if(module.equals("index")){
                model.addAttribute("content","order");
            }else {
                model.addAttribute("content",module);
            }
            model.addAttribute("rechargePage","<li>\n" +
                    "            <a href=\"/rechargePage\">\n" +
                    "              <i class=\"icon-money\">\n" +
                    "              </i>\n" +
                    "              一卡通充值\n" +
                    "            </a>\n" +
                    "          </li>");
        }
        return "index";
    }

    public static BigDecimal getBigDecimal(Object value ) {
        BigDecimal ret = null;
        if( value != null ) {
            if( value instanceof BigDecimal ) {
                ret = (BigDecimal) value;
            } else if( value instanceof String ) {
                ret = new BigDecimal( (String) value );
            } else if( value instanceof BigInteger ) {
                ret = new BigDecimal( (BigInteger) value );
            } else if( value instanceof Number ) {
                ret = new BigDecimal( ((Number)value).doubleValue() );
            } else {
                throw new ClassCastException("Not possible to coerce ["+value+"] from class "+value.getClass()+" into a BigDecimal.");
            }
        }
        return ret;
    }
}
