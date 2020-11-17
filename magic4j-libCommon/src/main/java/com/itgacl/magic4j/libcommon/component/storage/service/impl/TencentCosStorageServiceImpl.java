package com.itgacl.magic4j.libcommon.component.storage.service.impl;

import com.itgacl.cloud.storage.annotation.EnableCos;
import com.itgacl.cloud.storage.service.TencentCosStorageService;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.component.storage.enums.StorageTypeEnum;
import com.itgacl.magic4j.libcommon.util.FileUtil;
import com.itgacl.magic4j.libcommon.util.GUIDUtil;
import com.itgacl.magic4j.libcommon.util.MD5Util;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
@ConditionalOnBean(annotation = EnableCos.class)
@Service
public class TencentCosStorageServiceImpl extends BaseStorageService {

    private static final String STORAGE_TYPE = StorageTypeEnum.TENCENT_COS.getDescription();

    @Autowired
    private TencentCosStorageService cosStorageService;

    @PostConstruct
    public void  init(){
        log.debug("----初始化TencentCosStorageServiceImpl----");
    }

    /**
     * 上传文件
     *
     * @param inputStream 文件输入流
     * @param fileName    文件名(带后缀,如1.png,2.jpg)
     * @param savePath    文件上传后的保存目录
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadFile(InputStream inputStream, String fileName, String savePath) {
        UploadResult uploadResult = new UploadResult();
        uploadResult.setStorageType(STORAGE_TYPE);
        Long startTime = System.currentTimeMillis();
        try{
            uploadResult.setFileLength((long) inputStream.available());
            String ext = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();// 后缀名
            uploadResult.setOriginalFileName(fileName);
            uploadResult.setFileSuffix(ext);
            String newFileName = GUIDUtil.genRandomGUID()+"."+ext;
            uploadResult.setNewFileName(newFileName);
            byte[] bytes = FileUtil.input2ByteArray(inputStream);
            String fileUrl = cosStorageService.upload(bytes,savePath+"/"+newFileName);//上传文件
            uploadResult.setFileUrl(fileUrl);
            uploadResult.setSavePath(cosStorageService.getSavePath(fileUrl));
            uploadResult.setFileMd5(MD5Util.getBytesMD5(bytes));
            uploadResult.setUploadSuccess(true);
        }catch (Exception e){
            uploadResult.setUploadSuccess(false);//上传失败
        }
        Long endTime = System.currentTimeMillis();
        uploadResult.setUseTime(endTime-startTime);
        return uploadResult;
    }

    /**
     * 一次性上传多个文件
     *
     * @param inputStreamMap 以原始文件名(带后缀,如1.png,2.jpg)为key的输入流Map
     * @param savePath       文件上传后的保存目录
     * @return List<UploadResult> 上传结果集合
     */
    @Override
    public List<UploadResult> uploadFile(Map<String, InputStream> inputStreamMap, String savePath) {
        List<UploadResult> uploadResultList = new ArrayList<>();
        inputStreamMap.forEach((fileName,inputStream)->{
            UploadResult uploadResult = uploadFile(inputStream, fileName, savePath);
            uploadResultList.add(uploadResult);
        });
        return uploadResultList;
    }

    /**
     * 上传文件
     *
     * @param file     要上传的文件
     * @param savePath 文件上传后的保存目录
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadFile(File file, String savePath) {
        try {
            return uploadFile(FileUtil.file2ByteArray(file),file.getName(),savePath);
        } catch (IOException e) {
            log.error(e.getMessage(),e);
        }
        return null;
    }

    /**
     * 上传文件
     *
     * @param fileByte 文件字节数组
     * @param fileName 文件名(带后缀,如1.png,2.jpg)
     * @param savePath 文件上传后的保存目录
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadFile(byte[] fileByte, String fileName, String savePath) {
        UploadResult uploadResult = new UploadResult();
        uploadResult.setStorageType(STORAGE_TYPE);
        Long startTime = System.currentTimeMillis();
        try{
            uploadResult.setFileLength((long) fileByte.length);
            String ext = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();// 后缀名
            uploadResult.setOriginalFileName(fileName);
            uploadResult.setFileSuffix(ext);
            String newFileName = GUIDUtil.genRandomGUID()+"."+ext;
            uploadResult.setNewFileName(newFileName);
            String fileUrl = cosStorageService.upload(fileByte,savePath+"/"+newFileName);
            uploadResult.setFileUrl(fileUrl);
            uploadResult.setSavePath(cosStorageService.getSavePath(fileUrl));
            uploadResult.setFileMd5(MD5Util.getBytesMD5(fileByte));
            uploadResult.setUploadSuccess(true);
        }catch (Exception e){
            uploadResult.setUploadSuccess(false);//上传失败
        }
        Long endTime = System.currentTimeMillis();
        uploadResult.setUseTime(endTime-startTime);
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
        try {
            cosStorageService.deleteFile(fileUrl);
            return 0;
        }catch (Exception e){
            log.error(e.getMessage(),e);
            return -1;
        }
    }

    /**
     * 批量删除文件
     *
     * @param listFileUrl 要删除的文件URL集合
     * @return -1：删除失败,0：删除成功
     */
    @Override
    public Map<String, Integer> deleteFile(List<String> listFileUrl) {
        cosStorageService.deleteFile(listFileUrl);
        return null;
    }
}
