package com.itgacl.magic4j.libcommon.component.storage.controller;

import cn.hutool.core.util.StrUtil;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.storage.StorageFactory;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.component.storage.service.StorageService;
import com.itgacl.magic4j.libcommon.controller.Magic4jBaseController;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.*;

@RestController
@RequestMapping("/api/storage")
public class StorageController extends Magic4jBaseController {

    /**
     * 上传文件，一个或者多个
     * @param files
     * @return
     */
    @PostMapping("/upload")
    public R upload(@RequestParam(value = "file") MultipartFile[] files) {
        //判断file数组不能为空并且长度大于0
        if (files != null && files.length > 0) {
            StorageService storageService = StorageFactory.build();
            List<MultipartFile> multipartFiles = new ArrayList<>(Arrays.asList(files));
            if (multipartFiles.size() == 1) {
                UploadResult uploadResult = storageService.uploadFile(files[0]);
                return R.ok(uploadResult);
            } else {
                //移除multipartFiles集合中文件size等于0的那些文件
                multipartFiles.removeIf(tmpFile -> tmpFile.getSize() == 0);
                Map<String, Object> dataMap = new HashMap<>();
                //保存上传文件
                List<UploadResult> uploadFileList = storageService.uploadFile(multipartFiles);
                dataMap.put("list", uploadFileList);
                return R.ok(dataMap);
            }
        }
        return R.fail("上传文件为空");
    }

    /**
     * 上传网络文件
     *
     * @param fileUrl 文件URL
     * @param fileExt 文件扩展名（不带.）
     * @return FileUploadResult 文件上传结果
     */
    @PostMapping("/uploadNetworkFile")
    public R uploadNetworkFile(String fileUrl, String fileExt) {
        if(StrUtil.isEmpty(fileUrl)){
            return R.fail("要上传的网络文件地址不能为空");
        }
        StorageService storageService = StorageFactory.build();
        UploadResult uploadResult = new UploadResult();
        try {
            if(StrUtil.isEmpty(fileExt)){
                uploadResult = storageService.uploadNetworkFile(fileUrl);
            }else {
                uploadResult = storageService.uploadNetworkFile(fileUrl, fileExt);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            uploadResult.setUploadSuccess(false);
        }
        return R.ok(uploadResult);
    }

    /**
     * 删除文件
     * @param urls 文件的访问URL地址
     * @return
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody String[] urls,String storageType){
        StorageService storageService;
        if(StrUtil.isNotEmpty(storageType)){
            storageService = StorageFactory.build(storageType);
        }else {
            storageService = StorageFactory.build();
        }
        if(urls.length==1){
            int result = storageService.deleteFile(urls[0]);
            return R.ok(result);
        }else {
            List<String> lstFileUrl = Arrays.asList(urls);
            Map<String,Integer> resultMap = storageService.deleteFile(lstFileUrl);
            return R.ok(resultMap);
        }
    }

    /**
     * 下载
     * @param response
     * @param fileUrl
     * @param fileName
     * @return
     */
    @RequestMapping("/download")
    public R download(HttpServletResponse response, HttpServletRequest request, String fileUrl, String fileName){
        if(StrUtil.isNotEmpty(fileName)){
            String userAgent = request.getHeader("User-Agent");
            // 针对IE或者以IE为内核的浏览器：
            if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
                try {
                    fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    logger.error(e.getMessage(),e);
                }
            } else {
                // 非IE浏览器的处理：
                try {
                    fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
                } catch (UnsupportedEncodingException e) {
                    logger.error(e.getMessage(),e);
                }
            }
        }else {
            fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
        }

        StorageFactory.build().downloadFile(response,fileUrl,fileName);
        return null;
    }
}
