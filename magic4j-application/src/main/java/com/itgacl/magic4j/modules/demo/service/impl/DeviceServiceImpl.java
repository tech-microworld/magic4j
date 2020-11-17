package com.itgacl.magic4j.modules.demo.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.modules.demo.dto.DeviceDTO;
import com.itgacl.magic4j.modules.demo.vo.DeviceVo;
import com.itgacl.magic4j.modules.demo.converter.DeviceConverter;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.demo.entity.Device;
import com.itgacl.magic4j.modules.demo.mapper.DeviceMapper;
import com.itgacl.magic4j.modules.demo.service.DeviceService;
import org.springframework.stereotype.Service;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import java.util.ArrayList;
import java.util.List;

/**
 * @Classname DeviceServiceImpl
 * @Description DeviceService实现类
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
@Service
public class DeviceServiceImpl extends ServiceImpl<DeviceMapper, Device> implements DeviceService {

    @Override
    public void create(DeviceDTO deviceDTO) {
        dataValidator.validate(deviceDTO);//业务处理校验
        Device device = DeviceConverter.build().entity(deviceDTO);//DTO转换成Entity
        save(device);//保存
    }

    @Override
    public void update(DeviceDTO deviceDTO) {
        dataValidator.validate(deviceDTO);//业务处理校验
        Device device = DeviceConverter.build().entity(deviceDTO);//DTO转换成Entity
        updateById(device);
    }
    /**
    * 导入数据
    * @param dataList
    * @param isCovered
    */
    @Override
    public void importData(List<DeviceDTO> dataList, Boolean isCovered) {
        dataList.forEach(deviceDTO -> {
            if(isCovered) {
                Device oldData = null;//todo 根据条件查询旧数据
                if (oldData != null && oldData.getId() != null) {
                    //找到了就覆盖旧数据
                    deviceDTO.setId(oldData.getId());
                    update(deviceDTO);
                }else{
                    //找不到就新增
                    create(deviceDTO);
                }
            }else {
                create(deviceDTO);
            }
        });
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
    public DeviceVo getDeviceById(Long id) {
        Device device = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,device);
        return DeviceConverter.build().vo(device);
    }

    @Override
    public void delete(QueryWrapper<Device> queryWrapper) {
        remove(queryWrapper);
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<DeviceVo> getList(QueryWrapper<Device> queryWrapper) {
        List<Device> deviceList = list(queryWrapper);
        return DeviceConverter.build().listVO(deviceList);
    }

    @Override
    public PageData<DeviceVo> pageList(Page<Device> page, QueryWrapper<Device> queryWrapper) {
        IPage<Device> pageInfo = page(page,queryWrapper);//mybatisPlus分页查询
        IPage<DeviceVo> pageVO = DeviceConverter.build().pageVO(pageInfo);
        return PageData.build(pageVO);
    }

    @Override
    public PageData<DeviceVo> pageList(PageParam pageParam, QueryWrapper<Device> queryWrapper) {
        Page<Device> page = new Page<>(pageParam.getPageNum(),pageParam.getPageSize());
        return pageList(page,queryWrapper);
    }

    /**
     * 数据校验器
     */
    private DataValidator<DeviceDTO> dataValidator = new DataValidator<DeviceDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(DeviceDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(DeviceDTO data) {

        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(DeviceDTO data) {

        }
    };
}
