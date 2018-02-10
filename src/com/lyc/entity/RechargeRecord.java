package com.lyc.entity;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by user on 2018/2/8.
 */
@Data
@Entity
@Table
public class RechargeRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private int user_id;

    @Column
    private Date time;

    @Column
    private BigDecimal before_money;

    @Column
    private BigDecimal end_money;

    @Column
    private String type;
}
