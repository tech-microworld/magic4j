package com.itgacl.magic4j.modules.demo.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.DateUtils;
import com.itgacl.magic4j.modules.demo.service.MiniappUserService;
import com.itgacl.magic4j.modules.demo.entity.MiniappUser;
import com.itgacl.magic4j.modules.demo.vo.MiniappUserVo;
import com.itgacl.magic4j.modules.demo.dto.MiniappUserDTO;
import com.itgacl.magic4j.modules.demo.query.MiniappUserQuery;
import com.itgacl.magic4j.modules.demo.excel.MiniappUserImporter;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import com.itgacl.magic4j.libcommon.excel.ExcelUtil;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
/**
 * @Classname MiniappUserController
 * @Description 微信小程序用户信息表 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
@Api(tags = "MiniappUser管理")
//@Auth(name = "MiniappUser管理")//在类上标注了@Auth注解后这个类下的所有接口将被AuthInterceptor拦截进行访问权限控制
@RestController
@RequestMapping("/api/demo/miniappUser")
public class MiniappUserController extends SuperController{

    @Autowired
    private MiniappUserService miniappUserService;

    /**
     * 创建
     * @param miniappUser
     * @return
     */
    @ApiOperation("新增")
    @Log(operation="创建",remark = "创建MiniappUser",moduleName = "MiniappUser管理") //在方法上标注@Log注解用于记录操作日志
    @PostMapping
    public R<Void> create(@RequestBody @Validated(Constants.Create.class) MiniappUserDTO miniappUser){
        miniappUserService.create(miniappUser);
        return R.ok();
    }

    /**
     * 更新
     * @param miniappUser
     * @return
     */
    @ApiOperation("修改")
    @Log(operation="修改",remark = "修改MiniappUser",moduleName = "MiniappUser管理")
    @PutMapping
    public R<Void> update(@RequestBody @Validated(Constants.Update.class) MiniappUserDTO miniappUser){
        miniappUserService.update(miniappUser);
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
    public R<MiniappUserVo> get(@PathVariable("id") Long id){
        MiniappUserVo miniappUserVo = miniappUserService.getMiniappUserById(id);
        return R.ok(miniappUserVo);
    }

    /**
     * 根据条件查询
     * @return
     */
    @ApiOperation("根据条件查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<MiniappUserVo>> get(MiniappUserQuery query) {
        //构建查询条件
        QueryWrapper<MiniappUser> queryWrapper = buildQueryWrapper(query);
        List<MiniappUserVo> miniappUserListVo = miniappUserService.getList(queryWrapper);
        return R.ok(miniappUserListVo);
    }

    /**
    * 根据ID批量删除
    * @param ids
    * @return
    */
    @ApiOperation("根据ID批量删除")
    @Log(operation="删除",remark = "根据ID删除MiniappUser",moduleName = "MiniappUser管理")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            miniappUserService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            miniappUserService.deleteByIds(idList);
        }
        return R.ok();
    }

    @ApiOperation("导入数据")
    @ApiImplicitParam(name = "isCovered",value = "是否覆盖，true:覆盖,false:不覆盖")
    @PostMapping("/importData")
    public R<Void> importData(@ApiParam(value = "Excel文件", required = true) @RequestParam(value = "file") MultipartFile file, Boolean isCovered) {
        MiniappUserImporter miniappUserImporter = new MiniappUserImporter(miniappUserService, isCovered);
        ExcelUtil.save(file, miniappUserImporter, MiniappUserDTO.class);
        return R.ok();
    }

    @ApiOperation("导出数据到Excel")
    @GetMapping("/exportData")
    public void exportData(MiniappUserQuery query, HttpServletResponse response) {
        //构建查询条件
        QueryWrapper<MiniappUser> queryWrapper = buildQueryWrapper(query);
        List<MiniappUserVo> miniappUserVoList = miniappUserService.getList(queryWrapper);
        if(CollectionUtil.isNotEmpty(miniappUserVoList)){
            if(ArrayUtil.isNotEmpty(query.getExportColumnNames())){
                //导出Excel，指定需要导出的列
                ExcelUtil.export(response, "MiniappUser" + DateUtils.getCurrentTime(), "MiniappUser数据表", miniappUserVoList, MiniappUserVo.class,Arrays.asList(query.getExportColumnNames()));
            }else {
                //导出Excel，导出全部列
                ExcelUtil.export(response, "MiniappUser" + DateUtils.getCurrentTime(), "MiniappUser数据表", miniappUserVoList, MiniappUserVo.class);
            }
        }
    }

    @ApiOperation("导出数据到Excel并上传到文件服务器")
    @PostMapping("/exportData")
    public R<UploadResult> exportData(@RequestBody MiniappUserQuery query) {
        //构建查询条件
        QueryWrapper<MiniappUser> queryWrapper = buildQueryWrapper(query);
        List<MiniappUserVo> miniappUserVoList = miniappUserService.getList(queryWrapper);
        UploadResult uploadResult;
        if(ArrayUtil.isNotEmpty(query.getExportColumnNames())){
            //导出Excel并上传到文件服务器，指定需要导出的列
            uploadResult = ExcelUtil.exportAndUpload("MiniappUser" + DateUtils.getCurrentTime(), "MiniappUser数据表", miniappUserVoList, MiniappUserVo.class,Arrays.asList(query.getExportColumnNames()));
        }else {
            //导出Excel并上传到文件服务器，导出全部列
            uploadResult = ExcelUtil.exportAndUpload("MiniappUser" + DateUtils.getCurrentTime(), "MiniappUser数据表", miniappUserVoList, MiniappUserVo.class);
        }
        return R.ok(uploadResult);
    }

    @ApiOperation("获取数据导入模板")
    @GetMapping("/import/template")
    public void getImportTemplate(HttpServletResponse response) {
        List<MiniappUserDTO> list = new ArrayList<>();
        ExcelUtil.export(response, "MiniappUser数据导入模板", "MiniappUser数据表", list, MiniappUserDTO.class);
    }
    /**
      * 分页查询
      * @return
      */
    @ApiOperation("分页查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R<PageData<MiniappUserVo>> pageList(MiniappUserQuery query, PageParam pageParam){
        //构建查询条件
        QueryWrapper<MiniappUser> queryWrapper = buildQueryWrapper(query);
        PageData<MiniappUserVo> pageData = miniappUserService.pageList(pageParam,queryWrapper);//mybatisPlus分页查询
        return R.ok(pageData);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param query
     * @return
     */
    private QueryWrapper<MiniappUser> buildQueryWrapper(MiniappUserQuery query) {
        QueryWrapper<MiniappUser> queryWrapper = new QueryWrapper<>();
        //构建查询条件
        if(query.getId() != null){
            queryWrapper.eq(MiniappUser.ID,query.getId());
        }
        if(StrUtil.isNotBlank(query.getOpenId())){
            queryWrapper.like(MiniappUser.OPEN_ID,query.getOpenId());
        }
        if(StrUtil.isNotBlank(query.getNickName())){
            queryWrapper.like(MiniappUser.NICK_NAME,query.getNickName());
        }
        if(StrUtil.isNotBlank(query.getGender())){
            queryWrapper.like(MiniappUser.GENDER,query.getGender());
        }
        if(StrUtil.isNotBlank(query.getLanguage())){
            queryWrapper.like(MiniappUser.LANGUAGE,query.getLanguage());
        }
        if(StrUtil.isNotBlank(query.getCity())){
            queryWrapper.like(MiniappUser.CITY,query.getCity());
        }
        if(StrUtil.isNotBlank(query.getProvince())){
            queryWrapper.like(MiniappUser.PROVINCE,query.getProvince());
        }
        if(StrUtil.isNotBlank(query.getCountry())){
            queryWrapper.like(MiniappUser.COUNTRY,query.getCountry());
        }
        if(StrUtil.isNotBlank(query.getAvatarUrl())){
            queryWrapper.like(MiniappUser.AVATAR_URL,query.getAvatarUrl());
        }
        if(StrUtil.isNotBlank(query.getPhoneNumber())){
            queryWrapper.like(MiniappUser.PHONE_NUMBER,query.getPhoneNumber());
        }
        if(StrUtil.isNotBlank(query.getUnionId())){
            queryWrapper.like(MiniappUser.UNION_ID,query.getUnionId());
        }
        if(ArrayUtil.isNotEmpty(query.getIds())){
            queryWrapper.in(MiniappUser.ID,Arrays.asList(query.getIds()));
        }
        return queryWrapper;
    }
}