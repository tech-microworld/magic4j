package com.itgacl.magic4j.modules.sys.dto;
import com.itgacl.magic4j.common.base.BaseDTO;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @Classname SysFileDTO
 * @Description SysFile的数据传输对象（DTO)(Data Transfer Object)
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-25
 * @Version 1.0
 */
@Data
public class SysFileDTO extends BaseDTO implements Serializable{

     private String originalFileName;

     private String newFileName;

     private String savePath;

     private String fileUrl;

     private String fileSuffix;

     private String storageType;

     private Integer fileLength;

     private String fileMd5;

     private String remark;

     private LocalDateTime createTime;

     private Long createUser;

     private LocalDateTime updateTime;

     private Long updateUser;

     private Integer deleteFlag;


}
