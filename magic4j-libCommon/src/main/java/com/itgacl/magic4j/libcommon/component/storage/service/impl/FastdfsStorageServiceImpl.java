package com.itgacl.magic4j.libcommon.component.storage.service.impl;

import com.itgacl.fastdfs.FastdfsService;
import com.itgacl.fastdfs.annotation.EnableFastDFS;
import com.itgacl.fastdfs.bean.FastDFSUploadResult;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.component.storage.enums.StorageTypeEnum;
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
 * 基于Fastdfs上传实现
 */
@Slf4j
@ConditionalOnBean(annotation = EnableFastDFS.class)
@Service
public class FastdfsStorageServiceImpl extends BaseStorageService {

    private static final String STORAGE_TYPE = StorageTypeEnum.FASTDFS.getDescription();

    @Autowired
    private FastdfsService fastdfsService;

    @PostConstruct
    public void  init(){
        log.debug("----初始化FastdfsStorageServiceImpl----");
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
        FastDFSUploadResult fastDFSUploadResult = fastdfsService.uploadFile(inputStream,fileName);//fastDFS不支持自定义存储路径
        return createResult(fastDFSUploadResult);
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
        List<FastDFSUploadResult> fastDFSUploadResults = fastdfsService.uploadFile(inputStreamMap);
        if(fastDFSUploadResults != null){
            for(FastDFSUploadResult fastDFSUploadResult:fastDFSUploadResults){
                uploadResultList.add(createResult(fastDFSUploadResult));
            }
        }
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
        FastDFSUploadResult fastDFSUploadResult = fastdfsService.uploadFile(file);
        return createResult(fastDFSUploadResult,file);
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
        FastDFSUploadResult fastDFSUploadResult = fastdfsService.uploadFile(fileByte,fileName);
        return createResult(fastDFSUploadResult);
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
        return fastdfsService.deleteFile(fileUrl);
    }

    /**
     * 批量删除文件
     *
     * @param listFileUrl 要删除的文件URL集合
     * @return -1：删除失败,0：删除成功
     */
    @Override
    public Map<String, Integer> deleteFile(List<String> listFileUrl) {
        return fastdfsService.deleteFile(listFileUrl);
    }


    /**
     * 构建上传返回结果
     * @param fastDFSUploadResult 上传结果
     * @return UploadResult
     */
    private UploadResult createResult(FastDFSUploadResult fastDFSUploadResult, File uploadFile){
        UploadResult uploadResult = createResult(fastDFSUploadResult);
        uploadResult.setFileLength(uploadFile.length());
        return uploadResult;
    }

    /**
     * 构建上传返回结果
     * @param fastDFSUploadResult FastDFS上传结果
     * @return UploadResult
     */
    private UploadResult createResult(FastDFSUploadResult fastDFSUploadResult){
        UploadResult uploadResult = null;
        if(fastDFSUploadResult != null){
            uploadResult = new UploadResult();
            uploadResult.setStorageType(STORAGE_TYPE);
            try {
                BeanUtils.copyProperties(uploadResult, fastDFSUploadResult);
                uploadResult.setSavePath(fastDFSUploadResult.getFileId());
                uploadResult.setUploadSuccess(fastDFSUploadResult.isUploadSuccess());
            } catch (Exception e) {
                uploadResult.setSavePath(fastDFSUploadResult.getFileId());
                uploadResult.setFileSuffix(fastDFSUploadResult.getFileSuffix());
                uploadResult.setFileUrl(fastDFSUploadResult.getFileUrl());
                uploadResult.setUploadSuccess(fastDFSUploadResult.isUploadSuccess());
                uploadResult.setNewFileName(fastDFSUploadResult.getNewFileName());
                uploadResult.setOriginalFileName(fastDFSUploadResult.getOriginalFileName());
                uploadResult.setUseTime(fastDFSUploadResult.getUseTime());
            }
        }
        return uploadResult;
    }
}
