package com.itgacl.magic4j.modules.sys.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 中国行政区域
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_cn_area")
public class SysCnArea implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 简称
     */
    private String shortName;

    /**
     * 父ID
     */
    private Long parentId;

    /**
     * 父名称
     */
    private String parentName;

    /**
     * 合并名称
     */
    private String mergerName;

    /**
     * 级别
     */
    private Integer level;

    /**
     * 邮政编码
     */
    private Integer zipCode;

    /**
     * 城市编码
     */
    private String cityCode;

    /**
     * 拼音
     */
    private String pinyin;

    /**
     * 经度
     */
    private BigDecimal lng;

    /**
     * 纬度
     */
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

    public static final String PINYIN = "pinyin";

    public static final String LNG = "lng";

    public static final String LAT = "lat";

}
