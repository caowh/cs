package com.lyc.entity;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Administrator on 2018/2/22 0022.
 */
@Data
@Table
@Entity
public class BorrowHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int user_id;

    private int book_id;

    private Date borrow_date;

    private Date back_date;

    private BigDecimal cost;
}
