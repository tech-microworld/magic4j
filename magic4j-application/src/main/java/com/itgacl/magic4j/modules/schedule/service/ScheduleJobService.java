package com.itgacl.magic4j.modules.schedule.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.schedule.dto.ScheduleJobDTO;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJob;

import java.util.List;

/**
 * ScheduleJobService
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface ScheduleJobService extends IService<ScheduleJob> {

    void create(ScheduleJobDTO scheduleJobDTO);

    void update(ScheduleJobDTO scheduleJobDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    ScheduleJobDTO getScheduleJobById(Long id);

    void deleteAll();

    List<ScheduleJobDTO> getList(QueryWrapper<ScheduleJob> queryWrapper);

    /**
     * 立即执行
     */
    void run(List<Long> idList);

    /**
     * 暂停运行
     */
    void pause(List<Long> idList);

    /**
     * 恢复运行
     */
    void resume(List<Long> idList);
}
