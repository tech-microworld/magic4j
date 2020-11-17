package com.itgacl.magic4j.modules.demo.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.modules.demo.dto.DeviceDTO;
import com.itgacl.magic4j.modules.demo.vo.DeviceVo;
import com.itgacl.magic4j.modules.demo.entity.Device;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import java.util.List;

/**
 * @Classname DeviceService
 * @Description 设备信息 Service
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
public interface DeviceService extends IService<Device> {

    void create(DeviceDTO deviceDTO);

    void update(DeviceDTO deviceDTO);

    void importData(List<DeviceDTO> dataList, Boolean isCovered);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    DeviceVo getDeviceById(Long id);

    void delete(QueryWrapper<Device> queryWrapper);

    void deleteAll();

    List<DeviceVo> getList(QueryWrapper<Device> queryWrapper);

    PageData<DeviceVo> pageList(Page<Device> page, QueryWrapper<Device> queryWrapper);

    PageData<DeviceVo> pageList(PageParam pageParam, QueryWrapper<Device> queryWrapper);
}
