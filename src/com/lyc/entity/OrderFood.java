package com.lyc.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Created by user on 2018/2/9.
 */
@Data
@Table
@Entity
public class OrderFood {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private int rr_id;

    @Column
    private int food_id;

    @Column
    private int food_number;
}
