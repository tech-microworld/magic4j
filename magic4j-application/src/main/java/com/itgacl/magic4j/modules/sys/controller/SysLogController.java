package com.itgacl.magic4j.modules.sys.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.modules.sys.dto.SysLogDTO;
import com.itgacl.magic4j.modules.sys.entity.SysLog;
import com.itgacl.magic4j.modules.sys.service.SysLogService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * SysLogController
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Auth(name = "日志管理")
@RestController
@RequestMapping(value = "/api/sys/log")
public class SysLogController extends SuperController {

    @Autowired
    private SysLogService sysLogService;

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}")
    public R get(@PathVariable("id") Long id){
        SysLogDTO sysLogDTO = sysLogService.getSysLogById(id);
        return R.ok(sysLogDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R get() {
        List<SysLogDTO> sysLogList = sysLogService.getList(null);
        return R.ok(sysLogList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @DeleteMapping("/{ids}")
    public R delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysLogService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysLogService.deleteByIds(idList);
        }
        return R.ok();
    }


    /**
     * 删除全部
     * @return
     */
    @DeleteMapping("/clean")
    public R clean(SysLogDTO sysDictDTO){
        QueryWrapper<SysLog> queryWrapper = buildQueryWrapper(sysDictDTO);
        sysLogService.delete(queryWrapper);
        return R.ok();
    }

    /**
     * 分页查询日志
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R pageList(SysLogDTO sysDictDTO){
        //构建查询条件
        QueryWrapper<SysLog> queryWrapper = buildQueryWrapper(sysDictDTO);
        Page<SysLog> page = getPage();//获取mybatisPlus分页对象
        IPage<SysLog> pageInfo = sysLogService.page(page,queryWrapper);//mybatisPlus分页查询
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("total", pageInfo.getTotal());//总记录数
        dataMap.put("rows", pageInfo.getRecords());//列表数据
        dataMap.put("pages", pageInfo.getPages());//总页数
        return R.ok(dataMap);
    }

    /**
     * 获取模块名称
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/module/list")
    public R getModuleList(){
        List<String> moduleNameList = sysLogService.getModuleNameList();
        List<Map<String,String>> mapList = new ArrayList<>();
        if(CollectionUtils.isNotEmpty(moduleNameList)){
            for(String moduleName:moduleNameList){
                Map<String,String> map = new HashMap<>();
                map.put("id",moduleName);
                map.put("name",moduleName);
                mapList.add(map);
            }
        }
        return R.ok(mapList);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param sysLogDTO
     * @return
     */
    private QueryWrapper<SysLog> buildQueryWrapper(SysLogDTO sysLogDTO) {
        QueryWrapper<SysLog> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysLog.CREATE_TIME);
        if(StrUtil.isNotEmpty(sysLogDTO.getUsername())){
            queryWrapper.like(SysLog.USERNAME,sysLogDTO.getUsername());
        }
        if(StrUtil.isNotEmpty(sysLogDTO.getModuleName())){
            queryWrapper.like(SysLog.MODULE_NAME,sysLogDTO.getModuleName());
        }
        if(ObjectUtil.isNotEmpty(sysLogDTO.getStatus())){
            queryWrapper.eq(SysLog.STATUS,sysLogDTO.getStatus());
        }
        if(ObjectUtil.isNotEmpty(sysLogDTO.getLogType())){
            queryWrapper.eq(SysLog.LOG_TYPE,sysLogDTO.getLogType());
        }
        if(ObjectUtil.isNotEmpty(sysLogDTO.getBeginTime())){
            queryWrapper.ge(SysLog.CREATE_TIME,sysLogDTO.getBeginTime());
        }
        if(ObjectUtil.isNotEmpty(sysLogDTO.getEndTime())){
            queryWrapper.le(SysLog.CREATE_TIME,sysLogDTO.getEndTime());
        }
        return queryWrapper;
    }
}