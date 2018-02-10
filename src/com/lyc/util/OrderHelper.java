package com.lyc.util;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by user on 2018/2/9.
 */
@Data
public class OrderHelper {

    private int id;
    
    private String msg;

    private Date time;

    private BigDecimal cost;
}
