package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.excel.ExcelUtil;
import com.itgacl.magic4j.libcommon.util.TreeUtil;
import com.itgacl.magic4j.modules.sys.converter.SysCnAreaConverter;
import com.itgacl.magic4j.modules.sys.dto.SysCnAreaDTO;
import com.itgacl.magic4j.modules.sys.entity.SysCnArea;
import com.itgacl.magic4j.modules.sys.excel.SysCnAreaImporter;
import com.itgacl.magic4j.modules.sys.query.SysCnAreaQuery;
import com.itgacl.magic4j.modules.sys.service.SysCnAreaService;
import com.itgacl.magic4j.modules.sys.vo.AreaTreeVo;
import com.itgacl.magic4j.modules.sys.vo.SysCnAreaVo;
import com.itgacl.magic4j.modules.sys.vo.TreeSelectVo;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @Classname SysCnAreaController
 * @Description 中国行政区域 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-09-04
 * @Version 1.0
 */
@Api(tags = "区域管理")
@Auth(name = "区域管理")//在类上标注了@Auth注解后这个类下的所有接口将被AuthInterceptor拦截进行访问权限控制
@RestController
@RequestMapping("/api/sys/cnArea")
public class SysCnAreaController extends SuperController{

    @Autowired
    private SysCnAreaService sysCnAreaService;

    /**
     * 创建
     * @param sysCnArea
     * @return
     */
    @ApiOperation("新增")
    @Log(operation="创建",remark = "创建SysCnArea",moduleName = "SysCnArea管理") //在方法上标注@Log注解用于记录操作日志
    @PostMapping
    public R<Void> create(@RequestBody @Validated(Constants.Create.class) SysCnAreaDTO sysCnArea){
        sysCnAreaService.create(sysCnArea);
        return R.ok();
    }

