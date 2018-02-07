package com.lyc.entity;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * Created by user on 2018/2/7.
 */
@Data
@Table
@Entity
public class Food {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String name;

    @Column
    private BigDecimal price;

    @Column
    private String description;

    @Column
    private int left;

}
