package com.lyc.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Table
@Entity
public class Books {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private String description;

}
