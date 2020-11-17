package com.itgacl.magic4j.common.bean;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * 登录用户信息
 */
@Data
public class LoginUser implements Serializable {

    private static final long serialVersionUID = -5809782578272943999L;

    private Long id;

    private String username;

    private String realName;

    private String email;

    private String cellphone;

    private String headImg;

    private Long deptId;//部门ID

    private Long tenantId;//租户ID

    /**
     * 用户权限列表
     */
    private List<String> permsList;

    /**
     * 用户所属的角色列表
     */
    private List<Role> roleList;

    /**
     * 登录IP地址
     */
    private String ipAddress;

    /**
     * 登录地点
     */
    private String loginLocation;

    /**
     * 经度
     */
    private BigDecimal lng;

    /**
     * 纬度
     */
    private BigDecimal lat;

    /**
     * 浏览器类型
     */
    private String browser;

    /**
     * 操作系统
     */
    private String os;

    @Data
    public static class Role implements Serializable{
        private Long roleId;
        private String roleName;
        private String roleCode;
        /**
         * 数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）
         */
        @JSONField(serialize = false)
        private Integer dataScope;
    }
}
