package com.itgacl.magic4j.modules.schedule.mapper;

import com.itgacl.magic4j.modules.schedule.entity.ScheduleJobLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 定时任务执行日志 Mapper 接口
 * </p>
 *
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface ScheduleJobLogMapper extends BaseMapper<ScheduleJobLog> {
    /**
     * 删除全部
     */
    void deleteAll();
}
