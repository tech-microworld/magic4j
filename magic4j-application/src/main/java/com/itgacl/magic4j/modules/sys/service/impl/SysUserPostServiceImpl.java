package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.modules.sys.dto.SysUserPostDTO;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.entity.SysUserPost;
import com.itgacl.magic4j.modules.sys.entity.SysUserRole;
import com.itgacl.magic4j.modules.sys.mapper.SysUserPostMapper;
import com.itgacl.magic4j.modules.sys.service.SysUserPostService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Classname SysUserPostServiceImpl
 * @Description SysUserPostService实现类
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-08
 * @Version 1.0
 */
@Service
public class SysUserPostServiceImpl extends ServiceImpl<SysUserPostMapper, SysUserPost> implements SysUserPostService {

    @Override
    public void create(SysUserPostDTO sysUserPostDTO) {
        dataValidator.validate(sysUserPostDTO);//业务处理校验
        SysUserPost sysUserPost = new SysUserPost();
        BeanUtils.copyProperties(sysUserPostDTO,sysUserPost);
        save(sysUserPost);//保存
    }

    @Override
    public void update(SysUserPostDTO sysUserPostDTO) {
        dataValidator.validate(sysUserPostDTO);//业务处理校验
        SysUserPost sysUserPost = new SysUserPost();
        BeanUtils.copyProperties(sysUserPostDTO,sysUserPost);
        updateById(sysUserPost);
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
    public SysUserPostDTO getSysUserPostById(Long id) {
        SysUserPost sysUserPost = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysUserPost);
        SysUserPostDTO sysUserPostDTO = new SysUserPostDTO();
        BeanUtils.copyProperties(sysUserPost,sysUserPostDTO);
        return sysUserPostDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysUserPostDTO> getList(QueryWrapper queryWrapper) {
        List<SysUserPostDTO> sysUserPostDTOList = new ArrayList<>();
        List<SysUserPost> sysUserPostList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysUserPostList)){
            sysUserPostList.forEach(sysUserPost -> {
                SysUserPostDTO sysUserPostDTO = new SysUserPostDTO();
                BeanUtils.copyProperties(sysUserPost,sysUserPostDTO);
                sysUserPostDTOList.add(sysUserPostDTO);
            });
        }
        return sysUserPostDTOList;
    }

    @Override
    public void bindPost(Long sysUserId, List<Long> postIds) {
        //先根据用户ID删除绑定的旧岗位
        QueryWrapper<SysUserPost> wrapper = new QueryWrapper<>();
        wrapper.eq(SysUserPost.USER_ID,sysUserId);
        remove(wrapper);
        List<SysUserPost> sysUserPosts = new ArrayList<>();
        postIds.forEach(postId->{
            SysUserPost post = new SysUserPost();
            post.setUserId(sysUserId);
            post.setPostId(postId);
            sysUserPosts.add(post);
        });
        saveBatch(sysUserPosts);//批量保存
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysUserPostDTO> dataValidator = new DataValidator<SysUserPostDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysUserPostDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysUserPostDTO data) {
            Integer count = query().eq(SysUserPost.POST_ID, data.getPostId()).eq(SysUserPost.USER_ID, data.getUserId()).count();
            AssertUtil.isTrue(ErrorCodeEnum.DATA_EXIST,count == 0);//断言已存在
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysUserPostDTO data) {

        }
    };
}
