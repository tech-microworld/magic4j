package com.itgacl.magic4j.modules.sys.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class ResourcePermVo implements Serializable{

    private String mappingUrl;//路径映射
    private String requestType;//HTTP请求方式(GET、POST、PUT、DELETE)
    private String perms;//访问权限
}
