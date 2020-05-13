package com.itgacl.magic4j.modules.sys.dto;
import com.itgacl.magic4j.common.base.BaseDTO;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@Data
public class SysRoleDeptDTO extends BaseDTO implements Serializable{

     private Long roleId;

     private Long deptId;


}
