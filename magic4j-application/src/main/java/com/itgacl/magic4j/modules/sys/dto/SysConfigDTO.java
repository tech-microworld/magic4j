package com.itgacl.magic4j.modules.sys.dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import springfox.documentation.annotations.ApiIgnore;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@ApiModel("系统配置DTO")
@Data
public class SysConfigDTO extends BaseDTO implements Serializable{

     @ApiModelProperty("配置名称")
     @NotBlank(message = "请输入名称",groups = Constants.Create.class)
     @Size(max = 50, message = "名称不能超过50个字符",groups = {Constants.Create.class,Constants.Update.class})
     private String configName;

     @ApiModelProperty("键名")
     @NotBlank(message = "请输入键名",groups = Constants.Create.class)
     @Size(max = 50, message = "键名不能超过50个字符",groups = {Constants.Create.class,Constants.Update.class})
     private String configKey;

     @ApiModelProperty("键值")
     @NotBlank(message = "请输入键值",groups = Constants.Create.class)
     @Size(max = 3000, message = "键值不能超过3000个字符",groups = {Constants.Create.class,Constants.Update.class})
     private String configValue;

     @ApiModelProperty("配置状态")
     private Integer status;

     @ApiModelProperty("配置备注")
     private String remark;

     @ApiModelProperty(hidden = true)//隐藏属性
     private LocalDateTime createTime;

     @ApiModelProperty(hidden = true)//隐藏属性
     @JSONField(serialize = false)//不序列化
     private Date beginTime;

     @ApiModelProperty(hidden = true)//隐藏属性
     @JSONField(serialize = false)//不序列化
     private Date endTime;
}

/**
 * javax.validation.constraints中@NotEmpty,@NotNull,@NotBlank三者的区别

 @NotEmpty 字符串不能是null，不能是空字符，但可以全是空格
 @NotNul 被修饰元素不能为null，但可以是空字符串
 @NotBlank 字符串不能是null，不能是空字符，也不可以全是空格

 */
