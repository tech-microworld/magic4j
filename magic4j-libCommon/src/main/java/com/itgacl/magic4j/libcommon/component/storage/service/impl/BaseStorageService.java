package com.itgacl.magic4j.libcommon.component.storage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.component.storage.service.StorageService;
import com.itgacl.magic4j.libcommon.util.FileUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public abstract class BaseStorageService implements StorageService {
    /**
     * 上传文件
     *
     * @param filePath 文件所在的路径(绝对路径)
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadFile(String filePath) {
        return uploadFile(filePath,"");
    }

    /**
     * 上传文件
     *
     * @param filePath 文件所在的路径(绝对路径)
     * @param savePath 文件上传后的保存目录
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadFile(String filePath, String savePath) {
        File file = new File(filePath);
        return uploadFile(file,savePath);
    }

    /**
     * 上传文件
     *
     * @param inputStream 文件输入流
     * @param fileName    原始文件名(带后缀,如1.png,2.jpg)
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadFile(InputStream inputStream, String fileName) {
        return uploadFile(inputStream, fileName, "");
    }

    /**
     * 上传文件
     *
     * @param multipartFile
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadFile(MultipartFile multipartFile) {
        UploadResult uploadResult;
        String fileName = multipartFile.getOriginalFilename();// 文件名
        try {
            uploadResult = uploadFile(multipartFile.getBytes(),fileName);
        } catch (IOException e) {
            log.error(e.getMessage(),e);
            uploadResult = new UploadResult();
            uploadResult.setOriginalFileName(fileName);
            uploadResult.setUploadSuccess(false);
        }
        return uploadResult;
    }

    /**
     * 一次性上传多个文件
     *
     * @param multipartFiles
     * @return
     */
    @Override
    public List<UploadResult> uploadFile(List<MultipartFile> multipartFiles) {
        Map<String, InputStream> inputStreamMap = new HashMap<>();
        for(MultipartFile multipartFile:multipartFiles){
            try {
                inputStreamMap.put(multipartFile.getOriginalFilename(),multipartFile.getInputStream());
            } catch (IOException e) {
               log.error(e.getMessage(),e);
            }
        }
        //一次性上传多个文件
        return uploadFile(inputStreamMap);
    }

    /**
     * 一次性上传多个文件
     *
     * @param inputStreamMap 以原始文件名(带后缀,如1.png,2.jpg)为key的输入流Map
     * @return List<UploadResult> 上传结果集合
     */
    @Override
    public List<UploadResult> uploadFile(Map<String, InputStream> inputStreamMap) {
        return uploadFile(inputStreamMap,"");
    }

    /**
     * 上传文件
     *
     * @param fileByte 文件字节数组
     * @param fileName 文件名(带后缀,如1.png,2.jpg)
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadFile(byte[] fileByte, String fileName) {
        return uploadFile(fileByte,fileName, "");
    }

    /**
     * 上传网络文件
     *
     * @param fileUrl 文件URL
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadNetworkFile(String fileUrl) throws MalformedURLException {
        return uploadNetworkFile(fileUrl,"");
    }

    /**
     * 上传网络文件
     *
     * @param fileUrl 文件URL
     * @param fileExt 文件扩展名（不带.）
     * @return UploadResult 上传结果
     */
    @Override
    public UploadResult uploadNetworkFile(String fileUrl, String fileExt) throws MalformedURLException {
        //下载网络文件
        byte[] content = FileUtil.downloadNetworkFile(fileUrl);
        String ext;
        String fileName;
        if(StrUtil.isNotEmpty(fileExt)){
            ext = fileExt;
            fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1,fileUrl.lastIndexOf(".")).toLowerCase()+"."+ext;
        }else{
            fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
        }
        return uploadFile(content,fileName);
    }

    @Override
    public void downloadFile(HttpServletResponse response, String fileUrl, String fileName) {
        BufferedInputStream inputStream;
        BufferedOutputStream bos = null;
        try {
            URL ur = new URL(fileUrl);
            inputStream = new BufferedInputStream(ur.openStream());
            response.setContentType("application/octet-stream");
            //response.setContentType("application/force-download");// 设置强制下载不打开
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            int bytesRead = 0;
            bos = new BufferedOutputStream(response.getOutputStream());
            byte[] buffer = new byte[1024];
            //开始向网络传输文件流
            while ((bytesRead = inputStream.read(buffer, 0, 1024)) != -1) {
                bos.write(buffer, 0, bytesRead);
            }
            bos.flush();
            inputStream.close();
            bos.close();
        } catch (Exception e) {
            log.error("下载文件出现错误，错误信息是：{}", e.getMessage());
        } finally {
            //关闭流
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    log.error("关闭输入流失败，" + e.getMessage());
                }
            }
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    log.error("关闭输出流失败，" + e.getMessage());
                }
            }
        }
    }
}
