package com.itgacl.magic4j.modules.sys.vo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class LoginStatisticVo implements Serializable {

    private String location;
    private BigDecimal lng;//经度
    private BigDecimal lat;//纬度
    private Integer loginTimes;//登录次数
}
