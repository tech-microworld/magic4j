package com.itgacl.magic4j.libcommon.component.storage.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 针对上传文件返回结果的JavaBean
 */
@Data
public class UploadResult implements Serializable {

    /**
     * 上传文件的原始文件名
     */
    private String originalFileName;

    /**
     * 重命名后的文件名
     */
    private String newFileName;

    /**
     * 文件保存路径
     */
    private String savePath;

    /**
     * 文件网络访问URL地址
     */
    private String fileUrl;

    /**
     * 文件后缀名
     */
    private String fileSuffix;

    /**
     * 存储方式
     */
    private String storageType;

    /**
     * 文件大小
     */
    private Long fileLength;

    /**
     * 文件MD5
     */
    private String fileMd5;

    /**
     * 上传结果：true:成功
     *           false：失败
     *
     */
    private boolean isUploadSuccess;

    /**
     * 上传使用时间
     */
    private Long useTime;
}
