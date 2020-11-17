package com.itgacl.magic4j.modules.demo.converter;

import com.itgacl.magic4j.common.converter.BaseConverter;
import com.itgacl.magic4j.modules.demo.entity.MiniappUser;
import com.itgacl.magic4j.modules.demo.vo.MiniappUserVo;
import com.itgacl.magic4j.modules.demo.dto.MiniappUserDTO;
import org.springframework.beans.BeanUtils;

/**
 * @Classname MiniappUser转换器
 * @Description Entity、VO、DTO相互转换器
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
public class MiniappUserConverter extends BaseConverter<MiniappUser, MiniappUserVo, MiniappUserDTO> {

    public static MiniappUserConverter build() {
        return new MiniappUserConverter();
    }

    @Override
    public MiniappUserVo vo(MiniappUser entity) {
        MiniappUserVo MiniappUserVo = new MiniappUserVo();
        BeanUtils.copyProperties(entity,MiniappUserVo);
        return MiniappUserVo;
    }

    @Override
    public MiniappUser entity(MiniappUserDTO entityDto) {
        MiniappUser MiniappUser = new MiniappUser();
        BeanUtils.copyProperties(entityDto,MiniappUser);
        return MiniappUser;
    }
}
