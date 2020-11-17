package com.itgacl.magic4j.modules.demo.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
/**
 * @Classname DeviceVo
 * @Description Device的展示对象
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
@ApiModel(value="Device对象Vo")
@ColumnWidth(25)
@HeadRowHeight(20)
@ContentRowHeight(18)
@Data
public class DeviceVo  implements Serializable{

    @ApiModelProperty(value = "ID")
    @ExcelProperty("ID")
    private Long id;

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

    @ApiModelProperty(value = "设备所在省份")
    @ExcelProperty("设备所在省份")
    private String province;

    @ApiModelProperty(value = "设备所在城市")
    @ExcelProperty("设备所在城市")
    private String city;

    @ApiModelProperty(value = "设备所在地区")
    @ExcelProperty("设备所在地区")
    private String district;

    @ApiModelProperty(value = "创建时间")
    @ExcelProperty("创建时间")
    private LocalDateTime createTime;
}
