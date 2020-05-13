package com.itgacl.magic4j.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统字典表
 * </p>
 *
 * @author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @since 2020-04-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_dict")
public class SysDict implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     *  父ID（保留字段，暂时没用上） 
     */
    private Long parentId;

    /**
     * 字典名称
     */
    private String dictName;

    /**
     *  字典类型(静态数据，设置了就不允许再更改)
     */
    private String dictType;

    /**
     *  字典编码(静态数据，设置了就不允许再更改) 
     */
    private String dictCode;

    /**
     *  字典文本 
     */
    private String dictLabel;

    /**
     *  顺序 
     */
    private Integer sortNo;

    /**
     * 字典描述
     */
    private String dictDesc;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private Long createUser;

    /**
     * 创建时间
     */
    @TableField(value = "create_Time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新人
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateUser;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 删除标识
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleteFlag;


    public static final String ID = "id";

    public static final String PARENT_ID = "parent_id";

    public static final String DICT_NAME = "dict_name";

    public static final String DICT_TYPE = "dict_type";

    public static final String DICT_CODE = "dict_code";

    public static final String DICT_LABEL = "dict_label";

    public static final String SORT_NO = "sort_no";

    public static final String DICT_DESC = "dict_desc";

    public static final String CREATE_USER = "create_user";

    public static final String CREATE_TIME = "create_Time";

    public static final String UPDATE_USER = "update_user";

    public static final String UPDATE_TIME = "update_time";

    public static final String DELETE_FLAG = "delete_flag";

}
