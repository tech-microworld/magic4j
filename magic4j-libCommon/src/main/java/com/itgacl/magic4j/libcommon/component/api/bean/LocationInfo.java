package com.itgacl.magic4j.libcommon.component.api.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@ApiModel(value="位置信息")
@Data
public class LocationInfo implements Serializable {

    @ApiModelProperty("地址")
    private String address;
    @ApiModelProperty("国家")
    private String country;
    @ApiModelProperty("省份")
    private String province;
    @ApiModelProperty("城市")
    private String city;
    @ApiModelProperty("地区")
    private String district;
    @ApiModelProperty("街道")
    private String street;
    @ApiModelProperty("城市编码")
    private String cityCode;
    @ApiModelProperty("邮编")
    private String adcode;
}
