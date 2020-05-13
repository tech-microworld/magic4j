package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinHelper;
import com.itgacl.magic4j.common.bizCache.BizCacheService;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.libcommon.component.scan.AuthResourceScan;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.exception.DataValidationException;
import com.itgacl.magic4j.libcommon.util.TreeUtil;
import com.itgacl.magic4j.modules.sys.dto.SysResourceDTO;
import com.itgacl.magic4j.modules.sys.entity.SysResource;
import com.itgacl.magic4j.modules.sys.entity.SysRole;
import com.itgacl.magic4j.modules.sys.entity.SysRoleResource;
import com.itgacl.magic4j.modules.sys.mapper.SysResourceMapper;
import com.itgacl.magic4j.modules.sys.service.SysResourceService;
import com.itgacl.magic4j.modules.sys.service.SysRoleResourceService;
import com.itgacl.magic4j.modules.sys.service.SysRoleService;
import com.itgacl.magic4j.modules.sys.vo.ResourcePermVo;
import com.itgacl.magic4j.modules.sys.vo.SysResourceVo;
import com.itgacl.magic4j.modules.sys.vo.VueRouterVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * ISysResourceService的实现类
 * @author 孤傲苍狼
 */
@Slf4j
@Service
public class SysResourceServiceImpl extends ServiceImpl<SysResourceMapper, SysResource> implements SysResourceService {

    @Autowired
    private SysResourceMapper sysResourceMapper;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysRoleResourceService sysRoleResourceService;

    @Autowired
    private BizCacheService bizCacheService;

    @Transactional
    @Override
    public void create(SysResourceDTO sysResourceDTO) {
        dataValidator.validate(sysResourceDTO);//业务处理校验
        SysResource sysResource = new SysResource();
        BeanUtils.copyProperties(sysResourceDTO, sysResource);
        save(sysResource);//保存
        //为超级管理员授权新的菜单权限
        authorize(sysResource);
    }

    /**
     * 为超级管理员授权资源
     * @param sysResource
     */
    private void authorize(SysResource sysResource) {
        //查找超级管理员角色
        SysRole sysRole = sysRoleService.query().eq(SysRole.ROLE_CODE, Constants.SUPER_ADMIN_FLAG).one();
        SysRoleResource sysRoleResource = new SysRoleResource();
        sysRoleResource.setResourceId(sysResource.getId());
        sysRoleResource.setRoleId(sysRole.getId());//超级管理员ID
        sysRoleResourceService.save(sysRoleResource);
    }

    @Override
    public void update(SysResourceDTO sysResourceDTO) {
        dataValidator.validate(sysResourceDTO);//业务处理校验
        SysResource sysResource = new SysResource();
        BeanUtils.copyProperties(sysResourceDTO,sysResource);
        updateById(sysResource);
    }

    @Transactional
    @Override
    public void deleteById(Long id) {
        removeById(id);//逻辑删除
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put(SysRoleResource.RESOURCE_ID,id);
        sysRoleResourceService.removeByMap(paramMap);//删除对应的授权资源
    }

    @Transactional
    @Override
    public void deleteByIds(List<Long> idList) {
        if(CollectionUtil.isNotEmpty(idList)){
            removeByIds(idList);//逻辑删除
            //删除条件构造器
            UpdateWrapper <SysRoleResource> roleResourceWrapper = new UpdateWrapper<>();
            roleResourceWrapper.in(SysRoleResource.RESOURCE_ID,idList);
            sysRoleResourceService.remove(roleResourceWrapper);//删除对应的授权资源
        }
    }

