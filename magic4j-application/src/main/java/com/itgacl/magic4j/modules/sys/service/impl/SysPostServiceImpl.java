package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.modules.sys.dto.SysPostDTO;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.entity.SysPost;
import com.itgacl.magic4j.modules.sys.excel.PostExcel;
import com.itgacl.magic4j.modules.sys.mapper.SysPostMapper;
import com.itgacl.magic4j.modules.sys.service.SysPostService;
import com.itgacl.magic4j.modules.sys.vo.SysPostVo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Classname SysPostServiceImpl
 * @Description SysPostService实现类
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-06
 * @Version 1.0
 */
@Service
public class SysPostServiceImpl extends ServiceImpl<SysPostMapper, SysPost> implements SysPostService {

    @Override
    public void create(SysPostDTO sysPostDTO) {
        dataValidator.validate(sysPostDTO);//业务处理校验
        SysPost sysPost = new SysPost();
        BeanUtils.copyProperties(sysPostDTO,sysPost);
        save(sysPost);//保存
    }

    @Override
    public void update(SysPostDTO sysPostDTO) {
        dataValidator.validate(sysPostDTO);//业务处理校验
        SysPost sysPost = new SysPost();
        BeanUtils.copyProperties(sysPostDTO,sysPost);
        updateById(sysPost);
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
    public SysPostDTO getSysPostById(Long id) {
        SysPost sysPost = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysPost);
        SysPostDTO sysPostDTO = new SysPostDTO();
        BeanUtils.copyProperties(sysPost,sysPostDTO);
        return sysPostDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public PageData<SysPostVo> pageList(Page<SysPost> page, QueryWrapper<SysPost> queryWrapper) {
        IPage<SysPost> pageInfo = page(page,queryWrapper);//mybatisPlus分页查询
        return null;
    }

    @Override
    public List<SysPostDTO> getList(QueryWrapper<SysPost> queryWrapper) {
        List<SysPostDTO> sysPostDTOList = new ArrayList<>();
        List<SysPost> sysPostList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysPostList)){
            sysPostList.forEach(sysPost -> {
                SysPostDTO sysPostDTO = new SysPostDTO();
                BeanUtils.copyProperties(sysPost,sysPostDTO);
                sysPostDTOList.add(sysPostDTO);
            });
        }
        return sysPostDTOList;
    }

    @Override
    public void importPost(List<PostExcel> data, Boolean isCovered) {

    }

    /**
     * 数据校验器
     */
    private DataValidator<SysPostDTO> dataValidator = new DataValidator<SysPostDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysPostDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysPostDTO data) {
            Integer count = query().eq(SysPost.POST_NAME, data.getPostName()).or().eq(SysPost.POST_CODE, data.getPostCode()).count();
            AssertUtil.isTrue(ErrorCodeEnum.NAME_ALREADY_EXISTS,count == 0);//断言已存在
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysPostDTO data) {
            SysPost sysPost = query().eq(SysPost.POST_NAME, data.getPostName()).or().eq(SysPost.POST_CODE, data.getPostCode()).one();
            if(sysPost != null){
                AssertUtil.equals(ErrorCodeEnum.NAME_ALREADY_EXISTS,data.getId(),sysPost.getId());
            }
        }
    };
}
