package com.itgacl.magic4j.libcommon.component.storage.controller;

import cn.hutool.core.util.StrUtil;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.storage.StorageFactory;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.component.storage.service.StorageService;
import com.itgacl.magic4j.libcommon.controller.Magic4jBaseController;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Api(tags = "文件存储")
@RestController
@RequestMapping("/api/storage")
public class StorageController extends Magic4jBaseController {

    /**
     * 上传文件，一个或者多个
     * @param files
     * @return
     */
    @ApiOperation("上传文件")
    @PostMapping(value = "/upload",consumes="multipart/form-data")//添加headers处理swagger文件上传出现的【Current request is not a multipart request】问题
    public R upload(@ApiParam(value = "文件", required = true) @RequestParam(value = "file") MultipartFile[] files) {
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
    @ApiOperation("上传网络文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "fileUrl",value = "文件网络URL地址",required = true),
            @ApiImplicitParam(name = "fileExt",value = "文件扩展名（不带.）",required = true)
    })
    @PostMapping("/uploadNetworkFile")
    public R<UploadResult> uploadNetworkFile(String fileUrl, String fileExt) {
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
    @ApiOperation("删除文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "urls",value = "文件的访问URL地址",required = true),
            @ApiImplicitParam(name = "storageType",value = "存储方式",required = true)
    })
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
    @ApiOperation("下载文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "fileUrl",value = "文件的访问URL地址",required = true),
            @ApiImplicitParam(name = "fileName",value = "下载后的文件名")
    })
    @GetMapping("/download")
    public void download(HttpServletResponse response, HttpServletRequest request, String fileUrl, String fileName){
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
                fileName = new String(fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
            }
        }else {
            fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
        }

        StorageFactory.build().downloadFile(response,fileUrl,fileName);
    }
}
