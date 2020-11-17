package com.itgacl.magic4j.modules.demo.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.modules.demo.dto.MiniappUserDTO;
import com.itgacl.magic4j.modules.demo.vo.MiniappUserVo;
import com.itgacl.magic4j.modules.demo.converter.MiniappUserConverter;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.demo.entity.MiniappUser;
import com.itgacl.magic4j.modules.demo.mapper.MiniappUserMapper;
import com.itgacl.magic4j.modules.demo.service.MiniappUserService;
import org.springframework.stereotype.Service;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import java.util.ArrayList;
import java.util.List;

/**
 * @Classname MiniappUserServiceImpl
 * @Description MiniappUserService实现类
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-08-31
 * @Version 1.0
 */
@Service
public class MiniappUserServiceImpl extends ServiceImpl<MiniappUserMapper, MiniappUser> implements MiniappUserService {

    @Override
    public void create(MiniappUserDTO miniappUserDTO) {
        dataValidator.validate(miniappUserDTO);//业务处理校验
        MiniappUser miniappUser = MiniappUserConverter.build().entity(miniappUserDTO);//DTO转换成Entity
        save(miniappUser);//保存
    }

    @Override
    public void update(MiniappUserDTO miniappUserDTO) {
        dataValidator.validate(miniappUserDTO);//业务处理校验
        MiniappUser miniappUser = MiniappUserConverter.build().entity(miniappUserDTO);//DTO转换成Entity
        updateById(miniappUser);
    }
    /**
    * 导入数据
    * @param dataList
    * @param isCovered
    */
    @Override
    public void importData(List<MiniappUserDTO> dataList, Boolean isCovered) {
        dataList.forEach(miniappUserDTO -> {
            if(isCovered) {
                MiniappUser oldData = null;//todo 根据条件查询旧数据
                if (oldData != null && oldData.getId() != null) {
                    //找到了就覆盖旧数据
                    miniappUserDTO.setId(oldData.getId());
                    update(miniappUserDTO);
                }else{
                    //找不到就新增
                    create(miniappUserDTO);
                }
            }else {
                create(miniappUserDTO);
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
    public MiniappUserVo getMiniappUserById(Long id) {
        MiniappUser miniappUser = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,miniappUser);
        return MiniappUserConverter.build().vo(miniappUser);
    }

    @Override
    public void delete(QueryWrapper<MiniappUser> queryWrapper) {
        remove(queryWrapper);
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<MiniappUserVo> getList(QueryWrapper<MiniappUser> queryWrapper) {
        List<MiniappUser> miniappUserList = list(queryWrapper);
        return MiniappUserConverter.build().listVO(miniappUserList);
    }

    @Override
    public PageData<MiniappUserVo> pageList(Page<MiniappUser> page, QueryWrapper<MiniappUser> queryWrapper) {
        IPage<MiniappUser> pageInfo = page(page,queryWrapper);//mybatisPlus分页查询
        IPage<MiniappUserVo> pageVO = MiniappUserConverter.build().pageVO(pageInfo);
        return PageData.build(pageVO);
    }

    @Override
    public PageData<MiniappUserVo> pageList(PageParam pageParam, QueryWrapper<MiniappUser> queryWrapper) {
        Page<MiniappUser> page = new Page<>(pageParam.getPageNum(),pageParam.getPageSize());
        return pageList(page,queryWrapper);
    }

    /**
     * 数据校验器
     */
    private DataValidator<MiniappUserDTO> dataValidator = new DataValidator<MiniappUserDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(MiniappUserDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(MiniappUserDTO data) {

        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(MiniappUserDTO data) {

        }
    };
}