    /**
     * 更新
     * @param sysCnArea
     * @return
     */
    @ApiOperation("修改")
    @Log(operation="修改",remark = "修改SysCnArea",moduleName = "SysCnArea管理")
    @PutMapping
    public R<Void> update(@RequestBody @Validated(Constants.Update.class) SysCnAreaDTO sysCnArea){
        sysCnAreaService.update(sysCnArea);
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
    public R<SysCnAreaVo> get(@PathVariable("id") Long id){
        SysCnAreaVo sysCnAreaVo = sysCnAreaService.getSysCnAreaById(id);
        return R.ok(sysCnAreaVo);
    }

    /**
     * 根据条件查询
     * @return
     */
    @ApiOperation("根据条件查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<SysCnAreaVo>> get(SysCnAreaQuery query) {
        //构建查询条件
        QueryWrapper<SysCnArea> queryWrapper = buildQueryWrapper(query);
        List<SysCnAreaVo> sysCnAreaListVo = sysCnAreaService.getList(queryWrapper);
        return R.ok(sysCnAreaListVo);
    }

    /**
    * 根据ID批量删除
    * @param ids
    * @return
    */
    @ApiOperation("根据ID批量删除")
    @Log(operation="删除",remark = "根据ID删除SysCnArea",moduleName = "SysCnArea管理")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysCnAreaService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysCnAreaService.deleteByIds(idList);
        }
        return R.ok();
    }

    @ApiOperation("导入数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "isCovered",value = "是否覆盖，true:覆盖,false:不覆盖",required = true),
            @ApiImplicitParam(name = "parentId",value = "父级ID")
    })
    @PostMapping("/importData")
    public R<Void> importData(@ApiParam(value = "Excel文件", required = true) @RequestParam(value = "file") MultipartFile file, Boolean isCovered,Long parentId) {
        SysCnAreaImporter sysCnAreaImporter = new SysCnAreaImporter(sysCnAreaService, isCovered,parentId);
        ExcelUtil.save(file, sysCnAreaImporter, SysCnAreaDTO.class);
        return R.success("导入成功");
    }


    @ApiOperation("获取数据导入模板")
    @GetMapping("/import/template")
    public void getImportTemplate(HttpServletResponse response) {
        List<SysCnAreaDTO> list = new ArrayList<>();
        ExcelUtil.export(response, "SysCnArea数据导入模板", "SysCnArea数据表", list, SysCnAreaDTO.class);
    }
    /**
      * 分页查询
      * @return
      */
    @ApiOperation("分页查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R<PageData<SysCnAreaVo>> pageList(SysCnAreaQuery query, PageParam pageParam){
        //构建查询条件
        QueryWrapper<SysCnArea> queryWrapper = buildQueryWrapper(query);
        PageData<SysCnAreaVo> pageData = sysCnAreaService.pageList(pageParam,queryWrapper);//mybatisPlus分页查询
        return R.ok(pageData);
    }


    /**
     * 获取区域树列表
     * @return
     */
    @ApiOperation("获取区域树列表")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/tree")
    public R<List<AreaTreeVo>> geAreaTreeList(SysCnAreaQuery query){
        return R.ok(TreeUtil.buildTree(sysCnAreaService.getAreaTree(query)));
    }

    /**
     * 获取区域下拉树列表
     */
    @ApiOperation("获取下拉树列表")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/treeSelect")
    public R<List<TreeSelectVo>> treeSelect(SysCnAreaQuery query) {
        return R.ok(SysCnAreaConverter.build().treeSelectListVo(sysCnAreaService.getAreaTree(query)));
    }

    /**
     * 根据区域ID获取区域信息以及子区域信息
     * @param id
     * @return
     */
    @ApiOperation("根据区域ID获取区域信息以及子区域信息")
    @ApiImplicitParam(name = "id",value = "区域ID",required = true)
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/tree/{id}")
    public R<List<AreaTreeVo>> getAreaTreeById(@PathVariable("id") Long id) {
        List<AreaTreeVo> areaTreeVoList;
        //从缓存中读取
        String areaVoListStr = cacheService.get(id,String.class);
        if(StrUtil.isEmpty(areaVoListStr)){
            areaTreeVoList = sysCnAreaService.getAreaTreeListById(id);
            cacheService.set(id,JSON.toJSONString(areaTreeVoList));
        }else {
            areaTreeVoList = JSON.parseObject(areaVoListStr,new TypeReference<List<AreaTreeVo>>(){});
        }
        return R.ok(TreeUtil.buildTree(areaTreeVoList));
    }

    @ApiOperation("根据区域ID获取区域树")
    @ApiImplicitParam(name = "id",value = "区域ID",required = true)
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/tree/area/{id}")
    public R<AreaTreeVo> getTreeById(@PathVariable("id") Long id) {
        AreaTreeVo areaTreeVo;
        //从缓存中读取
        String areaJsonStr = cacheService.get(id,String.class);
        if(StrUtil.isEmpty(areaJsonStr)){
            areaTreeVo = sysCnAreaService.getAreaTreeById(id);
            cacheService.set(id,JSON.toJSONString(areaTreeVo));
        }else {
            areaTreeVo = JSON.parseObject(areaJsonStr, AreaTreeVo.class);
        }
        return R.ok(areaTreeVo);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param query
     * @return
     */
    private QueryWrapper<SysCnArea> buildQueryWrapper(SysCnAreaQuery query) {
        QueryWrapper<SysCnArea> queryWrapper = new QueryWrapper<>();
        if(query == null){
            return queryWrapper;
        }
        //构建查询条件
        if(query.getId() != null){
            queryWrapper.eq(SysCnArea.ID,query.getId());
        }
        if(StrUtil.isNotBlank(query.getName())){
            queryWrapper.like(SysCnArea.NAME,query.getName());
        }
        if(StrUtil.isNotBlank(query.getShortName())){
            queryWrapper.like(SysCnArea.SHORT_NAME,query.getShortName());
        }
        if(query.getParentId() != null){
            queryWrapper.eq(SysCnArea.PARENT_ID,query.getParentId());
        }
        if(StrUtil.isNotBlank(query.getParentName())){
            queryWrapper.like(SysCnArea.PARENT_NAME,query.getParentName());
        }
        if(StrUtil.isNotBlank(query.getMergerName())){
            queryWrapper.like(SysCnArea.MERGER_NAME,query.getMergerName());
        }
        if(query.getLevel() != null){
            queryWrapper.eq(SysCnArea.LEVEL,query.getLevel());
        }
        if(query.getZipCode() != null){
            queryWrapper.eq(SysCnArea.ZIP_CODE,query.getZipCode());
        }
        if(StrUtil.isNotBlank(query.getCityCode())){
            queryWrapper.like(SysCnArea.CITY_CODE,query.getCityCode());
        }
        if(StrUtil.isNotBlank(query.getAreaCode())){
            queryWrapper.like(SysCnArea.AREA_CODE,query.getAreaCode());
        }
        if(StrUtil.isNotBlank(query.getPinyin())){
            queryWrapper.like(SysCnArea.PINYIN,query.getPinyin());
        }
        if(query.getLng() != null){
            queryWrapper.eq(SysCnArea.LNG,query.getLng());
        }
        if(query.getLat() != null){
            queryWrapper.eq(SysCnArea.LAT,query.getLat());
        }
        if(ArrayUtil.isNotEmpty(query.getIds())){
            queryWrapper.in(SysCnArea.ID,Arrays.asList(query.getIds()));
        }
        return queryWrapper;
    }
}