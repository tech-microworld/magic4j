package com.itgacl.magic4j.libcommon.component.api.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@ApiModel(value="地址信息")
@Data
public class AddressInfo implements Serializable {

    @ApiModelProperty("经度")
    private BigDecimal lng;
    @ApiModelProperty("纬度")
    private BigDecimal lat;
    @ApiModelProperty("国家")
    private String nation;
    @ApiModelProperty("省份")
    private String province;
    @ApiModelProperty("城市")
    private String city;
    @ApiModelProperty("地区")
    private String district;
    @ApiModelProperty("城市编码")
    private String adCode;
    @ApiModelProperty("详细地址(省份+“-”+城市+“-”+地区)")
    private String address;
}
