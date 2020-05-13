package com.itgacl.magic4j.modules.sys.dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@Data
public class SysRoleDTO extends BaseDTO implements Serializable{

     @NotNull(message = "角色不能为空!",groups = Constants.Create.class)
     private String roleName;

     @NotNull(message = "角色编码为空!",groups = Constants.Create.class)
     private String roleCode;

     /**
      * 数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）
      */
     private Integer dataScope =1;

     /** 选中的菜单id */
     private Long[] menuIds;

     /** 选中的授权资源id */
     private Long[] authResIds;

     /** 部门组（数据权限）*/
     @JSONField(serialize = false)//不序列化
     private Long[] deptIds;//自定义数据权限时勾选的部门ID

     /**
      * 租户ID
      */
     @JSONField(serialize = false)//不序列化
     private Long tenantId;

     private String remark;

     private Long createUser;

     private LocalDateTime createTime;

     @JSONField(serialize = false)//不序列化
     private Date beginTime;

     @JSONField(serialize = false)//不序列化
     private Date endTime;
}
