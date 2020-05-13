package com.itgacl.magic4j.common.security;

import lombok.Data;

import java.io.Serializable;

/**
 * 安全设置
 */
@Data
public class SecuritySetting implements Serializable {

    private Integer maxFailedLoginAttempts = 0;

    private String userLockoutNotificationEmail;

    private UserPasswordPolicy passwordPolicy;
}