    @Override
    public SysResourceDTO getSysResourceById(Long id) {
        SysResource sysResource = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysResource);
        SysResourceDTO sysResourceDTO = new SysResourceDTO();
        BeanUtils.copyProperties(sysResource,sysResourceDTO);
        return sysResourceDTO;
    }

    @Transactional
    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
        sysRoleResourceService.deleteAll();
    }

    @Override
    public List<SysResourceDTO> getList(QueryWrapper queryWrapper) {
        List<SysResourceDTO> sysResourceDTOList = new ArrayList<>();
        List<SysResource> sysResourceList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysResourceList)){
            sysResourceList.forEach(sysResource -> {
                SysResourceDTO sysResourceDTO = new SysResourceDTO();
                BeanUtils.copyProperties(sysResource,sysResourceDTO);
                sysResourceDTOList.add(sysResourceDTO);
            });
        }
        return sysResourceDTOList;
    }

    /**
     * 通过Id获取资源树
     *
     * @param id 资源id
     * @return SysResourceVo
     */
    @Override
    public SysResourceVo getResourceTreeById(Long id) {
        SysResource sysResource = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysResource);
        SysResourceVo resourceVo = new SysResourceVo();
        BeanUtils.copyProperties(sysResource,resourceVo);
        resourceVo.setId(sysResource.getId());
        if(sysResource.getParentId()!=null){
            resourceVo.setParentId(sysResource.getParentId());
        }
        recursionQuerySubResource(resourceVo);//递归查询子资源
        return resourceVo;
    }

    /**
     * 递归查询子资源
     */
    private void recursionQuerySubResource(SysResourceVo sysResourceVo){
        Long id = sysResourceVo.getId();
        //根据parentId查询
        List<SysResourceVo> childrenVoList = new ArrayList<>();
        //查找子资源信息
        List<SysResource> subResourceList = query().eq(SysResource.PARENT_ID,id).list();
        if(CollectionUtils.isNotEmpty(subResourceList)){
            //子节点信息不为空
            for(SysResource sysResource:subResourceList) {
                SysResourceVo resourceVo = new SysResourceVo();
                BeanUtils.copyProperties(sysResource, resourceVo);
                resourceVo.setId(sysResource.getId());
                if(sysResource.getParentId() != null){
                    resourceVo.setParentId(sysResource.getParentId());
                }
                childrenVoList.add(resourceVo);
            }
            for(SysResourceVo resourceVo:childrenVoList){
                //递归查询
                recursionQuerySubResource(resourceVo);
            }
        }
        sysResourceVo.setChildren(childrenVoList);
    }

    /**
     * 获取资源树集合
     *
     * @return List<SysResourceVo>
     */
    @Override
    public List<SysResourceVo> getResourceTreeList() {
        List<SysResource> sysResourceList = list();
        List<SysResourceVo> resourceVoList = new ArrayList<>();
        for(SysResource sysResource:sysResourceList){
            SysResourceVo resourceVo = new SysResourceVo();
            BeanUtils.copyProperties(sysResource,resourceVo);
            resourceVo.setId(sysResource.getId());
            if(sysResource.getParentId() != null){
                resourceVo.setParentId(sysResource.getParentId());
            }
            resourceVoList.add(resourceVo);
        }
        return TreeUtil.buildTree(resourceVoList);
    }

    /**
     * 获取系统用户所拥有的资源列表
     * @param sysUserId
     * @param type 类型（0：系统资源 1：菜单   2：按钮）
     * @return
     */
    @Override
    public List<SysResourceVo> getUserResourceList(Long sysUserId,Integer type) {
        List<SysResourceVo> resourceVoList = new ArrayList<>();
        List<SysRole> roleList = sysRoleService.getUserRoleList(sysUserId);//查找用户所担任的角色
        if(CollectionUtils.isNotEmpty(roleList)){
            Map<Long,SysResourceVo> resourceVoMap = new HashMap<>();
            roleList.forEach(sysRole -> {
                //查找每一个角色所拥有的资源
                List<SysResourceVo> roleResList = sysRoleService.getRoleResList(sysRole.getId(),type);
                if(CollectionUtils.isNotEmpty(roleResList)){
                    roleResList.forEach(item->{
                        resourceVoMap.put(item.getId(),item);//去重
                    });
                }
            });
            resourceVoMap.forEach((k,v)-> resourceVoList.add(v));
            resourceVoList.sort(Comparator.comparingInt(SysResourceVo::getOrderNum));//升序排序
        }
        return resourceVoList;
    }

    @Override
    public List<SysResourceVo> getMenuResList(Long sysUserId,String resName) {
        List<SysResource> menuResList = sysResourceMapper.selectMenuResList(sysUserId, resName);
        List<SysResourceVo> resourceVoList = new ArrayList<>();
        for(SysResource sysResource:menuResList){
            SysResourceVo resourceVo = new SysResourceVo();
            BeanUtils.copyProperties(sysResource,resourceVo);
            resourceVo.setId(sysResource.getId());
            if(sysResource.getParentId() != null){
                resourceVo.setParentId(sysResource.getParentId());
            }
            resourceVoList.add(resourceVo);
        }
        return resourceVoList;
    }

    /**
     * 通过ID列表查询
     *
     * @param idList
     * @return
     */
    @Override
    public List<SysResource> getByIdList(List<Long> idList) {
        return query().in(SysResource.ID,idList).list();
    }

    /**
     * 获取用户的操作权限
     *
     * @param userId
     * @return
     */
    @Override
    public List<String> getUserPerms(Long userId) {
        List<SysResourceVo> resourceVoList = getUserResourceList(userId,null);
        Set<String> permsSet = new HashSet<>();
        resourceVoList.forEach(sysResourceVo -> {
            if(StrUtil.isNotEmpty(sysResourceVo.getPerms())){
                permsSet.addAll(Arrays.asList(sysResourceVo.getPerms().trim().split(",")));
            }
        });
        return new ArrayList<>(permsSet);
    }

    @Override
    public void saveOrUpdate(List<AuthResourceScan.AuthRes> authResList) {
        List<String> resUrlList = new ArrayList<>();
        authResList.forEach(item -> resUrlList.add(item.getRequestUrl()));
        List<SysResource> sysResourceList = query().eq(SysResource.TYPE, Constants.RESOURCE_TYPE.SYS_AUTH_RESOURCE).list();
        if(CollectionUtil.isEmpty(sysResourceList)){
            addAuthRes(authResList);
        }else {
            addSpecialAuthResList(authResList);
            //筛选出sysResourceList需要删除、需要更新、需要新增的
            List<SysResource> resourceUpdateList = new ArrayList<>();
            List<Long> resDeleteIdList = new ArrayList<>();
            //遍历sysResourceList和authResList，找出两个集合的差异
            Iterator<SysResource> resourceIterator = sysResourceList.iterator();
            while (resourceIterator.hasNext()) {
                SysResource sysResource = resourceIterator.next();
                //遍历删除
                Iterator<AuthResourceScan.AuthRes> iterator = authResList.iterator();
                while (iterator.hasNext()) {
                    AuthResourceScan.AuthRes authRes = iterator.next();
                    if(authRes.getRequestUrl().equals(sysResource.getUrl())
                            && sysResource.getRequestTypes().equals(authRes.getRequestMethods())){
                        if(!authRes.getPermFlags().equals(sysResource.getPerms())){
                            sysResource.setPerms(authRes.getPermFlags());
                            if(StrUtil.isEmpty(sysResource.getName())){//名字以DB的为主，DB的Name为为空才重新设置值
                                sysResource.setName(authRes.getName());
                            }
                            resourceUpdateList.add(sysResource);//需要更新的List
                        }
                        iterator.remove();//删除authResList集合中需要更新的元素
                        resourceIterator.remove();
                        break;
                    }
                }
            }
            if(CollectionUtil.isNotEmpty(resourceUpdateList)){
                updateBatchById(resourceUpdateList);//批量更新
            }
            //帅选出sysResourceList需要删除的Id
            sysResourceList.forEach(sysResource -> resDeleteIdList.add(sysResource.getId()));
            deleteByIds(resDeleteIdList);//根据ID删除
            //需要新增的
            addAuthRes(authResList);
        }
    }

    /**
     * AuthRes分组
     * @param authResList
     * @return
     */
    private Map<String,List<AuthResourceScan.AuthRes>> authResGroup(List<AuthResourceScan.AuthRes> authResList){
        Map<String,List<AuthResourceScan.AuthRes>> groupAuthResMap = new HashMap<>();
        authResList.forEach(authRes -> {
            List<AuthResourceScan.AuthRes> tmpAuthResList = groupAuthResMap.get(authRes.getGroupName());
            if(CollectionUtil.isEmpty(tmpAuthResList)){
                tmpAuthResList = new ArrayList<>();
            }
            String operaType = bizCacheService.getOperaType(authRes.getName());
            if(StrUtil.isNotEmpty(operaType)){
                authRes.setName(operaType);//借助数据字典将英文名称翻译成中文
            }
            tmpAuthResList.add(authRes);
            groupAuthResMap.put(authRes.getGroupName(),tmpAuthResList);//分组
        });
        return groupAuthResMap;
    }

    /**
     * 添加特殊的AuthRes，用于和数据库中已有的特殊数据进行比对，以免DB已有的数据被误删
     * @param authResList
     */
    private void addSpecialAuthResList(List<AuthResourceScan.AuthRes> authResList) {
        Map<String, List<AuthResourceScan.AuthRes>> groupAuthResMap = authResGroup(authResList);//分组
        groupAuthResMap.keySet().forEach((groupName) -> {
            AuthResourceScan.AuthRes authRes = new AuthResourceScan.AuthRes();
            authRes.setName(groupName);
            authRes.setRequestUrl("#"+groupName+"#");
            authRes.setRequestMethods("#");
            authRes.setPermFlags("#");
            authResList.add(authRes);
        });
    }

    /**
     * 增加新的AuthRes
     * @param authResList
     */
    private void addAuthRes(List<AuthResourceScan.AuthRes> authResList) {
        List<SysResource> sysResourceList = new ArrayList<>();
        Map<String,List<AuthResourceScan.AuthRes>> groupAuthResMap = authResGroup(authResList);//分组
        List<SysResource> groupResList = new ArrayList<>();
        groupAuthResMap.forEach((groupName,resList)->{
            Long resId;
            SysResource sysResource = query()
                    .eq(SysResource.TYPE, Constants.RESOURCE_TYPE.SYS_AUTH_RESOURCE)
                    .eq(SysResource.NAME, groupName)
                    .eq(SysResource.LEVEL, 1).one();
            if(sysResource == null){
                sysResource = new SysResource();
                sysResource.setType(Constants.RESOURCE_TYPE.SYS_AUTH_RESOURCE);
                sysResource.setName(groupName);
                sysResource.setLevel(1);
                sysResource.setUrl("#"+groupName+"#");
                sysResource.setRequestTypes("#");
                sysResource.setPerms("#");
                save(sysResource);//保存成功后返回主键ID
                groupResList.add(sysResource);
            }
            resId = sysResource.getId();
            Long finalResId = resId;
            resList.forEach(authRes -> {
                SysResource subSysResource = new SysResource();
                subSysResource.setUrl(authRes.getRequestUrl());
                subSysResource.setPerms(authRes.getPermFlags());//权限标识
                subSysResource.setType(Constants.RESOURCE_TYPE.SYS_AUTH_RESOURCE);
                subSysResource.setName(authRes.getName());
                subSysResource.setRequestTypes(authRes.getRequestMethods());//Http请求调用方式(GET、POST、PUT、DELETE)
                subSysResource.setLevel(2);
                subSysResource.setParentId(finalResId);
                subSysResource.setParentName(groupName);
                sysResourceList.add(subSysResource);
            });
        });
        saveBatch(sysResourceList);//批量保存
        //查找超级管理员角色
        SysRole sysRole = sysRoleService.query().eq(SysRole.ROLE_CODE, Constants.SUPER_ADMIN_FLAG).one();
        //为超级管理员授权新的系统资源
        List<SysRoleResource> sysRoleResources = new ArrayList<>();
        sysResourceList.addAll(groupResList);
        sysResourceList.forEach(item -> {
            SysRoleResource sysRoleResource = new SysRoleResource();
            sysRoleResource.setResourceId(item.getId());
            sysRoleResource.setRoleId(sysRole.getId());//超级管理员ID
            sysRoleResources.add(sysRoleResource);
        });
        sysRoleResourceService.saveBatch(sysRoleResources);//批量保存
    }

    /**
     * 获取某种请求方式资源权限
     *
     * @param method
     * @return
     */
    @Override
    public List<ResourcePermVo> getResourcePerms(String method) {
        List<ResourcePermVo> resourcePermVoList = new ArrayList<>();
        List<SysResource> sysResources = query().select(SysResource.URL, SysResource.REQUEST_TYPES, SysResource.PERMS).like(SysResource.REQUEST_TYPES, method).list();
        if(CollectionUtil.isNotEmpty(sysResources)){
            sysResources.forEach(item->{
                String[] reqTypeArr = item.getRequestTypes().split(",");
                Arrays.stream(reqTypeArr).forEach(reqType->{
                    ResourcePermVo resourcePermVo = new ResourcePermVo();
                    resourcePermVo.setMappingUrl(item.getUrl());
                    resourcePermVo.setRequestType(reqType);
                    resourcePermVo.setPerms(item.getPerms());
                    resourcePermVoList.add(resourcePermVo);
                });
            });
        }
        return resourcePermVoList;
    }

    @Override
    public List<SysResource> getByTypeAndIdList(Integer resType, List<Long> resIds) {
        return query().in(SysResource.ID,resIds).eq(SysResource.TYPE,resType).list();
    }

    /**
     * 构建Vue前端路由所需要的菜单
     *
     * @param resourceVos 菜单资源列表
     * @return 路由列表
     */
    @Override
    public List<VueRouterVo> buildVueMenu(List<SysResourceVo> resourceVos) {
        List<SysResourceVo> sysResourceVos = TreeUtil.buildTree(resourceVos);
        List<VueRouterVo> routers = new LinkedList<>();
        for (SysResourceVo menu : sysResourceVos) {
            VueRouterVo router = new VueRouterVo();
            router.setName(menu.getName());
            router.setPath(getRouterPath(menu));//Vue前端路由需要使用到path属性，DB没有该属性，只能手动构建一个
            router.setComponent(StringUtils.isEmpty(menu.getUrl()) ? "Layout" : menu.getUrl());
            router.setMeta(new VueRouterVo.MetaVo(menu.getName(), menu.getIcon()));
            List<SysResourceVo> cMenus = menu.getChildren();
            if (CollectionUtil.isNotEmpty(cMenus)) {
                router.setAlwaysShow(true);
                router.setRedirect("noRedirect");
                router.setChildren(buildVueMenu(cMenus));
            }
            routers.add(router);
        }
        return routers;
    }

    /**
     * 获取路由地址
     *
     * @param menu 菜单信息
     * @return 路由地址
     */
    private String getRouterPath(SysResourceVo menu) {
        String routerPath="/";
        if (menu.getParentId() == null) {//一级菜单
            try {
                routerPath = PinyinHelper.getShortPinyin("/" + menu.getName());//汉字转拼音首字母
            } catch (PinyinException e) {
                routerPath = "/menu-"+menu.getId();
            }
        }else {
            if(StrUtil.isNotEmpty(menu.getUrl())){
                String[] tmpArr = menu.getUrl().split("/");
                for(int i=0;i<tmpArr.length-1;i++){
                    routerPath += tmpArr[i]+"/";
                }
                routerPath=routerPath.substring(0,routerPath.lastIndexOf("/"));
            }else {
                routerPath = "/menu-"+menu.getId();
            }
        }
        return routerPath;
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysResourceDTO> dataValidator = new DataValidator<SysResourceDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysResourceDTO data) {
            if(ObjectUtil.isNotEmpty(data.getParentId())){
                SysResource parentRes = getById(data.getParentId());
                if(parentRes == null){
                    throw new DataValidationException("父级资源不存在");
                }
                data.setParentName(parentRes.getName());
                if(ObjectUtil.isNotEmpty(parentRes.getLevel())){
                    data.setLevel(parentRes.getLevel()+1);//计算资源等级
                }
            }
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysResourceDTO data) {
            //判断资源名是否已经存在
            int count = query().eq(SysResource.NAME, data.getName()).ne(SysResource.TYPE,Constants.RESOURCE_TYPE.SYS_AUTH_RESOURCE).count();
            AssertUtil.isTrue(ErrorCodeEnum.RESOURCE_ALREADY_EXISTS,count == 0);
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysResourceDTO data) {
            SysResource sysResource = query().eq(SysResource.NAME,data.getName()).ne(SysResource.TYPE,Constants.RESOURCE_TYPE.SYS_AUTH_RESOURCE).one();
            if(sysResource != null){
                AssertUtil.equals(ErrorCodeEnum.RESOURCE_ALREADY_EXISTS,data.getId(),sysResource.getId());
            }
        }
    };
}
