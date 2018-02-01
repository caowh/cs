package com.lyc.service;

import com.lyc.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public User login(int id,String password){
        User user=getSession().load(User.class,id);
        if(user!=null&&user.getPassword().equals(password)){
            return user;
        }
        return null;
    }

    public List<User> list(User user){
        String hql="from User where ";
        if(user.getId()!=0){
            hql+="id ="+user.getId()+" and ";
        }
        if(user.getAdmin()!=0){
            hql+="admin ="+user.getAdmin()+" and ";
        }
        if(user.getEnrollment_time()!=null){
            hql+="enrollment_time >"+user.getEnrollment_time()+" and ";
        }
        if(user.getGraduation_time()!=null){
            hql+="graduation_time <"+user.getGraduation_time()+" and ";
        }
        if(user.getGrade()!=null){
            hql+="getGrade ="+user.getGrade()+" and ";
        }
        if(user.getClasses()!=null){
            hql+="classes ="+user.getClasses()+" and ";
        }
        if(user.getIdentify()!=null){
            hql+="identify ="+user.getIdentify()+" and ";
        }
        if(user.getSex()!=null){
            hql+="sex ="+user.getSex()+" and ";
        }
        if(user.getStatus()!=0){
            hql+="status ="+user.getStatus()+" and ";
        }
        if(user.getUsername()!=null){
            hql+="username ="+user.getUsername();
        }
        hql=hql.trim();
        if(hql.endsWith("and")){
            hql=hql.substring(0,hql.length()-3);
        }
        Query<User> query=getSession().createQuery(hql,User.class);
        return query.list();
    }

}
