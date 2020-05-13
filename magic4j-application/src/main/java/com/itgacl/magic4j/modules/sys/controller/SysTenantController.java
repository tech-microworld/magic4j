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
import com.itgacl.magic4j.modules.sys.dto.SysTenantDTO;
import com.itgacl.magic4j.modules.sys.entity.SysRole;
import com.itgacl.magic4j.modules.sys.entity.SysTenant;
import com.itgacl.magic4j.modules.sys.service.SysTenantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * SysTenantController
 * @author 孤傲苍狼
 * @since 2020-04-02
 */
@Auth(name = "租户管理")
@RestController
@RequestMapping("/api/sys/tenant")
public class SysTenantController extends SuperController{

    @Autowired
    private SysTenantService sysTenantService;

    /**
     * 创建
     * @param sysTenant
     * @return
     */
    @Log(operation="创建",remark = "创建租户",moduleName = "租户管理")
    @PostMapping
    public R create(@RequestBody @Validated(Constants.Create.class) SysTenantDTO sysTenant){
        sysTenantService.create(sysTenant);
        return R.ok();
    }

    /**
     * 更新
     * @param sysTenant
     * @return
     */
    @Log(operation="修改",remark = "修改租户",moduleName = "租户管理")
    @PutMapping
    public R update(@RequestBody @Validated(Constants.Update.class) SysTenantDTO sysTenant){
        sysTenantService.update(sysTenant);
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
        SysTenantDTO sysTenantDTO = sysTenantService.getSysTenantById(id);
        return R.ok(sysTenantDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R get() {
        List<SysTenantDTO> sysTenantList = sysTenantService.getList(null);
        return R.ok(sysTenantList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @Log(operation="删除",remark = "根据ID批量删除",moduleName = "租户管理")
    @DeleteMapping("/{ids}")
    public R delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysTenantService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysTenantService.deleteByIds(idList);
        }
        return R.ok();
    }

    /**
     * 分页查询
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R pageList(SysTenantDTO sysTenantDTO){
        //构建查询条件
        QueryWrapper<SysTenant> queryWrapper = buildQueryWrapper(sysTenantDTO);
        Page<SysTenant> page = getPage();//获取mybatisPlus分页对象
        IPage<SysTenant> pageInfo = sysTenantService.page(page,queryWrapper);//mybatisPlus分页查询
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("total", pageInfo.getTotal());//总记录数
        dataMap.put("rows", pageInfo.getRecords());//列表数据
        dataMap.put("pages", pageInfo.getPages());//总页数
        return R.ok(dataMap);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param sysTenantDTO
     * @return
     */
    private QueryWrapper<SysTenant> buildQueryWrapper(SysTenantDTO sysTenantDTO) {
        QueryWrapper<SysTenant> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysTenant.CREATE_TIME);
        if(StrUtil.isNotEmpty(sysTenantDTO.getName())){
            queryWrapper.like(SysTenant.NAME,sysTenantDTO.getName());
        }
        if(ObjectUtil.isNotEmpty(sysTenantDTO.getStatus())){
            queryWrapper.eq(SysTenant.STATUS,sysTenantDTO.getStatus());
        }
        return queryWrapper;
    }
}