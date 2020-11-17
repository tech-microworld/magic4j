package com.itgacl.magic4j.modules.sys.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 中国行政区域
 * </p>
 *
 * @author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @since 2020-09-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_cn_area")
@ApiModel(value="CnArea对象", description="中国行政区域")
public class CnArea implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "ID")
    @TableId(value = "id", type = IdType.AUTO)
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


    public static final String ID = "id";

    public static final String NAME = "name";

    public static final String SHORT_NAME = "short_name";

    public static final String PARENT_ID = "parent_id";

    public static final String PARENT_NAME = "parent_name";

    public static final String MERGER_NAME = "merger_name";

    public static final String LEVEL = "level";

    public static final String ZIP_CODE = "zip_code";

    public static final String CITY_CODE = "city_code";

    public static final String AREA_CODE = "area_code";

    public static final String PINYIN = "pinyin";

    public static final String LNG = "lng";

    public static final String LAT = "lat";

}
