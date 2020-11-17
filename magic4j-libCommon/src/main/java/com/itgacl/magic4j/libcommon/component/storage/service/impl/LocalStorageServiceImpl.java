package com.itgacl.magic4j.libcommon.component.storage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.component.storage.enums.StorageTypeEnum;
import com.itgacl.magic4j.libcommon.util.FileUtil;
import com.itgacl.magic4j.libcommon.util.GUIDUtil;
import com.itgacl.magic4j.libcommon.util.MD5Util;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * 本地存储
 */
@Slf4j
@Service
public class LocalStorageServiceImpl extends BaseStorageService {

    private static final String STORAGE_TYPE = StorageTypeEnum.LOCAL.getDescription();

    @Value("${magic4j.storage.local.fileSavePath}")
    private String fileSavePath; //上传文件本地文件保存目录

    @Value("${magic4j.storage.local.fileUrlPathPattern}")
    private String fileUrlPathPattern; //上传到本地服务器的文件的访问映射

    @Autowired
    private HttpServletRequest request;//注入request对象

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
        try {
            return uploadFile(FileUtil.input2ByteArray(inputStream),fileName,savePath);
        } catch (IOException e) {
           log.error(e.getMessage(),e);
        }
        return null;
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
            if(uploadResult!=null){
                uploadResultList.add(uploadResult);
            }
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

    @Override
    public UploadResult uploadFile(byte[] fileByte, String fileName, String savePath) {
        UploadResult uploadResult = new UploadResult();
        Long startTime = System.currentTimeMillis();
        try {
            if(StringUtils.isNotEmpty(savePath)){
                if(savePath.startsWith("/")){
                    fileSavePath = fileSavePath + savePath;
                }else {
                    fileSavePath = fileSavePath  + "/" + savePath;
                }
            }
            File file = new File(fileSavePath);
            if(!file.exists()){
                file.mkdirs();//创建目录
            }
            String fileSuffix = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();// 后缀名
            String newFileName = GUIDUtil.genRandomGUID()+"."+fileSuffix;
            String filePath = fileSavePath + "/" + newFileName;
            FileUtil.saveFile(filePath,fileByte);
            uploadResult.setFileSuffix(fileSuffix);//后缀
            String fileUrl = getFileUrl(newFileName);//访问URL
            uploadResult.setFileUrl(fileUrl);
            uploadResult.setNewFileName(newFileName);
            uploadResult.setUploadSuccess(true);
            uploadResult.setOriginalFileName(fileName);
            uploadResult.setSavePath(filePath);
            uploadResult.setFileMd5(MD5Util.getBytesMD5(fileByte));
            uploadResult.setFileLength((long) fileByte.length);
            uploadResult.setStorageType(STORAGE_TYPE);
            Long endTime = System.currentTimeMillis();
            uploadResult.setUseTime(endTime-startTime);
        } catch (IOException e) {
            log.error(e.getMessage(),e);
            uploadResult.setUploadSuccess(false);
        }
        return uploadResult;
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
        String tmpFileUrlPath = fileUrlPathPattern.replaceAll("\\*", "");
        String fileName = fileUrl.substring(fileUrl.lastIndexOf(tmpFileUrlPath)+tmpFileUrlPath.length()-1);
        boolean delRes = cn.hutool.core.io.FileUtil.del(fileSavePath + fileName);
        return delRes ? 0 : -1;
    }

    /**
     * 批量删除文件
     *
     * @param listFileUrl 要删除的文件URL集合
     * @return -1：删除失败,0：删除成功
     */
    @Override
    public Map<String, Integer> deleteFile(List<String> listFileUrl) {
        Map<String, Integer> resultMap = new HashMap<>();
        listFileUrl.forEach(fileUrl->{
            int delRes = deleteFile(fileUrl);
            resultMap.put(fileUrl,delRes);
        });
        return resultMap;
    }

    /**
     * 获取本地上传文件访问URL
     * @param newFileName
     * @return
     * @throws UnknownHostException
     */
    private String getFileUrl(String newFileName) throws UnknownHostException {
        String serverAddress;
        String domain = request.getServerName();//获取服务器域名
        int port = request.getServerPort();//获取服务器端口
        InetAddress address= InetAddress.getByName(request.getServerName());
        String ip = address.getHostAddress();//获取服务器IP地址
        if(StrUtil.isNotEmpty(domain)){
            serverAddress = domain;
        }else {
            serverAddress = ip;
        }
        return String.format("http://%s:%s%s%s",serverAddress,port,fileUrlPathPattern.replaceAll("\\*",""),newFileName);
    }
}
