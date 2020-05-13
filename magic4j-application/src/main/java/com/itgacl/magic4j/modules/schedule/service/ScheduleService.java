package com.itgacl.magic4j.modules.schedule.service;


import com.itgacl.magic4j.modules.schedule.entity.ScheduleJob;

public interface ScheduleService {

    /**
     * 创建定时任务
     * @param scheduleJob
     */
    void createJob(ScheduleJob scheduleJob);

    /**
     * 更新定时任务
     * @param scheduleJob
     */
    void updateJob(ScheduleJob scheduleJob);

    /**
     * 立即执行任务
     * @param scheduleJob
     */
    void runJob(ScheduleJob scheduleJob);

    /**
     * 暂停任务
     * @param jobId
     */
    void pauseJob(Long jobId);

    /**
     * 恢复任务
     * @param jobId
     */
    void resumeJob(Long jobId);

    /**
     * 删除定时任务
     * @param jobId
     */
    void deleteJob(Long jobId);
}
