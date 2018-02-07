package com.lyc.service;

import com.lyc.entity.User;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class UserService extends HibernateDaoSupport{

    @Autowired
    public void setSF(SessionFactory sf){
        super.setSessionFactory(sf);
    }

    public void save(User user){
        getHibernateTemplate().save(user);
    }

    public User loadLogin(int id,String password){
        User user=getHibernateTemplate().load(User.class,id);
        try {
            if(user.getPassword().equals(password)){
                return user;
            }
        } catch (Exception e) {
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
        return (List<User>) getHibernateTemplate().find(hql);
    }


    public void deleteList(int[] selectFlag) {
        String hql = "delete from User where ";
        for(int i=0;i<selectFlag.length;i++) {
            if(i==0) {
                hql += "id="+selectFlag[i];
            } else {
                hql +=" or id="+selectFlag[i];
            }
        }
        final String finalHql = hql;
        getHibernateTemplate().execute(session -> {
            Query query=session.createQuery(finalHql);
            query.executeUpdate();
            return null;
        });
    }

    public void update(User user) {
        String hql="";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        if(user.getEnrollment_time()!=null){
            hql+="enrollment_time =str_to_date('"+df.format(user.getEnrollment_time())+"','%Y-%m-%d') , ";
        }
        if(user.getGraduation_time()!=null){
            hql+="graduation_time =str_to_date('"+df.format(user.getGraduation_time())+"','%Y-%m-%d') , ";
        }
        if(user.getBirth_date()!=null){
            hql+="birth_date =str_to_date('"+df.format(user.getBirth_date())+"','%Y-%m-%d') , ";
        }
        if(user.getGrade()!=null){
            hql+="grade ='"+user.getGrade()+"' , ";
        }
        if(user.getClasses()!=null){
            hql+="classes ='"+user.getClasses()+"' , ";
        }
        if(user.getIdentify()!=null){
            hql+="identify ='"+user.getIdentify()+"' , ";
        }
        if(user.getSex()!=null){
            hql+="sex ='"+user.getSex()+"' , ";
        }
        if(user.getStatus()!=0){
            hql+="status ="+user.getStatus()+" , ";
        }
        if(user.getUsername()!=null){
            hql+="username ='"+user.getUsername()+"'";
        }
        if(user.getPassword()!=null){
            hql+="password ='"+user.getPassword()+"'";
        }
        hql=hql.trim();
        if(hql.endsWith(",")){
            hql=hql.substring(0,hql.length()-1);
        }
        final String finalHql = hql;
        final int finalId=user.getId();
        getHibernateTemplate().execute(session -> {
            Query query=session.createQuery("update User set "+finalHql+" where id="+finalId);
            query.executeUpdate();
            return null;
        });
    }

    public User get(int i) {
        return getHibernateTemplate().get(User.class,i);
    }
}
