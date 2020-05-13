package com.itgacl.magic4j.modules.schedule.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.modules.schedule.ScheduleStatus;
import com.itgacl.magic4j.modules.schedule.dto.ScheduleJobDTO;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.schedule.entity.ScheduleJob;
import com.itgacl.magic4j.modules.schedule.mapper.ScheduleJobMapper;
import com.itgacl.magic4j.modules.schedule.service.ScheduleJobService;
import com.itgacl.magic4j.modules.schedule.service.ScheduleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * ScheduleJobService 实现类
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Service
public class ScheduleJobServiceImpl extends ServiceImpl<ScheduleJobMapper, ScheduleJob> implements ScheduleJobService {

    @Autowired
    private ScheduleService scheduleService;

    @Transactional //涉及到多表操作，开启事务
    @Override
    public void create(ScheduleJobDTO scheduleJobDTO) {
        dataValidator.validate(scheduleJobDTO);//业务处理校验
        ScheduleJob scheduleJob = new ScheduleJob();
        BeanUtils.copyProperties(scheduleJobDTO,scheduleJob);
        save(scheduleJob);//保存
        scheduleService.createJob(scheduleJob);
    }

    @Transactional
    @Override
    public void update(ScheduleJobDTO scheduleJobDTO) {
        dataValidator.validate(scheduleJobDTO);//业务处理校验
        ScheduleJob scheduleJob = new ScheduleJob();
        BeanUtils.copyProperties(scheduleJobDTO,scheduleJob);
        scheduleService.updateJob(scheduleJob);
        updateById(scheduleJob);
    }

    @Transactional
    @Override
    public void deleteById(Long id) {
        scheduleService.deleteJob(id);
        removeById(id);//逻辑删除
    }

    @Transactional
    @Override
    public void deleteByIds(List<Long> idList) {
        idList.forEach(id-> scheduleService.deleteJob(id));//删除定时任务
        removeByIds(idList);//逻辑删除
    }

    @Override
    public ScheduleJobDTO getScheduleJobById(Long id) {
        ScheduleJob scheduleJob = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,scheduleJob);
        ScheduleJobDTO scheduleJobDTO = new ScheduleJobDTO();
        BeanUtils.copyProperties(scheduleJob,scheduleJobDTO);
        return scheduleJobDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<ScheduleJobDTO> getList(QueryWrapper<ScheduleJob> queryWrapper) {
        List<ScheduleJobDTO> scheduleJobDTOList = new ArrayList<>();
        List<ScheduleJob> scheduleJobList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(scheduleJobList)){
            scheduleJobList.forEach(scheduleJob -> {
                ScheduleJobDTO scheduleJobDTO = new ScheduleJobDTO();
                BeanUtils.copyProperties(scheduleJob,scheduleJobDTO);
                scheduleJobDTOList.add(scheduleJobDTO);
            });
        }
        return scheduleJobDTOList;
    }

    /**
     * 立即执行
     *
     * @param idList
     */
    @Transactional
    @Override
    public void run(List<Long> idList) {
        List<ScheduleJob> scheduleJobList = query().in(ScheduleJob.ID, idList).list();
        scheduleJobList.forEach(job -> scheduleService.runJob(job));//执行定时任务
    }

    /**
     * 暂停运行
     *
     * @param idList
     */
    @Transactional
    @Override
    public void pause(List<Long> idList) {
        idList.forEach(id -> scheduleService.pauseJob(id));//暂停定时任务
        //更新任务状态
        updateJobStatus(idList,ScheduleStatus.PAUSE.getValue());
    }

    /**
     * 恢复运行
     *
     * @param idList
     */
    @Transactional
    @Override
    public void resume(List<Long> idList) {
        idList.forEach(id -> scheduleService.resumeJob(id));//恢复定时任务
        updateJobStatus(idList, ScheduleStatus.NORMAL.getValue());
    }

    /**
     * 更新任务状态
     * @param idList
     * @param status
     * @return
     */
    private void updateJobStatus(List<Long> idList, int status) {
        UpdateWrapper<ScheduleJob> updateWrapper = new UpdateWrapper<>();
        updateWrapper.in(ScheduleJob.ID, idList);
        ScheduleJob scheduleJob = new ScheduleJob();
        scheduleJob.setStatus(status);
        update(scheduleJob,updateWrapper);
    }

    /**
     * 数据校验器
     */
    private DataValidator<ScheduleJobDTO> dataValidator = new DataValidator<ScheduleJobDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(ScheduleJobDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(ScheduleJobDTO data) {
            Integer count = query().eq(ScheduleJob.JOB_NAME, data.getJobName()).count();
            AssertUtil.isTrue(ErrorCodeEnum.NAME_ALREADY_EXISTS,count == 0);
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(ScheduleJobDTO data) {
            ScheduleJob scheduleJob = query().eq(ScheduleJob.JOB_NAME, data.getJobName()).one();
            if(scheduleJob != null){
                AssertUtil.equals(ErrorCodeEnum.NAME_ALREADY_EXISTS,data.getId(),scheduleJob.getId());
            }
        }
    };
}
