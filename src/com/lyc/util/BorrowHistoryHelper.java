package com.lyc.util;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by Administrator on 2018/2/22 0022.
 */
@Data
public class BorrowHistoryHelper {

    private int id;

    private String book_name;

    private String borrow_date;

    private String back_date;

    private BigDecimal cost;
}
