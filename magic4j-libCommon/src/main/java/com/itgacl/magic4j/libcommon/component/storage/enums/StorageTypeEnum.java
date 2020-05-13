package com.itgacl.magic4j.libcommon.component.storage.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;


/**
 * @Classname StorageTypeEnum
 * @Description 文件存储类型枚举
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-30 23:37
 * @Version 1.0
 */
@Getter
@AllArgsConstructor
public enum StorageTypeEnum {

    /**
     * 本地存储
     */
    LOCAL(1, "local"),

    /**
     * 通过SFTP上传到Linux服务器统一存储
     */
    SFTP(2, "sftp"),

    /**
     * fastdfs文件服务器存储
     */
    FASTDFS(3,"fastdfs"),

    /**
     * 阿里云OSS云存储
     */
    ALIYUN_OSS(4,"oss"),

    /**
     * 腾讯云COS云存储
     */
    TENCENT_COS(5,"cos"),

    /**
     * 七牛云kodo云存储
     */
    QINIU_KODO(6,"kodo"),

    /**
     * seaweedfs文件服务器存储
     */
    SEAWEEDFS(7, "seaweedfs");

    private int type;

    private String description;

    public static StorageTypeEnum valueOf(int type) {
        for(StorageTypeEnum typeVar : StorageTypeEnum.values()) {
            if(typeVar.getType() == type) {
                return typeVar;
            }
        }
        return SFTP;
    }
}
