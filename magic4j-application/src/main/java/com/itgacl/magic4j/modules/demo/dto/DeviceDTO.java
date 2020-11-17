package com.itgacl.magic4j.modules.demo.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
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
 * @Classname DeviceDTO
 * @Description Device的数据传输对象（DTO)(Data Transfer Object)
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
@ApiModel(value="Device对象DTO", description="设备信息")
@ColumnWidth(25)
@HeadRowHeight(20)
@ContentRowHeight(18)
@Data
public class DeviceDTO extends BaseDTO implements Serializable {

    @ApiModelProperty(value = "设备编码")
    @ExcelProperty("设备编码")
    private String deviceCode;

    @ApiModelProperty(value = "设备名称")
    @ExcelProperty("设备名称")
    private String deviceName;

    @ApiModelProperty(value = "设备所在区域")
    @ExcelProperty("设备所在区域")
    private String deviceArea;

    @ApiModelProperty(value = "设备铺设点位名称")
    @ExcelProperty("设备铺设点位名称")
    private String devicePtName;

    @ApiModelProperty(value = "经度")
    @ExcelProperty("经度")
    private String longitude;

    @ApiModelProperty(value = "纬度")
    @ExcelProperty("纬度")
    private String latitude;

    @ApiModelProperty(value = "地理位置名称")
    @ExcelProperty("地理位置名称")
    private String gePoName;

    @ApiModelProperty(value = "设备状态")
    @ExcelProperty("设备状态")
    private String state;

    @ApiModelProperty(value = "设备维护人员姓名")
    @ExcelProperty("设备维护人员姓名")
    private String maName;

    @ApiModelProperty(value = "设备维护人员电话")
    @ExcelProperty("设备维护人员电话")
    private String maPhone;

    @ApiModelProperty(value = "设备所在国家")
    @ExcelProperty("设备所在国家")
    private String country;

    @ApiModelProperty(value = "设备所在省份")
    @ExcelProperty("设备所在省份")
    private String province;

    @ApiModelProperty(value = "设备所在城市")
    @ExcelProperty("设备所在城市")
    private String city;

    @ApiModelProperty(value = "设备所在地区")
    @ExcelProperty("设备所在地区")
    private String district;

     
}
