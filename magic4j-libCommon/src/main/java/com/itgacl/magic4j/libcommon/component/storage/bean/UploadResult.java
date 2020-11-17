package com.itgacl.magic4j.libcommon.component.storage.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 针对上传文件返回结果的JavaBean
 */
@ApiModel("上传文件结果")
@Data
public class UploadResult implements Serializable {

    @ApiModelProperty("上传文件的原始文件名")
    private String originalFileName;

    @ApiModelProperty("上传后的文件名")
    private String newFileName;

    @ApiModelProperty("文件保存路径")
    private String savePath;

    @ApiModelProperty("文件网络访问URL地址")
    private String fileUrl;

    @ApiModelProperty("文件后缀名")
    private String fileSuffix;

    @ApiModelProperty("存储方式")
    private String storageType;

    @ApiModelProperty("文件大小")
    private Long fileLength;

    @ApiModelProperty("文件MD5")
    private String fileMd5;

    @ApiModelProperty("上传结果：true:成功，false：失败")
    private boolean isUploadSuccess;

    @ApiModelProperty("上传文件使用时间(毫秒)")
    private Long useTime;
}
