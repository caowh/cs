package com.lyc.entity;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @Column
    private String username;

    @Column
    private String password;

    @Column
    private String sex;

    @Column
    private Date birth_date;

    @Column
    private String classes;

    @Column
    private String grade;

    @Column
    private int status;

    @Column
    private int admin;

    @Column
    private Date enrollment_time;

    @Column
    private Date graduation_time;
}
