package com.itgacl.magic4j.modules.sys.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@ApiModel("验证码Vo")
@Data
public class CaptchaVo implements Serializable {

    @ApiModelProperty("图形验证码的Base64编码")
    private String img;
    @ApiModelProperty("uuid")
    private String uuid;
    @ApiModelProperty("验证码")
    private String verifyCode;
    @ApiModelProperty("rsa加密公钥")
    private String rsaPublicKey;
}
