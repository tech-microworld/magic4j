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
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.modules.schedule.dto.ScheduleJobDTO;
import com.itgacl.magic4j.modules.schedule.dto.ScheduleJobLogDTO;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJob;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJobLog;
import com.itgacl.magic4j.modules.schedule.service.ScheduleJobService;
import org.quartz.TriggerUtils;
import org.quartz.impl.triggers.CronTriggerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * ScheduleJobController
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Auth(name = "定时任务")
@RestController
@RequestMapping(value = "/api/schedule/job")
public class ScheduleJobController extends SuperController {

    @Autowired
    private ScheduleJobService scheduleJobService;

    /**
     * 创建
     * @param scheduleJob
     * @return
     */
    @Log(operation="新增任务",remark = "新增定时任务",moduleName = "定时任务")//使用自定义的Log注解记录操作日志
    @PostMapping
    public R create(@RequestBody @Validated(Constants.Create.class) ScheduleJobDTO scheduleJob){
        scheduleJobService.create(scheduleJob);
        return R.ok();
    }

    /**
     * 更新
     * @param scheduleJob
     * @return
     */
    @Log(operation="修改任务",remark = "修改定时任务",moduleName = "定时任务")
    @PutMapping
    public R update(@RequestBody @Validated(Constants.Update.class) ScheduleJobDTO scheduleJob){
        scheduleJobService.update(scheduleJob);
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
        ScheduleJobDTO scheduleJobDTO = scheduleJobService.getScheduleJobById(id);
        return R.ok(scheduleJobDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R get() {
        List<ScheduleJobDTO> scheduleJobList = scheduleJobService.getList(null);
        return R.ok(scheduleJobList);
    }

    /**
     * 根据ID批量删除
     * @param ids
     * @return
     */
    @Log(operation="删除任务",remark = "删除定时任务",moduleName = "定时任务")
    @DeleteMapping("/{ids}")
    public R delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            scheduleJobService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            scheduleJobService.deleteByIds(idList);
        }
        return R.ok();
    }

    /**
     * 分页查询
     * @return
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/list")
    public R pageList(ScheduleJobDTO scheduleJobDTO){
        //构建查询条件
        QueryWrapper<ScheduleJob> queryWrapper = buildQueryWrapper(scheduleJobDTO);
        Page<ScheduleJob> page = getPage();//获取mybatisPlus分页对象
        IPage<ScheduleJob> pageInfo = scheduleJobService.page(page,queryWrapper);//mybatisPlus分页查询
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("total", pageInfo.getTotal());//总记录数
        dataMap.put("rows", pageInfo.getRecords());//列表数据
        dataMap.put("pages", pageInfo.getPages());//总页数
        return R.ok(dataMap);
    }

    /**
     * 构建查询条件QueryWrapper
     * @param scheduleJobDTO
     * @return
     */
    private QueryWrapper<ScheduleJob> buildQueryWrapper(ScheduleJobDTO scheduleJobDTO) {
        QueryWrapper<ScheduleJob> queryWrapper = new QueryWrapper<>();
        if(StrUtil.isNotEmpty(scheduleJobDTO.getJobName())){
            queryWrapper.like(ScheduleJob.JOB_NAME,scheduleJobDTO.getJobName());
        }
        if(ObjectUtil.isNotEmpty(scheduleJobDTO.getStatus())){
            queryWrapper.eq(ScheduleJob.STATUS,scheduleJobDTO.getStatus());
        }
        if(ObjectUtil.isNotEmpty(scheduleJobDTO.getAuthor())){
            queryWrapper.eq(ScheduleJob.AUTHOR,scheduleJobDTO.getAuthor());
        }
        queryWrapper.orderByDesc(ScheduleJob.CREATE_TIME);
        return queryWrapper;
    }

    /**
     * 执行定时任务
     * @param ids 要执行的资源ID，以逗号分隔
     * @return
     */
    @Log(operation="执行任务",remark = "执行定时任务",moduleName = "定时任务")
    @PutMapping("/run/{ids}")
    public R run(@PathVariable("ids") Long[] ids){
        List<Long> idList = Arrays.asList(ids);
        scheduleJobService.run(idList);
        return R.ok();
    }

    /**
     * 暂停定时任务
     * @param ids 资源ID，以逗号分隔
     * @return
     */
    @Log(operation="暂停任务",remark = "暂停定时任务",moduleName = "定时任务")
    @PutMapping("/pause/{ids}")
    public R pause(@PathVariable("ids") Long[] ids){
        List<Long> idList = Arrays.asList(ids);
        scheduleJobService.pause(idList);
        return R.ok();
    }

    /**
     * 恢复定时任务
     * @param ids 资源ID，以逗号分隔
     * @return
     */
    @Log(operation="恢复任务",remark = "恢复定时任务",moduleName = "定时任务")
    @PutMapping("/resume/{ids}")
    public R resume(@PathVariable("ids") Long[] ids){
        List<Long> idList = Arrays.asList(ids);
        scheduleJobService.resume(idList);
        return R.ok();
    }

    /**
     * 根据cron表达式计算出最近n次的执行具体时间，默认是计算出最近5次
     * @param cronExpression
     * @param n
     * @return
     * @throws ParseException
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/countExecuteTimes")
    public R countExecuteTimes(String cronExpression, @RequestParam(defaultValue = "4") int n) throws ParseException {
        CronTriggerImpl cronTriggerImpl = new CronTriggerImpl();
        cronTriggerImpl.setCronExpression(cronExpression);
        Calendar calendar = Calendar.getInstance();
        Date now = calendar.getTime();
        calendar.add(Calendar.MONTH, 1);// 把统计的区间段设置为从现在到1月后的今天（主要是为了方法通用考虑)
        // 这里的时间是根据corn表达式算出来的值
        List<Date> dates = TriggerUtils.computeFireTimesBetween(
                cronTriggerImpl, null, now,
                calendar.getTime());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<String> dateList = new ArrayList<>();
        for (int i=0; i<dates.size();i++) {
            if(i>n){
                break;
            }
            dateList.add(dateFormat.format(dates.get(i)));
        }
        return R.ok(dateList);
    }
}