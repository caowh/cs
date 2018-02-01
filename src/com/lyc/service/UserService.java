package com.lyc.service;

import com.lyc.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession(){
        return sessionFactory.openSession();
    }

    public void save(User user){
        getSession().save(user);
    }

    public User load(int id){
        return getSession().load(User.class,id);
    }

    public User login(int id,String password){
//        String hql="select User from User where id="+id+" and password='"+password+"'";
//        Query<User> query=getSession().createQuery(hql);
//        return query.uniqueResult();
        User user=getSession().load(User.class,id);
        if(user!=null&&user.getPassword().equals(password)){
            return user;
        }
        return null;
    }
}
