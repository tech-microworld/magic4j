package com.itgacl.magic4j.modules.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 微信登录Token信息
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class WxLoginTokenVo implements Serializable {

    /**
     * 用于解密用户信息的sessionKey
     */
    private String sessionKey;

    /**
     * 微信用户openId
     */
    private String openId;

    /**
     * 登录Token
     */
    private String token;
}
