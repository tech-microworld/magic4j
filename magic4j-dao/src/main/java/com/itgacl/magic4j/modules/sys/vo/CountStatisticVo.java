package com.itgacl.magic4j.modules.sys.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 数量统计Vo
 */
@Data
public class CountStatisticVo implements Serializable {

    private String days;
    private Integer count;
}
