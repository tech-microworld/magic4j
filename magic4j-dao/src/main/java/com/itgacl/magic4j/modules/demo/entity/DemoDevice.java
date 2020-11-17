package com.itgacl.magic4j.modules.demo.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 设备信息
 * </p>
 *
 * @author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @since 2020-09-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("demo_device")
@ApiModel(value="DemoDevice对象", description="设备信息")
public class DemoDevice implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "设备编码")
    private String deviceCode;

    @ApiModelProperty(value = "设备名称")
    private String deviceName;

    @ApiModelProperty(value = "设备所在区域")
    private String deviceArea;

    @ApiModelProperty(value = "设备铺设点位名称")
    private String devicePtName;

    @ApiModelProperty(value = "经度")
    private String longitude;

    @ApiModelProperty(value = "纬度")
    private String latitude;

    @ApiModelProperty(value = "地理位置名称")
    private String gePoName;

    @ApiModelProperty(value = "设备状态")
    private String state;

    @ApiModelProperty(value = "设备维护人员姓名")
    private String maName;

    @ApiModelProperty(value = "设备维护人员电话")
    private String maPhone;

    @ApiModelProperty(value = "设备所在国家")
    private String country;

    @ApiModelProperty(value = "设备所在省份")
    private String province;

    @ApiModelProperty(value = "设备所在城市")
    private String city;

    @ApiModelProperty(value = "设备所在地区")
    private String district;

    @ApiModelProperty(value = "创建人")
    @TableField(fill = FieldFill.INSERT)
    private Long createUser;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更新人")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateUser;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @ApiModelProperty(value = "删除标识(0:正常，1:已删除)")
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleteFlag;


    public static final String ID = "id";

    public static final String DEVICE_CODE = "device_code";

    public static final String DEVICE_NAME = "device_name";

    public static final String DEVICE_AREA = "device_area";

    public static final String DEVICE_PT_NAME = "device_pt_name";

    public static final String LONGITUDE = "longitude";

    public static final String LATITUDE = "latitude";

    public static final String GE_PO_NAME = "ge_po_name";

    public static final String STATE = "state";

    public static final String MA_NAME = "ma_name";

    public static final String MA_PHONE = "ma_phone";

    public static final String COUNTRY = "country";

    public static final String PROVINCE = "province";

    public static final String CITY = "city";

    public static final String DISTRICT = "district";

    public static final String CREATE_USER = "create_user";

    public static final String CREATE_TIME = "create_time";

    public static final String UPDATE_USER = "update_user";

    public static final String UPDATE_TIME = "update_time";

    public static final String DELETE_FLAG = "delete_flag";

}
