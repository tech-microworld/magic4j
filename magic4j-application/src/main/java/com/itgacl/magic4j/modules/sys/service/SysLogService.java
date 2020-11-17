package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.modules.sys.dto.SysLogDTO;
import com.itgacl.magic4j.modules.sys.entity.SysLog;
import com.itgacl.magic4j.modules.sys.vo.CountStatisticVo;
import com.itgacl.magic4j.modules.sys.vo.DashboardLineChartVo;
import com.itgacl.magic4j.modules.sys.vo.LoginStatisticVo;

import java.util.List;

/**
 * SysLogService
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
public interface SysLogService extends IService<SysLog> {

    void create(SysLogDTO sysLogDTO);

    void update(SysLogDTO sysLogDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysLogDTO getSysLogById(Long id);

    void delete(QueryWrapper<SysLog> queryWrapper);

    List<SysLogDTO> getList(QueryWrapper queryWrapper);

    List<String> getModuleNameList();

    /**
     * 用户登录统计
     * @return
     */
    List<LoginStatisticVo> getLoginStatistics();

    /**
     * 统计7天内的登录情况
     * @return
     */
    List<CountStatisticVo> loginCountStatistic();

    DashboardLineChartVo loginStatistic();
}
