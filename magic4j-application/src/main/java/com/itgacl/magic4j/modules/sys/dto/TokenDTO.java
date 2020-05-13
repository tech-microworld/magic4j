package com.itgacl.magic4j.modules.sys.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Token DTO
 *
 * @author 孤傲苍狼
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class TokenDTO implements Serializable{

    private String token;//登录Token

    private String refreshToken;//刷新Token，针对jwt的token使用

    private String type;//Token类型 Bearer jwt/session

    private String reqHeaderKey;//请求头Key authorization



}
