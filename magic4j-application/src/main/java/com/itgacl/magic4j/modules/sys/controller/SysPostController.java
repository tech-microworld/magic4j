package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.excel.ExcelUtil;
import com.itgacl.magic4j.libcommon.util.DateUtils;
import com.itgacl.magic4j.modules.sys.dto.SysPostDTO;
import com.itgacl.magic4j.modules.sys.entity.SysPost;
import com.itgacl.magic4j.modules.sys.excel.PostExcel;
import com.itgacl.magic4j.modules.sys.excel.PostImporter;
import com.itgacl.magic4j.modules.sys.service.SysPostService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @Classname SysPostController
 * @Description 岗位信息表 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-06
 * @Version 1.0
 */
@Api(tags = "岗位管理")
@Auth(name = "岗位管理")//在类上标注了@Auth注解后这个类下的所有接口将被AuthInterceptor拦截进行访问权限控制
@RestController
@RequestMapping("/api/sys/post")
public class SysPostController extends SuperController{

    @Autowired
    private SysPostService sysPostService;

    /**
     * 创建
     * @param sysPost
     * @return
     */
    @ApiOperation("新增")
    @Log(operation="创建",remark = "创建岗位",moduleName = "岗位管理") //在方法上标注@Log注解用于记录操作日志
    @PostMapping
    public R<Void> create(@RequestBody @Validated(Constants.Create.class) SysPostDTO sysPost){
        sysPostService.create(sysPost);
        return R.ok();
    }

    /**
     * 更新
     * @param sysPost
     * @return
     */
    @ApiOperation("修改")
    @Log(operation="修改",remark = "修改岗位",moduleName = "岗位管理")
    @PutMapping
    public R<Void> update(@RequestBody @Validated(Constants.Update.class) SysPostDTO sysPost){
        sysPostService.update(sysPost);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @ApiOperation("根据ID查找")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}")
    public R<SysPostDTO> get(@PathVariable("id") Long id){
        SysPostDTO sysPostDTO = sysPostService.getSysPostById(id);
        return R.ok(sysPostDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @ApiOperation("查询全部")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<SysPostDTO>> get() {
        List<SysPostDTO> sysPostList = sysPostService.getList(null);
        return R.ok(sysPostList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @ApiOperation("根据ID批量删除")
    @Log(operation="删除",remark = "根据ID删除岗位",moduleName = "岗位管理")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysPostService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysPostService.deleteByIds(idList);
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
    public R<PageData<SysPost>> pageList(SysPostDTO sysPostDTO, PageParam pageParam){
        //构建查询条件
        QueryWrapper<SysPost> queryWrapper = buildQueryWrapper(sysPostDTO);
        Page<SysPost> page = getPage(pageParam);//获取mybatisPlus分页对象
        IPage<SysPost> pageInfo = sysPostService.page(page,queryWrapper);//mybatisPlus分页查询
        return R.ok(PageData.build(pageInfo));
    }

    /**
     * 导入岗位
     */
    @ApiOperation("数据导入")
    @ApiImplicitParam(name = "isCovered",value = "是否覆盖，true:覆盖,false:不覆盖")
    @PostMapping("/import")
    public R<Void> importExcel(@ApiParam(value = "Excel文件", required = true) @RequestParam(value = "file") MultipartFile file, Boolean isCovered) {
        PostImporter postImporter = new PostImporter(sysPostService, isCovered);
        ExcelUtil.save(file, postImporter, PostExcel.class);
        return R.success("导入成功");
    }

    @ApiOperation("根据条件查询数据后导出岗位Excel")
    @PostMapping("/export")
    public R<UploadResult> exportExcel(@RequestBody SysPostDTO sysPostDTO) {
        //构建查询条件
        QueryWrapper<SysPost> queryWrapper = buildQueryWrapper(sysPostDTO);
        List<SysPost> sysPostList = sysPostService.list(queryWrapper);
        List<PostExcel> postExcelList = new ArrayList<>();
        if(CollectionUtil.isNotEmpty(sysPostList)){
            for (SysPost sysPost : sysPostList) {
                PostExcel postExcel = new PostExcel();
                BeanUtils.copyProperties(sysPost,postExcel);
                postExcelList.add(postExcel);
            }
        }
        UploadResult uploadResult;
        if(ArrayUtil.isNotEmpty(sysPostDTO.getExportColumnNames())){
            //导出Excel，指定需要导出的列
            uploadResult = ExcelUtil.exportAndUpload( "岗位数据" + DateUtils.getCurrentTime(), "岗位数据表", postExcelList, PostExcel.class,Arrays.asList(sysPostDTO.getExportColumnNames()));
        }else {
            //导出Excel，导出全部列
            uploadResult = ExcelUtil.exportAndUpload( "岗位数据" + DateUtils.getCurrentTime(), "岗位数据表", postExcelList, PostExcel.class);
        }
        if(uploadResult.isUploadSuccess()){
            return R.ok(uploadResult);
        }else {
            return R.fail("导出失败");
        }
    }

    @ApiOperation("获取岗位导入模板")
    @GetMapping("/import/template")
    public void getImportTemplate(HttpServletResponse response) {
        List<PostExcel> list = new ArrayList<>();
        ExcelUtil.export(response, "岗位数据导入模板", "岗位数据表", list, PostExcel.class);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param sysPostDTO
     * @return
     */
    private QueryWrapper<SysPost> buildQueryWrapper(SysPostDTO sysPostDTO) {
        QueryWrapper<SysPost> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysPost.CREATE_TIME);
        if(StrUtil.isNotEmpty(sysPostDTO.getPostName())){
            queryWrapper.like(SysPost.POST_NAME,sysPostDTO.getPostName());
        }
        if(StrUtil.isNotEmpty(sysPostDTO.getPostCode())){
            queryWrapper.like(SysPost.POST_CODE,sysPostDTO.getPostCode());
        }
        if(ObjectUtil.isNotEmpty(sysPostDTO.getStatus())){
            queryWrapper.eq(SysPost.STATUS,sysPostDTO.getStatus());
        }
        if(ObjectUtil.isNotEmpty(sysPostDTO.getPostCategory())){
            queryWrapper.eq(SysPost.POST_CATEGORY,sysPostDTO.getPostCategory());
        }
        if(ArrayUtil.isNotEmpty(sysPostDTO.getPostIds())){
            queryWrapper.in(SysPost.ID,Arrays.asList(sysPostDTO.getPostIds()));
        }
        return queryWrapper;
    }
}