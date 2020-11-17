package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.annotation.Validator;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.storage.StorageFactory;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.modules.sys.dto.SysFileDTO;
import com.itgacl.magic4j.modules.sys.entity.SysFile;
import com.itgacl.magic4j.modules.sys.service.SysFileService;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * @Classname SysFileController
 * @Description 文件管理 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-25
 * @Version 1.0
 */
@Api(tags = "文件管理")
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
    @ApiOperation("文件上传，支持同时上传多个文件")
    @Log(operation="上传",remark = "上传文件",moduleName = "文件管理")
    @PostMapping("/upload")
    public R<List<UploadResult>> upload(@ApiParam(value = "上传文件", required = true) @RequestParam(value = "file") MultipartFile[] files) {
        //判断file数组不能为空并且长度大于0
        if (files != null && files.length > 0) {
            List<MultipartFile> multipartFiles = new ArrayList<>(Arrays.asList(files));
            //移除multipartFiles集合中文件size等于0的那些文件
            multipartFiles.removeIf(tmpFile -> tmpFile.getSize() == 0);
            //上传文件
            List<UploadResult> uploadFileList = sysFileService.uploadFile(multipartFiles);
            return R.ok(uploadFileList);
        }
        return R.fail("上传文件为空");
    }

    /**
     * 存储方式设置
     * @param storageType
     * @return
     */
    @ApiOperation("存储方式设置")
    @ApiImplicitParam(name = "storageType",value = "存储方式",required = true)
    @Log(operation="存储设置",remark = "存储方式设置",moduleName = "文件管理")
    @Validator(value = "storageType",message = "存储方式不能为空")
    @PutMapping("/storageType/setting")
    public R<Void> storageTypeSetting(String storageType){
        sysFileService.storageTypeSetting(storageType);
        return R.ok();
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
            @ApiImplicitParam(name = "fileUrl",value = "文件URL",required = true),
            @ApiImplicitParam(name = "fileExt",value = "文件扩展名（不带.）")
    })
    @Validator(value = "fileUrl",message = "要上传的网络文件地址不能为空")
    @Log(operation="上传",remark = "上传网络文件",moduleName = "文件管理")
    @PostMapping("/uploadNetworkFile")
    public R<UploadResult> uploadNetworkFile(String fileUrl, String fileExt) {
        UploadResult uploadResult = new UploadResult();
        try {
            uploadResult = sysFileService.uploadNetworkFile(fileUrl, fileExt);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            uploadResult.setUploadSuccess(false);
        }
        return R.ok(uploadResult);
    }

    @ApiOperation("获取存储方式")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/storageType")
    public R<String> getCurrStorageType(){
        return R.ok(bizCacheService.getStorageType());
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
            @ApiImplicitParam(name = "fileUrl",value = "文件URL",required = true),
            @ApiImplicitParam(name = "fileName",value = "下载后的文件名")
    })
    @Log(operation="下载",remark = "下载文件",moduleName = "文件管理")
    @Validator(value = "fileUrl",message = "要下载的文件地址不能为空")
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

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @ApiOperation("根据ID查找文件")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}")
    public R<SysFileDTO> get(@PathVariable("id") Long id){
        SysFileDTO sysFileDTO = sysFileService.getSysFileById(id);
        return R.ok(sysFileDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @ApiOperation("查询全部文件")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<SysFileDTO>> get() {
        List<SysFileDTO> sysFileList = sysFileService.getList(null);
        return R.ok(sysFileList);
    }

    /**
    * 根据ID批量删除
    * @param ids
    * @return
    */
    @ApiOperation("根据ID批量删除")
    @Log(operation="删除",remark = "根据ID删除文件",moduleName = "文件管理")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
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
    @ApiOperation("分页查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R<PageData<SysFile>> pageList(SysFileDTO sysFileDTO, PageParam pageParam){
        //构建查询条件
        QueryWrapper<SysFile> queryWrapper = buildQueryWrapper(sysFileDTO);
        Page<SysFile> page = getPage(pageParam);//获取mybatisPlus分页对象
        IPage<SysFile> pageInfo = sysFileService.page(page,queryWrapper);//mybatisPlus分页查询
        return R.ok(PageData.build(pageInfo));
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