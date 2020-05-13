package com.itgacl.magic4j.modules.sys.dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.constant.Regex;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@Data
public class SysUserDTO extends BaseDTO implements Serializable{

    /**
     * 用户名
     */
    @NotNull(message = "用戶名不能为空!",groups = Constants.Create.class)//字段为空会抛出MethodArgumentNotValidException异常
    private String username;

    /**
     * 密码
     */
    @NotNull(message = "密码不能为空!",groups = Constants.Create.class)
    @JSONField(serialize=false)//生成的json也不包含该字段
    private String password;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 邮箱
     */
    @Email(message = "邮箱格式不正确",groups = {Constants.Create.class,Constants.Update.class})
    private String email;

    /**
     * 手机号
     */
    @Pattern(regexp = Regex.PHONE, message = "手机号码格式不正确",groups = {Constants.Create.class,Constants.Update.class})
    private String cellphone;

    /**
     * 用户头像
     */
    private String headImg;

    /**
     * 用户状态  0：正常   1：禁用
     */
    @Pattern(regexp = "[0-1]", message = "用户状态取值：0:正常，1:禁用",groups = Constants.Status.class)
    private Integer status;

    /**
     * 备注
     */
    private String remark;

    /**
     * 部门ID
     */
    private Long deptId;

    private String deptName;//部门名称

    private List<String> roleNames;//角色名称
    private List<String> postNames;//岗位名称

    private LocalDateTime createTime;

    private Long[] roleIds;

    private Long[] postIds;

    /**
     * 租户ID
     */
    private Long tenantId;

    private Date beginTime;

    private Date endTime;
}
