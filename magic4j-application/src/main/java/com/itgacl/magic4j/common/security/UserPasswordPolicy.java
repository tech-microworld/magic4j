package com.itgacl.magic4j.common.security;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户密码规则
 */
@Data
public class UserPasswordPolicy implements Serializable {

    private Integer minimumLength = 0;
    private Integer maximumLength = 0;
    private Integer minimumUppercaseLetters = 0;
    private Integer minimumLowercaseLetters = 0;
    private Integer minimumDigits = 0;
    private Integer minimumSpecialCharacters = 0;
    private Integer passwordExpirationPeriodDays = 0;

    private String passwordPolicyDesc;
}
