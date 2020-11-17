package com.itgacl.magic4j.modules.demo.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import com.itgacl.magic4j.common.base.BaseDTO;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;

/**
 * @Classname MiniappUserDTO
 * @Description MiniappUser的数据传输对象（DTO)(Data Transfer Object)
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
@ApiModel(value="MiniappUser对象DTO", description="微信小程序用户信息表")
@ColumnWidth(25)
@HeadRowHeight(20)
@ContentRowHeight(18)
@Data
public class MiniappUserDTO extends BaseDTO implements Serializable {

    @ApiModelProperty(value = "微信用户的openid")
    @ExcelProperty("微信用户的openid")
    private String openId;

    @ApiModelProperty(value = "昵称")
    @ExcelProperty("昵称")
    private String nickName;

    @ApiModelProperty(value = "性别(0：未知、1：男、2：女)")
    @ExcelProperty("性别(0：未知、1：男、2：女)")
    private String gender;

    @ApiModelProperty(value = "母语")
    @ExcelProperty("母语")
    private String language;

    @ApiModelProperty(value = "所在城市")
    @ExcelProperty("所在城市")
    private String city;

    @ApiModelProperty(value = "所在省份")
    @ExcelProperty("所在省份")
    private String province;

    @ApiModelProperty(value = "所在国家")
    @ExcelProperty("所在国家")
    private String country;

    @ApiModelProperty(value = "微信头像")
    @ExcelProperty("微信头像")
    private String avatarUrl;

    @ApiModelProperty(value = "微信绑定的手机号码")
    @ExcelProperty("微信绑定的手机号码")
    private String phoneNumber;

    @ApiModelProperty(value = "如果开发者拥有多个移动应用、网站应用和公众帐号，可通过获取用户基本信息中的unionid来区分用户的唯一性，因为只要是同一个微信开放平台帐号下的移动应用、网站应用和公众帐号，用户的unionid是唯一的。换句话说，同一用户，对同一个微信开放平台下的不同应用，unionid是相同的。 ")
    @ExcelProperty("如果开发者拥有多个移动应用、网站应用和公众帐号，可通过获取用户基本信息中的unionid来区分用户的唯一性，因为只要是同一个微信开放平台帐号下的移动应用、网站应用和公众帐号，用户的unionid是唯一的。换句话说，同一用户，对同一个微信开放平台下的不同应用，unionid是相同的。 ")
    private String unionId;

   
}
