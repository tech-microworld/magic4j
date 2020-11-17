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
 * 岗位信息表
 * </p>
 *
 * @author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @since 2020-08-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_post")
public class SysPost implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 岗位ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 岗位名称
     */
    private String postName;

    /**
     * 岗位编码
     */
    private String postCode;

    /**
     * 显示顺序
     */
    private Integer orderNum;

    /**
     * 状态（0正常 1停用）
     */
    private Integer status;

    /**
     * 岗位分类：1：高层，2：中层，3：基层，4：其他
     */
    private Integer postCategory;

    /**
     * 租户ID
     */
    private Long tenantId;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private Long createUser;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
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
     * 删除标识(0:正常，1:已删除)
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleteFlag;


    public static final String ID = "id";

    public static final String POST_NAME = "post_name";

    public static final String POST_CODE = "post_code";

    public static final String ORDER_NUM = "order_num";

    public static final String STATUS = "status";

    public static final String POST_CATEGORY = "post_category";

    public static final String TENANT_ID = "tenant_id";

    public static final String REMARK = "remark";

    public static final String CREATE_USER = "create_user";

    public static final String CREATE_TIME = "create_time";

    public static final String UPDATE_USER = "update_user";

    public static final String UPDATE_TIME = "update_time";

    public static final String DELETE_FLAG = "delete_flag";

}
