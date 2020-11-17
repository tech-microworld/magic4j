package com.itgacl.magic4j.modules.demo.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 微信小程序用户信息
 */
@ApiModel("微信小程序用户信息")
@Data
public class MiniAppUserInfo implements Serializable{

    @ApiModelProperty(value = "用于解密用户信息的sessionKey",required = true)
    private String sessionKey;

    /**
     * 用户信息对象，不包含 openid 等敏感信息
     */
    private UserInfo userInfo;

    /**
     * 不包括敏感信息的原始数据字符串，用于计算签名。
     */
    @ApiModelProperty(value = "原始数据字符串",required = true)
    @NotBlank(message = "微信原始数据字符串不能为空")
    private String rawData;

    /**
     * 使用 sha1( rawData + sessionkey ) 得到字符串，用于校验用户信息
     */
    @ApiModelProperty(value = "微信原始数据签名",required = true)
    @NotBlank(message = "微信原始数据签名不能为空")
    private String signature;

    /**
     * 包括敏感数据在内的完整用户信息的加密数据
     */
    @ApiModelProperty(value = "微信用户信息的加密数据",required = true)
    @NotBlank(message = "微信用户信息的加密数据不能为空")
    private String encryptedData;

    /**
     *
     * 加密算法的初始向量
     */
    @ApiModelProperty(value = "加密算法的初始向量",required = true)
    @NotBlank(message = "微信加密算法的初始向量不能为空")
    private String iv;

    @ApiModel("用户信息")
    @Data
    public static class UserInfo implements Serializable{

        /**
         * 用户昵称
         */
        @ApiModelProperty(value = "微信用户昵称",required = true)
        @NotBlank(message = "微信用户昵称不能为空")
        private String nickName;
        /**
         * 用户头像URL
         */
        @ApiModelProperty(value = "用户头像URL",required = true)
        @NotBlank(message = "微信用户头像URL不能为空")
        private String avatarUrl;
        /**
         * 用户性别(0：未知、1：男、2：女)
         */
        @ApiModelProperty("用户性别(0：未知、1：男、2：女)")
        private String gender;
        /**
         * 用户所在省份
         */
        @ApiModelProperty("用户所在省份")
        private String province;
        /**
         * 用户所在城市
         */
        @ApiModelProperty("用户所在城市")
        private String city;
        /**
         * 用户所在国家
         */
        @ApiModelProperty("用户所在国家")
        private String country;
    }
}
