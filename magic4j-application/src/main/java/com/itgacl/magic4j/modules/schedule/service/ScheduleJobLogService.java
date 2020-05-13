package com.itgacl.magic4j.modules.schedule.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.schedule.dto.ScheduleJobLogDTO;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJobLog;

import java.util.List;

/**
 * ScheduleJobLogService
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface ScheduleJobLogService extends IService<ScheduleJobLog> {

    void create(ScheduleJobLogDTO scheduleJobLogDTO);

    void update(ScheduleJobLogDTO scheduleJobLogDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    ScheduleJobLogDTO getScheduleJobLogById(Long id);

    void deleteAll();

    List<ScheduleJobLogDTO> getList(QueryWrapper<ScheduleJobLog> queryWrapper);
}
