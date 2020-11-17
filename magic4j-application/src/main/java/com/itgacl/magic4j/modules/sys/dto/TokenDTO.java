package com.itgacl.magic4j.modules.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("登录Token")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class TokenDTO implements Serializable{

    @ApiModelProperty("登录Token")
    private String token;
    @ApiModelProperty("刷新Token，针对jwt的token使用")
    private String refreshToken;
    @ApiModelProperty("Token类型 Bearer jwt/session")
    private String type;
    @ApiModelProperty("请求头Key authorization")
    private String reqHeaderKey;



}
