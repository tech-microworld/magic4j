package com.itgacl.magic4j.modules.schedule.bean;

import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.libcommon.util.IpUtil;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;
import com.itgacl.magic4j.modules.schedule.ScheduleRunnable;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJob;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJobLog;
import com.itgacl.magic4j.modules.schedule.service.ScheduleJobLogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.time.LocalDateTime;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * 定时任务Bean
 */
@Slf4j
@DisallowConcurrentExecution//@DisallowConcurrentExecution注解保证任务的串行
public class ScheduleJobBean extends QuartzJobBean {

    /**
     * 任务调度参数key
     */
    private static final String JOB_PARAM_KEY = "JOB_PARAM_KEY";
    private ExecutorService service = Executors.newSingleThreadExecutor();//任务调度线程池

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        String jsonJob = context.getMergedJobDataMap().getString(JOB_PARAM_KEY);
        ScheduleJob scheduleJob = JSON.parseObject(jsonJob, ScheduleJob.class);
        //获取scheduleJobLogService
        ScheduleJobLogService scheduleJobLogService = SpringContextUtils.getBean(ScheduleJobLogService.class);
        //保存执行记录到数据库
        ScheduleJobLog scheduleJobLog = new ScheduleJobLog();
        scheduleJobLog.setJobId(scheduleJob.getId());
        scheduleJobLog.setJobName(scheduleJob.getJobName());
        scheduleJobLog.setBeanName(scheduleJob.getBeanName());
        scheduleJobLog.setMethodName(scheduleJob.getMethodName());
        scheduleJobLog.setParams(scheduleJob.getParams());
        scheduleJobLog.setCreateTime(LocalDateTime.now());
        scheduleJobLog.setServerIp(IpUtil.getLocalIP());//获取执行定时任务的服务器的IP地址
        //任务开始时间
        long startTime = System.currentTimeMillis();
        try {
            //执行任务
            log.debug("任务准备执行，任务ID：" + scheduleJob.getId());
            ScheduleRunnable task = new ScheduleRunnable(scheduleJob.getBeanName(), scheduleJob.getMethodName(), scheduleJob.getParams());
            Future<?> future = service.submit(task);
            future.get();
            //任务执行总时长
            long times = System.currentTimeMillis() - startTime;
            scheduleJobLog.setTimes((int)times);
            //任务状态    0：成功    1：失败
            scheduleJobLog.setStatus(0);
            log.debug("任务执行完毕，任务ID：" + scheduleJob.getId() + "  总共耗时：" + times + "毫秒");
        } catch (Exception e) {
            log.error("任务执行失败，任务ID：" + scheduleJob.getId(), e);
            //任务执行总时长
            long times = System.currentTimeMillis() - startTime;
            scheduleJobLog.setTimes((int)times);
            //任务状态    0：成功    1：失败
            scheduleJobLog.setStatus(1);
            scheduleJobLog.setError(StringUtils.substring(e.toString(), 0, 2000));
            //todo 发送预警邮件到指定的邮箱
        }finally {
            scheduleJobLogService.save(scheduleJobLog);
        }
    }
}
