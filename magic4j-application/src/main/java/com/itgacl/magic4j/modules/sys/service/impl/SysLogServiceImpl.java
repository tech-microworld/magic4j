package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.modules.sys.dto.SysLogDTO;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.entity.SysLog;
import com.itgacl.magic4j.modules.sys.mapper.SysLogMapper;
import com.itgacl.magic4j.modules.sys.service.SysLogService;
import com.itgacl.magic4j.modules.sys.vo.CountStatisticVo;
import com.itgacl.magic4j.modules.sys.vo.DashboardLineChartVo;
import com.itgacl.magic4j.modules.sys.vo.LoginStatisticVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * SysLogService 实现类
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {

    @Autowired
    private SysLogMapper sysLogMapper;

    @Override
    public void create(SysLogDTO sysLogDTO) {
        dataValidator.validate(sysLogDTO);//业务处理校验
        SysLog sysLog = new SysLog();
        BeanUtils.copyProperties(sysLogDTO,sysLog);
        save(sysLog);//保存
    }

    @Override
    public void update(SysLogDTO sysLogDTO) {
        dataValidator.validate(sysLogDTO);//业务处理校验
        SysLog sysLog = new SysLog();
        BeanUtils.copyProperties(sysLogDTO,sysLog);
        updateById(sysLog);
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
    public SysLogDTO getSysLogById(Long id) {
        SysLog sysLog = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysLog);
        SysLogDTO sysLogDTO = new SysLogDTO();
        BeanUtils.copyProperties(sysLog,sysLogDTO);
        return sysLogDTO;
    }

    @Override
    public void delete(QueryWrapper<SysLog> queryWrapper) {
        if(queryWrapper.isEmptyOfWhere()){
            //remove(null);//用remove全部删除会报错：com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Prohibition of full table deletion
            sysLogMapper.deleteAll();//全部删除
        }else {
            remove(queryWrapper);//带条件删除
        }
    }

    @Override
    public List<SysLogDTO> getList(QueryWrapper queryWrapper) {
        List<SysLogDTO> sysLogDTOList = new ArrayList<>();
        List<SysLog> sysLogList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysLogList)){
            sysLogList.forEach(sysLog -> {
                SysLogDTO sysLogDTO = new SysLogDTO();
                BeanUtils.copyProperties(sysLog,sysLogDTO);
                sysLogDTOList.add(sysLogDTO);
            });
        }
        return sysLogDTOList;
    }

    @Override
    public List<String> getModuleNameList() {
        return sysLogMapper.getModuleNameList();
    }

    @Override
    public List<LoginStatisticVo> getLoginStatistics() {
        return sysLogMapper.getLoginStatistics();
    }

    @Override
    public List<CountStatisticVo> loginCountStatistic() {
        return sysLogMapper.loginCountStatistic();
    }

    @Override
    public DashboardLineChartVo loginStatistic() {
        List<CountStatisticVo> userAccessCountList = loginCountStatistic();
        DashboardLineChartVo dashboardLineChartVo = new DashboardLineChartVo();
        List<String> dateRangeList = new ArrayList<>();
        List<Integer> userCountList = new ArrayList<>();
        userAccessCountList.forEach(item->{
            dateRangeList.add(item.getDays());
            userCountList.add(item.getCount());
        });
        dashboardLineChartVo.setDateRangeList(dateRangeList);
        dashboardLineChartVo.setUserAccessCountList(userCountList);
        return dashboardLineChartVo;
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysLogDTO> dataValidator = new DataValidator<SysLogDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysLogDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysLogDTO data) {

        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysLogDTO data) {

        }
    };
}
