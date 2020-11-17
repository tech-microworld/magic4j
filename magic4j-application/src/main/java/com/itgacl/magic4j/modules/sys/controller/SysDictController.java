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
import com.itgacl.magic4j.common.cache.sys.SysCache;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.excel.ExcelUtil;
import com.itgacl.magic4j.libcommon.util.DateUtils;
import com.itgacl.magic4j.modules.sys.dto.SysDictDTO;
import com.itgacl.magic4j.modules.sys.dto.SysUserDTO;
import com.itgacl.magic4j.modules.sys.entity.SysDict;
import com.itgacl.magic4j.modules.sys.entity.SysUser;
import com.itgacl.magic4j.modules.sys.excel.DictExcel;
import com.itgacl.magic4j.modules.sys.excel.DictImporter;
import com.itgacl.magic4j.modules.sys.excel.UserExcel;
import com.itgacl.magic4j.modules.sys.excel.UserImporter;
import com.itgacl.magic4j.modules.sys.service.SysDictService;
import io.swagger.annotations.*;
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
 * SysDictController
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Api(tags = "数据字典管理")
@Auth(name = "字典管理")
@RestController
@RequestMapping("/api/sys/dict")
public class SysDictController extends SuperController {

    @Autowired
    private SysDictService sysDictService;

    /**
     * 创建
     * @param sysDict
     * @return
     */
    @ApiOperation("新增")
    @Log(operation="创建",remark = "创建字典",moduleName = "字典管理")
    @PostMapping
    public R<Void> create(@RequestBody @Validated(Constants.Create.class) SysDictDTO sysDict){
        sysDictService.create(sysDict);
        return R.ok();
    }

    /**
     * 更新
     * @param sysDict
     * @return
     */
    @ApiOperation("修改")
    @Log(operation="修改",remark = "修改字典",moduleName = "字典管理")
    @PutMapping
    public R<Void> update(@RequestBody @Validated(Constants.Update.class) SysDictDTO sysDict){
        sysDictService.update(sysDict);
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
    public R<SysDictDTO> get(@PathVariable("id") Long id){
        SysDictDTO sysDictDTO = sysDictService.getSysDictById(id);
        return R.ok(sysDictDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @ApiOperation("查询全部")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<SysDictDTO>> get() {
        List<SysDictDTO> sysDictList = sysDictService.getList(null);
        return R.ok(sysDictList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @ApiOperation("根据ID批量删除")
    @Log(operation="删除",remark = "根据ID批量删除字典",moduleName = "字典管理")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysDictService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysDictService.deleteByIds(idList);
        }
        return R.ok();
    }

    @ApiOperation("根据字典类型获取字典列表")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/type/{dictType}")
    public R<List<SysDictDTO>> getDictByType(@PathVariable("dictType")String dictType){
        QueryWrapper<SysDict> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(SysDict.DICT_TYPE,dictType).orderByDesc(SysDict.SORT_NO);
        List<SysDictDTO> sysDictList = sysDictService.getList(queryWrapper);
        return R.ok(sysDictList);
    }

    /**
     * 分页查询
     * @return
     */
    @ApiOperation("分页查询")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R<PageData<SysDict>> pageList(SysDictDTO sysDictDTO, PageParam pageParam){
        //构建查询条件
        QueryWrapper<SysDict> queryWrapper = buildQueryWrapper(sysDictDTO);
        Page<SysDict> page = getPage(pageParam);//获取mybatisPlus分页对象
        IPage<SysDict> pageInfo = sysDictService.page(page,queryWrapper);//mybatisPlus分页查询
        return R.ok(PageData.build(pageInfo));
    }

    /**
     * 导入数据字典
     */
    @ApiOperation("导入数据字典")
    @ApiImplicitParam(name = "isCovered",value = "是否覆盖，true:覆盖,false:不覆盖")
    @PostMapping("/import")
    public R<Void> importDict(@ApiParam(value = "Excel文件", required = true) @RequestParam(value = "file") MultipartFile file, Boolean isCovered) {
        DictImporter dictImporter = new DictImporter(sysDictService, isCovered);
        ExcelUtil.save(file, dictImporter, DictExcel.class);
        return R.success("导入成功");
    }

    /**
     * 导出数据字典
     */
    @ApiOperation("根据条件查询数据后导出数据字典")
    @GetMapping("/export")
    public void export(SysDictDTO sysDictDTO, HttpServletResponse response) {
        //构建查询条件
        QueryWrapper<SysDict> queryWrapper = buildQueryWrapper(sysDictDTO);
        List<SysDict> sysDictList = sysDictService.list(queryWrapper);
        List<DictExcel> dictExcelList = new ArrayList<>();
        if(CollectionUtil.isNotEmpty(sysDictList)){
            for (SysDict sysDict : sysDictList) {
                DictExcel dictExcel = new DictExcel();
                BeanUtils.copyProperties(sysDict,dictExcel);
                dictExcelList.add(dictExcel);
            }
        }
        if(ArrayUtil.isNotEmpty(sysDictDTO.getExportColumnNames())){
            //导出Excel，指定需要导出的列
            ExcelUtil.export(response, "字典数据" + DateUtils.getCurrentTime(), "数据字典表", dictExcelList, DictExcel.class,Arrays.asList(sysDictDTO.getExportColumnNames()));
        }else {
            //导出Excel，导出全部列
            ExcelUtil.export(response, "字典数据" + DateUtils.getCurrentTime(), "数据字典表", dictExcelList, DictExcel.class);
        }
    }

    /**
     * 获取数据字典导入模板
     */
    @ApiOperation("获取数据字典导入模板")
    @GetMapping("/import/template")
    public void getImportTemplate(HttpServletResponse response) {
        List<DictExcel> list = new ArrayList<>();
        ExcelUtil.export(response, "字典数据导入模板", "字典数据表", list, DictExcel.class);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param sysDictDTO
     * @return
     */
    private QueryWrapper<SysDict> buildQueryWrapper(SysDictDTO sysDictDTO) {
        QueryWrapper<SysDict> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysDict.CREATE_TIME);
        if(StrUtil.isNotEmpty(sysDictDTO.getDictName())){
            queryWrapper.like(SysDict.DICT_NAME,sysDictDTO.getDictName());
        }
        if(StrUtil.isNotEmpty(sysDictDTO.getDictType())){
            queryWrapper.like(SysDict.DICT_TYPE,sysDictDTO.getDictType());
        }
        if(ObjectUtil.isNotEmpty(sysDictDTO.getBeginTime())){
            queryWrapper.ge(SysDict.CREATE_TIME,sysDictDTO.getBeginTime());
        }
        if(ObjectUtil.isNotEmpty(sysDictDTO.getEndTime())){
            queryWrapper.le(SysDict.CREATE_TIME,sysDictDTO.getEndTime());
        }
        if(ArrayUtil.isNotEmpty(sysDictDTO.getDictIds())){
            queryWrapper.in(SysDict.ID,Arrays.asList(sysDictDTO.getDictIds()));
        }
        return queryWrapper;
    }
}