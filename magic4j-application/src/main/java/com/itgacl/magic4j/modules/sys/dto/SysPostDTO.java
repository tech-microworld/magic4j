package com.itgacl.magic4j.modules.sys.dto;
import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @Classname SysPostDTO
 * @Description SysPost的数据传输对象（DTO)(Data Transfer Object)
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-06
 * @Version 1.0
 */
@Data
public class SysPostDTO extends BaseDTO implements Serializable{

     @NotBlank(message = "请填写岗位名称",groups = Constants.Create.class)
     private String postName;
     @NotBlank(message = "请填写岗位编码",groups = Constants.Create.class)
     private String postCode;

     private Integer orderNum;

     @NotNull(message = "请填写岗位状态",groups = Constants.Create.class)
     private Integer status; //状态（0正常 1停用）;

     private String remark;


}
