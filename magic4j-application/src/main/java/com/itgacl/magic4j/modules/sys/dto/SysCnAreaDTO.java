package com.itgacl.magic4j.modules.sys.dto;
import com.itgacl.magic4j.common.base.BaseDTO;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@Data
public class SysCnAreaDTO extends BaseDTO implements Serializable{

     private String name;

     private String shortName;

     private Long parentId;

     private String parentName;

     private String mergerName;

     private Integer level;

     private Integer zipCode;

     private String cityCode;

     private String pinyin;

     private BigDecimal lng;

     private BigDecimal lat;


}
