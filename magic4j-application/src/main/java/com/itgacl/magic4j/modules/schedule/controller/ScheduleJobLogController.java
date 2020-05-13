package com.itgacl.magic4j.modules.schedule.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.modules.schedule.dto.ScheduleJobLogDTO;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJob;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJobLog;
import com.itgacl.magic4j.modules.schedule.service.ScheduleJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Classname ScheduleJobLogController
 * @Description 定时任务执行日志 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-17
 * @Version 1.0
 */
@RestController
@RequestMapping("/api/schedule/jobLog")
public class ScheduleJobLogController extends SuperController{

    @Autowired
    private ScheduleJobLogService scheduleJobLogService;

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public R get(@PathVariable("id") Long id){
        ScheduleJobLogDTO scheduleJobLogDTO = scheduleJobLogService.getScheduleJobLogById(id);
        return R.ok(scheduleJobLogDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @GetMapping
    public R get() {
        List<ScheduleJobLogDTO> scheduleJobLogList = scheduleJobLogService.getList(null);
        return R.ok(scheduleJobLogList);
    }

    /**
    * 根据ID批量删除
    * @param ids
    * @return
    */
    @Log(operation="删除",remark = "根据ID删除调度日志",moduleName = "调度日志")
    @Auth(name = "删除",moduleName = "调度日志")//操作权限控制
    @DeleteMapping("/{ids}")
    public R delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            scheduleJobLogService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            scheduleJobLogService.deleteByIds(idList);
        }
        return R.ok();
    }

    @Log(operation="清空数据",remark = "清空调度日志数据",moduleName = "调度日志")
    @Auth(name = "清空",moduleName = "调度日志")
    @DeleteMapping("/clean")
    public R clean(){
        scheduleJobLogService.deleteAll();
        return R.ok();
    }

    /**
      * 分页查询
      * @return
      */
    @GetMapping("/list")
    public R pageList(ScheduleJobLogDTO scheduleJobLogDTO){
        //构建查询条件
        QueryWrapper<ScheduleJobLog> queryWrapper = buildQueryWrapper(scheduleJobLogDTO);
        Page<ScheduleJobLog> page = getPage();//获取mybatisPlus分页对象
        IPage<ScheduleJobLog> pageInfo = scheduleJobLogService.page(page,queryWrapper);//mybatisPlus分页查询
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("total", pageInfo.getTotal());//总记录数
        dataMap.put("rows", pageInfo.getRecords());//列表数据
        dataMap.put("pages", pageInfo.getPages());//总页数
        return R.ok(dataMap);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param scheduleJobLogDTO
     * @return
     */
    private QueryWrapper<ScheduleJobLog> buildQueryWrapper(ScheduleJobLogDTO scheduleJobLogDTO) {
        QueryWrapper<ScheduleJobLog> queryWrapper = new QueryWrapper<>();
        if(StrUtil.isNotEmpty(scheduleJobLogDTO.getJobName())){
            queryWrapper.like(ScheduleJobLog.JOB_NAME,scheduleJobLogDTO.getJobName());
        }
        if(ObjectUtil.isNotEmpty(scheduleJobLogDTO.getStatus())){
            queryWrapper.eq(ScheduleJobLog.STATUS,scheduleJobLogDTO.getStatus());
        }
        if(ObjectUtil.isNotEmpty(scheduleJobLogDTO.getBeginTime())){
            queryWrapper.ge(ScheduleJobLog.CREATE_TIME,scheduleJobLogDTO.getBeginTime());
        }
        if(ObjectUtil.isNotEmpty(scheduleJobLogDTO.getEndTime())){
            queryWrapper.le(ScheduleJobLog.CREATE_TIME,scheduleJobLogDTO.getEndTime());
        }
        queryWrapper.orderByDesc(ScheduleJobLog.CREATE_TIME);
        return queryWrapper;
    }
}