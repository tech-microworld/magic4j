package com.itgacl.magic4j.modules.schedule.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.modules.schedule.dto.ScheduleJobLogDTO;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJobLog;
import com.itgacl.magic4j.modules.schedule.mapper.ScheduleJobLogMapper;
import com.itgacl.magic4j.modules.schedule.service.ScheduleJobLogService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * ScheduleJobLogService 实现类
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Service
public class ScheduleJobLogServiceImpl extends ServiceImpl<ScheduleJobLogMapper, ScheduleJobLog> implements ScheduleJobLogService {

    @Autowired
    private ScheduleJobLogMapper scheduleJobLogMapper;

    @Override
    public void create(ScheduleJobLogDTO scheduleJobLogDTO) {
        dataValidator.validate(scheduleJobLogDTO);//业务处理校验
        ScheduleJobLog scheduleJobLog = new ScheduleJobLog();
        BeanUtils.copyProperties(scheduleJobLogDTO,scheduleJobLog);
        save(scheduleJobLog);//保存
    }

    @Override
    public void update(ScheduleJobLogDTO scheduleJobLogDTO) {
        dataValidator.validate(scheduleJobLogDTO);//业务处理校验
        ScheduleJobLog scheduleJobLog = new ScheduleJobLog();
        BeanUtils.copyProperties(scheduleJobLogDTO,scheduleJobLog);
        updateById(scheduleJobLog);
    }
 
    @Override
    public void deleteById(Long id) {
        removeById(id);//逻辑删除
    }

    @Override
    public void deleteByIds(List<Long> idList) {
        removeByIds(idList);//逻辑删除
    }

    @Override
    public ScheduleJobLogDTO getScheduleJobLogById(Long id) {
        ScheduleJobLog scheduleJobLog = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,scheduleJobLog);
        ScheduleJobLogDTO scheduleJobLogDTO = new ScheduleJobLogDTO();
        BeanUtils.copyProperties(scheduleJobLog,scheduleJobLogDTO);
        return scheduleJobLogDTO;
    }

    @Override
    public void deleteAll() {
        scheduleJobLogMapper.deleteAll();//全部删除
    }

    @Override
    public List<ScheduleJobLogDTO> getList(QueryWrapper<ScheduleJobLog> queryWrapper) {
        List<ScheduleJobLogDTO> scheduleJobLogDTOList = new ArrayList<>();
        List<ScheduleJobLog> scheduleJobLogList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(scheduleJobLogList)){
            scheduleJobLogList.forEach(scheduleJobLog -> {
                ScheduleJobLogDTO scheduleJobLogDTO = new ScheduleJobLogDTO();
                BeanUtils.copyProperties(scheduleJobLog,scheduleJobLogDTO);
                scheduleJobLogDTOList.add(scheduleJobLogDTO);
            });
        }
        return scheduleJobLogDTOList;
    }

    /**
     * 数据校验器
     */
    private DataValidator<ScheduleJobLogDTO> dataValidator = new DataValidator<ScheduleJobLogDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(ScheduleJobLogDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(ScheduleJobLogDTO data) {

        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(ScheduleJobLogDTO data) {

        }
    };
}
