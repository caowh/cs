package com.lyc.service;

import com.lyc.entity.Food;
import com.lyc.entity.RechargeRecord;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by user on 2018/2/7.
 */
@Service
public class RechargeRecordService extends HibernateDaoSupport {

    @Autowired
    public void setSF(SessionFactory sf){
        super.setSessionFactory(sf);
    }

    public ArrayList<RechargeRecord> getRechargeRecords(int user_id){
        return (ArrayList<RechargeRecord>) getHibernateTemplate().find("from RechargeRecord where user_id="+user_id);
    }
}
