package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.modules.sys.dto.SysDictDTO;
import com.itgacl.magic4j.modules.sys.entity.SysConfig;
import com.itgacl.magic4j.modules.sys.entity.SysDict;
import com.itgacl.magic4j.modules.sys.service.SysDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * SysDictController
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
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
    @Log(operation="创建",remark = "创建字典",moduleName = "字典管理")
    @PostMapping
    public R create(@RequestBody @Validated(Constants.Create.class) SysDictDTO sysDict){
        sysDictService.create(sysDict);
        return R.ok();
    }

    /**
     * 更新
     * @param sysDict
     * @return
     */
    @Log(operation="修改",remark = "修改字典",moduleName = "字典管理")
    @PutMapping
    public R update(@RequestBody @Validated(Constants.Update.class) SysDictDTO sysDict){
        sysDictService.update(sysDict);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}")
    public R get(@PathVariable("id") Long id){
        SysDictDTO sysDictDTO = sysDictService.getSysDictById(id);
        return R.ok(sysDictDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R get() {
        List<SysDictDTO> sysDictList = sysDictService.getList(null);
        return R.ok(sysDictList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @Log(operation="删除",remark = "根据ID批量删除字典",moduleName = "字典管理")
    @DeleteMapping("/{ids}")
    public R delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysDictService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysDictService.deleteByIds(idList);
        }
        return R.ok();
    }

    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/type/{dictType}")
    public R getDictByType(@PathVariable("dictType")String dictType){
        QueryWrapper<SysDict> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(SysDict.DICT_TYPE,dictType).orderByDesc(SysDict.SORT_NO);
        List<SysDictDTO> sysDictList = sysDictService.getList(queryWrapper);
        return R.ok(sysDictList);
    }

    /**
     * 分页查询
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R pageList(SysDictDTO sysDictDTO){
        //构建查询条件
        QueryWrapper<SysDict> queryWrapper = buildQueryWrapper(sysDictDTO);
        Page<SysDict> page = getPage();//获取mybatisPlus分页对象
        IPage<SysDict> pageInfo = sysDictService.page(page,queryWrapper);//mybatisPlus分页查询
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("total", pageInfo.getTotal());//总记录数
        dataMap.put("rows", pageInfo.getRecords());//列表数据
        dataMap.put("pages", pageInfo.getPages());//总页数
        return R.ok(dataMap);
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
        return queryWrapper;
    }
}