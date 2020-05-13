package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.storage.StorageFactory;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.component.storage.service.StorageService;
import com.itgacl.magic4j.libcommon.constant.Constants;

import com.itgacl.magic4j.modules.sys.service.SysFileService;
import com.itgacl.magic4j.modules.sys.entity.SysFile;
import com.itgacl.magic4j.modules.sys.dto.SysFileDTO;

import cn.hutool.core.collection.CollectionUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * @Classname SysFileController
 * @Description 文件管理 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-25
 * @Version 1.0
 */
@Auth(name = "文件管理")//在类上标注了@Auth注解后这个类下的所有接口将被AuthInterceptor拦截进行访问权限控制
@RestController
@RequestMapping("/api/sys/file")
public class SysFileController extends SuperController{

    @Autowired
    private SysFileService sysFileService;

    /**
     * 上传
     * @param files
     * @return
     */
    @Log(operation="上传",remark = "上传文件",moduleName = "文件管理")
    @PostMapping("/upload")
    public R upload(@RequestParam(value = "file") MultipartFile[] files) {
        //判断file数组不能为空并且长度大于0
        if (files != null && files.length > 0) {
            List<MultipartFile> multipartFiles = new ArrayList<>(Arrays.asList(files));
            if (multipartFiles.size() == 1) {
                UploadResult uploadResult = sysFileService.uploadFile(files[0]);
                return R.ok(uploadResult);
            } else {
                //移除multipartFiles集合中文件size等于0的那些文件
                multipartFiles.removeIf(tmpFile -> tmpFile.getSize() == 0);
                Map<String, Object> dataMap = new HashMap<>();
                //保存上传文件
                List<UploadResult> uploadFileList = sysFileService.uploadFile(multipartFiles);
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
    @Log(operation="上传",remark = "上传网络文件",moduleName = "文件管理")
    @PostMapping("/uploadNetworkFile")
    public R uploadNetworkFile(String fileUrl, String fileExt) {
        if(StrUtil.isEmpty(fileUrl)){
            return R.fail("要上传的网络文件地址不能为空");
        }
        UploadResult uploadResult = new UploadResult();
        try {
            uploadResult = sysFileService.uploadNetworkFile(fileUrl, fileExt);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            uploadResult.setUploadSuccess(false);
        }
        return R.ok(uploadResult);
    }

    /**
     * 存储方式设置
     * @param storageType
     * @return
     */
    @Log(operation="存储设置",remark = "存储方式设置",moduleName = "文件管理")
    @PutMapping("/storageType/setting")
    public R storageTypeSetting(String storageType){
        sysFileService.storageTypeSetting(storageType);
        return R.ok();
    }

    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/storageType")
    public R getCurrStorageType(){
        return R.ok(bizCacheService.getStorageType());
    }

    /**
     * 下载
     * @param response
     * @param fileUrl
     * @param fileName
     * @return
     */
    @Log(operation="下载",remark = "下载文件",moduleName = "文件管理")
    @GetMapping("/download")
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

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}")
    public R get(@PathVariable("id") Long id){
        SysFileDTO sysFileDTO = sysFileService.getSysFileById(id);
        return R.ok(sysFileDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R get() {
        List<SysFileDTO> sysFileList = sysFileService.getList(null);
        return R.ok(sysFileList);
    }

    /**
    * 根据ID批量删除
    * @param ids
    * @return
    */
    @Log(operation="删除",remark = "根据ID删除文件",moduleName = "文件管理")
    @DeleteMapping("/{ids}")
    public R delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysFileService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysFileService.deleteByIds(idList);
        }
        return R.ok();
    }

    /**
      * 分页查询
      * @return
      */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R pageList(SysFileDTO sysFileDTO){
        //构建查询条件
        QueryWrapper<SysFile> queryWrapper = buildQueryWrapper(sysFileDTO);
        Page<SysFile> page = getPage();//获取mybatisPlus分页对象
        IPage<SysFile> pageInfo = sysFileService.page(page,queryWrapper);//mybatisPlus分页查询
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("total", pageInfo.getTotal());//总记录数
        dataMap.put("rows", pageInfo.getRecords());//列表数据
        dataMap.put("pages", pageInfo.getPages());//总页数
        return R.ok(dataMap);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param sysFileDTO
     * @return
     */
    private QueryWrapper<SysFile> buildQueryWrapper(SysFileDTO sysFileDTO) {
        QueryWrapper<SysFile> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysFile.CREATE_TIME);
        if(StrUtil.isNotEmpty(sysFileDTO.getOriginalFileName())){
            queryWrapper.like(SysFile.ORIGINAL_FILE_NAME,sysFileDTO.getOriginalFileName());
        }
        return queryWrapper;
    }
}