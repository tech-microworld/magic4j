package com.itgacl.magic4j.modules.demo.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @Classname AppLoginUserVo
 * @Description 微信登录用户信息
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-05-25
 * @Version 1.0
 */
@ApiModel("微信小程序用户信息")
@Data
public class AppLoginUserVo implements Serializable{

     @ApiModelProperty("微信用户openId")
     private String openId;

     @ApiModelProperty("微信用户昵称")
     private String name;

     @ApiModelProperty("用户头像")
     private String avatarUrl;

     @ApiModelProperty("手机号")
     private String phoneNumber;
}
