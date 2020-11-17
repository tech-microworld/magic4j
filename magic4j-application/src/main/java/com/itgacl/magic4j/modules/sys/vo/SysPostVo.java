package com.itgacl.magic4j.modules.sys.vo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import lombok.Data;

/**
 * @Classname SysPostVo
 * @Description SysPost的Vo对象
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-28
 * @Version 1.0
 */
@Data
public class SysPostVo  implements Serializable{

    /**
     * 岗位ID
     */
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
    private Long createUser;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 更新人
     */
    private Long updateUser;
    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
    /**
     * 删除标识(0:正常，1:已删除)
     */
    private Integer deleteFlag;

}
