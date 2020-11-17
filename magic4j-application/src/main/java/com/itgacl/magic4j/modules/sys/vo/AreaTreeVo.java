package com.itgacl.magic4j.modules.sys.vo;

import com.itgacl.magic4j.libcommon.bean.TreeNode;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class AreaTreeVo extends TreeNode<AreaTreeVo,Long> implements Serializable {

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("简称")
    private String shortName;

    @ApiModelProperty("邮政编码")
    private Integer zipCode;

    @ApiModelProperty("城市编码")
    private String cityCode;

    @ApiModelProperty("行政区划代码")
    private String areaCode;

    @ApiModelProperty("拼音")
    private String pinyin;

    @ApiModelProperty("经度")
    private BigDecimal lng;

    @ApiModelProperty("纬度")
    private BigDecimal lat;

    @ApiModelProperty(value = "级别")
    private Integer level;
}
