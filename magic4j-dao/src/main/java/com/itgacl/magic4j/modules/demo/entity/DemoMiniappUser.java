package com.itgacl.magic4j.modules.demo.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 微信小程序用户信息表
 * </p>
 *
 * @author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @since 2020-09-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("demo_miniapp_user")
@ApiModel(value="DemoMiniappUser对象", description="微信小程序用户信息表")
public class DemoMiniappUser implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "微信用户的openid")
    private String openId;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "性别(0：未知、1：男、2：女)")
    private String gender;

    @ApiModelProperty(value = "母语")
    private String language;

    @ApiModelProperty(value = "所在城市")
    private String city;

    @ApiModelProperty(value = "所在省份")
    private String province;

    @ApiModelProperty(value = "所在国家")
    private String country;

    @ApiModelProperty(value = "微信头像")
    private String avatarUrl;

    @ApiModelProperty(value = "微信绑定的手机号码")
    private String phoneNumber;

    @ApiModelProperty(value = "如果开发者拥有多个移动应用、网站应用和公众帐号，可通过获取用户基本信息中的unionid来区分用户的唯一性，因为只要是同一个微信开放平台帐号下的移动应用、网站应用和公众帐号，用户的unionid是唯一的。换句话说，同一用户，对同一个微信开放平台下的不同应用，unionid是相同的。 ")
    private String unionId;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @ApiModelProperty(value = "删除标识(0:正常，1:已删除)")
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleteFlag;


    public static final String ID = "id";

    public static final String OPEN_ID = "open_id";

    public static final String NICK_NAME = "nick_name";

    public static final String GENDER = "gender";

    public static final String LANGUAGE = "language";

    public static final String CITY = "city";

    public static final String PROVINCE = "province";

    public static final String COUNTRY = "country";

    public static final String AVATAR_URL = "avatar_url";

    public static final String PHONE_NUMBER = "phone_number";

    public static final String UNION_ID = "union_id";

    public static final String CREATE_TIME = "create_time";

    public static final String UPDATE_TIME = "update_time";

    public static final String DELETE_FLAG = "delete_flag";

}
