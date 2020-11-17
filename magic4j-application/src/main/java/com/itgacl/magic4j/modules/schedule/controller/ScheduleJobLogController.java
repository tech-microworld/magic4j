package com.itgacl.magic4j.modules.schedule.controller;

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
import com.itgacl.magic4j.modules.schedule.dto.ScheduleJobLogDTO;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJobLog;
import com.itgacl.magic4j.modules.schedule.service.ScheduleJobLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * @Classname ScheduleJobLogController
 * @Description 定时任务执行日志 Controller
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-17
 * @Version 1.0
 */
@Api(tags = "调度日志管理")
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
    @ApiOperation(value = "根据ID查找")
    @GetMapping("/{id}")
    public R<ScheduleJobLogDTO> get(@PathVariable("id") Long id){
        ScheduleJobLogDTO scheduleJobLogDTO = scheduleJobLogService.getScheduleJobLogById(id);
        return R.ok(scheduleJobLogDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @ApiOperation(value = "查询全部")
    @GetMapping
    public R<List<ScheduleJobLogDTO>> get() {
        List<ScheduleJobLogDTO> scheduleJobLogList = scheduleJobLogService.getList(null);
        return R.ok(scheduleJobLogList);
    }

    /**
    * 根据ID批量删除
    * @param ids
    * @return
    */
    @ApiOperation(value = "根据ID批量删除")
    @Log(operation="删除",remark = "根据ID删除调度日志",moduleName = "调度日志")
    @Auth(name = "删除",moduleName = "调度日志")//操作权限控制
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            scheduleJobLogService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            scheduleJobLogService.deleteByIds(idList);
        }
        return R.ok();
    }

    @ApiOperation(value = "清空调度日志数据")
    @Log(operation="清空数据",remark = "清空调度日志数据",moduleName = "调度日志")
    @Auth(name = "清空",moduleName = "调度日志")
    @DeleteMapping("/clean")
    public R<Void> clean(){
        scheduleJobLogService.deleteAll();
        return R.ok();
    }

    /**
      * 分页查询
      * @return
      */
    @ApiOperation(value = "分页查询")
    @GetMapping("/list")
    public R<PageData<ScheduleJobLog>> pageList(ScheduleJobLogDTO scheduleJobLogDTO,PageParam pageParam){
        //构建查询条件
        QueryWrapper<ScheduleJobLog> queryWrapper = buildQueryWrapper(scheduleJobLogDTO);
        Page<ScheduleJobLog> page = getPage(pageParam);//获取mybatisPlus分页对象
        IPage<ScheduleJobLog> pageInfo = scheduleJobLogService.page(page,queryWrapper);//mybatisPlus分页查询
        return R.ok(PageData.build(pageInfo));
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