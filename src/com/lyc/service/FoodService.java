package com.lyc.service;

import com.lyc.entity.Food;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by user on 2018/2/7.
 */
@Service
public class FoodService extends HibernateDaoSupport {

    @Autowired
    public void setSF(SessionFactory sf){
        super.setSessionFactory(sf);
    }

    public ArrayList<Food> getFoods(){
        return (ArrayList<Food>) getHibernateTemplate().find("from Food");
    }
}
