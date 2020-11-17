package com.itgacl.magic4j.modules.sys.dto;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.itgacl.magic4j.common.base.BaseDTO;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;

/**
 * @Classname SysCnAreaDTO
 * @Description SysCnArea的数据传输对象（DTO)(Data Transfer Object)
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-09-03
 * @Version 1.0
 */
@ApiModel(value="SysCnArea对象DTO", description="中国行政区域")
@ColumnWidth(25)
@HeadRowHeight(20)
@ContentRowHeight(18)
@Data
public class SysCnAreaDTO extends BaseDTO implements Serializable {

    @ApiModelProperty(value = "名称")
    @ExcelProperty("名称")
    private String name;

    @ApiModelProperty(value = "简称")
    @ExcelProperty("简称")
    private String shortName;

    @ApiModelProperty(value = "父ID",hidden = true)
    @ExcelIgnore
    private Long parentId;

    @ApiModelProperty(value = "父名称",hidden = true)
    @ExcelIgnore
    private String parentName;

    @ApiModelProperty(value = "级别")
    @ExcelIgnore
    private Integer level;

    @ApiModelProperty(value = "邮政编码")
    @ExcelProperty("邮政编码")
    private Integer zipCode;

    @ApiModelProperty(value = "城市编码")
    @ExcelProperty("城市编码")
    private String cityCode;

    @ApiModelProperty(value = "行政区划代码",hidden = true)
    @ExcelIgnore
    private String areaCode;

    @ApiModelProperty(value = "拼音",hidden = true)
    @ExcelIgnore
    private String pinyin;

    @ApiModelProperty(value = "经度",hidden = true)
    @ExcelIgnore
    private BigDecimal lng;

    @ApiModelProperty(value = "纬度",hidden = true)
    @ExcelIgnore
    private BigDecimal lat;


}
