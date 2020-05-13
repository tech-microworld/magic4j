package com.itgacl.magic4j.modules.sys.dto;
import com.itgacl.magic4j.common.base.BaseDTO;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @Classname SysUserPostDTO
 * @Description SysUserPost的数据传输对象（DTO)(Data Transfer Object)
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-08
 * @Version 1.0
 */
@Data
public class SysUserPostDTO extends BaseDTO implements Serializable{

     private Long userId;

     private Long postId;


}
