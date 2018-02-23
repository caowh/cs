package com.lyc.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2018/2/22 0022.
 */
@Data
@Table
@Entity
public class BorrowCurrent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int user_id;

    private int book_id;

    private Date br_date;
}
