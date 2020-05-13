package com.itgacl.magic4j.modules.sys.dto;
import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@Data
public class SysTenantDTO extends BaseDTO implements Serializable{

     @NotBlank(message = "请填写租户名称",groups = {Constants.Create.class,Constants.Update.class})
     private String name;

     private LocalDateTime startTime;

     private LocalDateTime endTime;

     /**
      * 联系电话
      */
     private String phone;

     /**
      * 联系邮箱
      */
     private String email;

     /**
      * 地址
      */
     private String address;

     /**
      * 0正常 1-冻结
      */
     private Integer status;

     /**
      * 备注
      */
     private String remark;

     private LocalDateTime createTime;
}
