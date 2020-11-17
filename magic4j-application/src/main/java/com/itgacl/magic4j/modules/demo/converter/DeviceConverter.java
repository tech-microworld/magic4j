package com.itgacl.magic4j.modules.demo.converter;

import com.itgacl.magic4j.common.converter.BaseConverter;
import com.itgacl.magic4j.modules.demo.entity.Device;
import com.itgacl.magic4j.modules.demo.vo.DeviceVo;
import com.itgacl.magic4j.modules.demo.dto.DeviceDTO;
import org.springframework.beans.BeanUtils;

/**
 * @Classname Device转换器
 * @Description Entity、VO、DTO相互转换器
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
public class DeviceConverter extends BaseConverter<Device, DeviceVo, DeviceDTO> {

    public static DeviceConverter build() {
        return new DeviceConverter();
    }

    @Override
    public DeviceVo vo(Device entity) {
        DeviceVo DeviceVo = new DeviceVo();
        BeanUtils.copyProperties(entity,DeviceVo);
        return DeviceVo;
    }

    @Override
    public Device entity(DeviceDTO entityDto) {
        Device Device = new Device();
        BeanUtils.copyProperties(entityDto,Device);
        return Device;
    }
}
