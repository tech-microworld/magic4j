package com.itgacl.magic4j.modules.sys.query;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @Classname SysCnAreaQuery
 * @Description SysCnArea的Query对象
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-09-03
 * @Version 1.0
 */
@ApiModel(value="SysCnArea查询对象")
@Data
public class SysCnAreaQuery  implements Serializable {

    @ApiModelProperty(value = "ID")
    private Long id;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "简称")
    private String shortName;

    @ApiModelProperty(value = "父ID")
    private Long parentId;

    @ApiModelProperty(value = "父名称")
    private String parentName;

    @ApiModelProperty(value = "合并名称")
    private String mergerName;

    @ApiModelProperty(value = "级别")
    private Integer level;

    @ApiModelProperty(value = "邮政编码")
    private Integer zipCode;

    @ApiModelProperty(value = "城市编码")
    private String cityCode;

    @ApiModelProperty(value = "行政区划代码")
    private String areaCode;

    @ApiModelProperty(value = "拼音")
    private String pinyin;

    @ApiModelProperty(value = "经度")
    private BigDecimal lng;

    @ApiModelProperty(value = "纬度")
    private BigDecimal lat;

    @ApiModelProperty(value = "需要导出的数据ID", hidden = true)
    private Long[] ids;

    @ApiModelProperty(value = "需要导出的列", hidden = true)
    private String[] exportColumnNames;
}
