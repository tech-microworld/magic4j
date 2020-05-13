package com.itgacl.magic4j.modules.schedule.service.impl;

import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.libcommon.exception.Magic4jException;
import com.itgacl.magic4j.modules.schedule.ScheduleStatus;
import com.itgacl.magic4j.modules.schedule.bean.ScheduleJobBean;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJob;
import com.itgacl.magic4j.modules.schedule.service.ScheduleService;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private Scheduler scheduler;

    private final static String JOB_NAME = "TASK_";

    /**
     * 任务调度参数key
     */
    private static final String JOB_PARAM_KEY = "JOB_PARAM_KEY";

    /**
     * 获取触发器key
     */
    private TriggerKey getTriggerKey(Long jobId) {
        return TriggerKey.triggerKey(JOB_NAME + jobId);
    }

    /**
     * 获取jobKey
     */
    private JobKey getJobKey(Long jobId) {
        return JobKey.jobKey(JOB_NAME + jobId);
    }

    /**
     * 获取表达式触发器
     */
    private CronTrigger getCronTrigger(Long jobId) {
        try {
            return (CronTrigger) scheduler.getTrigger(getTriggerKey(jobId));
        } catch (SchedulerException e) {
            throw new Magic4jException("getCronTrigger异常，请检查qrtz开头的表，是否有脏数据", e);
        }
    }

    @Override
    public void createJob(ScheduleJob scheduleJob) {
        try {
            //构建job
            JobDetail jobDetail = JobBuilder.newJob(ScheduleJobBean.class).withIdentity(getJobKey(scheduleJob.getId())).build();

            //构建cron
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression())
                    .withMisfireHandlingInstructionDoNothing();

            //根据cron，构建一个CronTrigger
            CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(getTriggerKey(scheduleJob.getId())).
                    withSchedule(scheduleBuilder).build();

            //放入参数，运行时的方法可以获取
            jobDetail.getJobDataMap().put(JOB_PARAM_KEY, JSON.toJSONString(scheduleJob));

            scheduler.scheduleJob(jobDetail, trigger);

            //暂停任务(定时任务状态  0：正常  1：暂停)
            if(scheduleJob.getStatus() != null && scheduleJob.getStatus() == ScheduleStatus.PAUSE.getValue()){
                pauseJob(scheduleJob.getId());
            }
        } catch (SchedulerException e) {
            throw new Magic4jException("创建定时任务失败", e);
        }
    }

    @Override
    public void updateJob(ScheduleJob scheduleJob) {
        try {
            TriggerKey triggerKey = getTriggerKey(scheduleJob.getId());

            //表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression())
                    .withMisfireHandlingInstructionDoNothing();

            CronTrigger trigger = getCronTrigger(scheduleJob.getId());

            //按新的cronExpression表达式重新构建trigger
            trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

            //参数
            trigger.getJobDataMap().put(JOB_PARAM_KEY, JSON.toJSONString(scheduleJob));
            scheduler.rescheduleJob(triggerKey, trigger);

            //暂停任务
            if(scheduleJob.getStatus() != null && scheduleJob.getStatus() == ScheduleStatus.PAUSE.getValue()){
                pauseJob(scheduleJob.getId());
            }

        } catch (SchedulerException e) {
            throw new Magic4jException("更新定时任务失败", e);
        }
    }

    @Override
    public void runJob(ScheduleJob scheduleJob) {
        try {
            //参数
            JobDataMap dataMap = new JobDataMap();
            dataMap.put(JOB_PARAM_KEY, JSON.toJSONString(scheduleJob));
            scheduler.triggerJob(getJobKey(scheduleJob.getId()), dataMap);
        } catch (SchedulerException e) {
            throw new Magic4jException("立即执行定时任务失败", e);
        }
    }

    @Override
    public void pauseJob(Long jobId) {
        try {
            scheduler.pauseJob(getJobKey(jobId));
        } catch (SchedulerException e) {
            throw new Magic4jException("暂停定时任务失败", e);
        }
    }

    @Override
    public void resumeJob(Long jobId) {
        try {
            scheduler.resumeJob(getJobKey(jobId));
        } catch (SchedulerException e) {
            throw new Magic4jException("恢复定时任务失败", e);
        }
    }

    @Override
    public void deleteJob(Long jobId) {
        try {
            scheduler.deleteJob(getJobKey(jobId));
        } catch (SchedulerException e) {
            throw new Magic4jException("删除定时任务失败", e);
        }
    }
}
