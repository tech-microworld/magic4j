package com.itgacl.magic4j.modules.sys.vo;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.itgacl.magic4j.libcommon.bean.TreeNode;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;
/**
 * @Classname SysCnAreaVo
 * @Description SysCnArea的展示对象
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-09-03
 * @Version 1.0
 */
@ApiModel(value="SysCnArea对象Vo")
@ColumnWidth(25)
@HeadRowHeight(20)
@ContentRowHeight(18)
@Data
public class SysCnAreaVo implements Serializable{

    @ApiModelProperty(value = "ID")
    @ExcelProperty("ID")
    private Long id;

    @ApiModelProperty(value = "名称")
    @ExcelProperty("名称")
    private String name;

    @ApiModelProperty(value = "简称")
    @ExcelProperty("简称")
    private String shortName;

    @ApiModelProperty(value = "父ID")
    @ExcelProperty("父ID")
    private Long parentId;

    @ApiModelProperty(value = "父名称")
    @ExcelProperty("父名称")
    private String parentName;

    @ApiModelProperty(value = "合并名称")
    @ExcelProperty("合并名称")
    private String mergerName;

    @ApiModelProperty(value = "级别")
    @ExcelProperty("级别")
    private Integer level;

    @ApiModelProperty(value = "邮政编码")
    @ExcelProperty("邮政编码")
    private Integer zipCode;

    @ApiModelProperty(value = "城市编码")
    @ExcelProperty("城市编码")
    private String cityCode;

    @ApiModelProperty(value = "行政区划代码")
    @ExcelProperty("行政区划代码")
    private String areaCode;

    @ApiModelProperty(value = "拼音")
    @ExcelProperty("拼音")
    private String pinyin;

    @ApiModelProperty(value = "经度")
    @ExcelProperty("经度")
    private BigDecimal lng;

    @ApiModelProperty(value = "纬度")
    @ExcelProperty("纬度")
    private BigDecimal lat;


}
