package com.itgacl.magic4j.libcommon.component.storage.service.impl;

import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.component.storage.enums.StorageTypeEnum;
import com.itgacl.ssh2.jsch.JschService;
import com.itgacl.ssh2.jsch.annotation.EnableSFTP;
import com.itgacl.ssh2.jsch.bean.JschUploadResult;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 基于Jsch SSH上传实现
 */
@Slf4j
@ConditionalOnBean(annotation = EnableSFTP.class)
@Service
public class SftpStorageServiceImpl extends BaseStorageService {

    private static final String STORAGE_TYPE = StorageTypeEnum.SFTP.getDescription();

    @Autowired
    private JschService jschService;

    @PostConstruct
    public void  init(){
        log.debug("----初始化SftpStorageServiceImpl----");
    }

    @Override
    public UploadResult uploadFile(InputStream inputStream, String fileName, String savePath) {
        JschUploadResult jschUploadResult = jschService.uploadFile(inputStream,fileName,savePath);
        return createResult(jschUploadResult);
    }

    @Override
    public List<UploadResult> uploadFile(Map<String, InputStream> inputStreamMap, String savePath) {
        List<UploadResult> uploadResults = null;
        List<JschUploadResult> jschUploadResultList = jschService.uploadFile(inputStreamMap,savePath);
        if(jschUploadResultList != null){
            uploadResults = new ArrayList<>();
            for(JschUploadResult jschUploadResult:jschUploadResultList){
                uploadResults.add(createResult(jschUploadResult));
            }
        }
        return uploadResults;
    }

    @Override
    public UploadResult uploadFile(File file, String savePath) {
        JschUploadResult jschUploadResult = jschService.uploadFile(file,savePath);
        return createResult(jschUploadResult,file);
    }

    @Override
    public UploadResult uploadFile(byte[] fileByte, String fileName, String savePath) {
        JschUploadResult jschUploadResult = jschService.uploadFile(fileByte,fileName,savePath);
        return createResult(jschUploadResult);
    }

    @Override
    public UploadResult uploadNetworkFile(String fileUrl,String fileExt) throws MalformedURLException {
        UploadResult uploadResult = super.uploadNetworkFile(fileUrl, fileExt);
        uploadResult.setStorageType(STORAGE_TYPE);
        return uploadResult;
    }

    /**
     * 删除文件
     *
     * @param fileUrl 文件URL
     * @return -1：删除失败,0：删除成功
     */
    @Override
    public int deleteFile(String fileUrl) {
        return jschService.deleteFile(fileUrl);
    }

    /**
     * 批量删除文件
     *
     * @param listFileUrl 要删除的文件名集合
     * @return -1：删除失败,0：删除成功
     */
    @Override
    public Map<String, Integer> deleteFile(List<String> listFileUrl) {
        return jschService.deleteFile(listFileUrl);
    }

    /**
     * 构建上传返回结果
     * @param jschUploadResult 上传结果
     * @return UploadResult
     */
    private UploadResult createResult(JschUploadResult jschUploadResult,File uploadFile){
        UploadResult uploadResult = createResult(jschUploadResult);
        uploadResult.setFileLength(uploadFile.length());
        return uploadResult;
    }

    /**
     * 构建上传返回结果
     * @param jschUploadResult SFTP上传结果
     * @return UploadResult
     */
    private UploadResult createResult(JschUploadResult jschUploadResult){
        UploadResult uploadResult = null;
        if(jschUploadResult != null){
            uploadResult = new UploadResult();
            uploadResult.setStorageType(STORAGE_TYPE);
            try {
                BeanUtils.copyProperties(uploadResult, jschUploadResult);
                //BeanUtils.copyProperties对于boolean类型的字段赋值不成功
                uploadResult.setUploadSuccess(jschUploadResult.isUploadSuccess());
            } catch (Exception e) {
                uploadResult.setSavePath(jschUploadResult.getSavePath());
                uploadResult.setFileSuffix(jschUploadResult.getFileSuffix());
                uploadResult.setFileUrl(jschUploadResult.getFileUrl());
                uploadResult.setUploadSuccess(jschUploadResult.isUploadSuccess());
                uploadResult.setNewFileName(jschUploadResult.getNewFileName());
                uploadResult.setOriginalFileName(jschUploadResult.getOriginalFileName());
                uploadResult.setUseTime(jschUploadResult.getUseTime());
            }
        }
        return uploadResult;
    }
}
