package com.itgacl.magic4j.modules.sys.dto;

import com.itgacl.magic4j.common.base.BaseDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class SysUserRoleDTO extends BaseDTO implements Serializable{

     private Long userId;

     private Long roleId;


}
