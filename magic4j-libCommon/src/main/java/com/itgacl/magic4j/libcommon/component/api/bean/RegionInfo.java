package com.itgacl.magic4j.libcommon.component.api.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@ApiModel(value="区域信息")
@Data
public class RegionInfo implements Serializable {

    @ApiModelProperty("经度")
    private BigDecimal lng;
    @ApiModelProperty("纬度")
    private BigDecimal lat;
    @ApiModelProperty("区域名称")
    private String name;
    @ApiModelProperty("城市编码")
    private String adCode;
}
