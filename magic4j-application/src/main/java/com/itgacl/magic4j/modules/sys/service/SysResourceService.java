package com.itgacl.magic4j.modules.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itgacl.magic4j.libcommon.component.scan.AuthResourceScan;
import com.itgacl.magic4j.modules.sys.dto.SysResourceDTO;
import com.itgacl.magic4j.modules.sys.entity.SysResource;
import com.itgacl.magic4j.modules.sys.vo.ResourcePermVo;
import com.itgacl.magic4j.modules.sys.vo.SysResourceVo;
import com.itgacl.magic4j.modules.sys.vo.VueRouterVo;

import java.util.List;

/**
 * SysResourceService
 * @author 孤傲苍狼
 */
public interface SysResourceService extends IService<SysResource> {

    void create(SysResourceDTO sysResourceDTO);

    void update(SysResourceDTO sysResourceDTO);
 
    void deleteById(Long id);

    void deleteByIds(List<Long> idList);

    SysResourceDTO getSysResourceById(Long id);

    void deleteAll();

    List<SysResourceDTO> getList(QueryWrapper queryWrapper);

    /**
     * 通过Id获取资源树
     * @param id 资源id
     * @return SysResourceVo
     */
    SysResourceVo getResourceTreeById(Long id);

    /**
     * 获取资源树集合
     * @return List<SysResourceVo>
     */
    List<SysResourceVo> getResourceTreeList();

    /**
     * 获取系统用户所拥有的资源列表
     * @param sysUserId
     * @param type 类型（0：系统资源 1：菜单   2：按钮）
     * @return
     */
    List<SysResourceVo> getUserResourceList(Long sysUserId,Integer type);

    List<SysResourceVo> getMenuResList(Long sysUserId,String resName);

    /**
     * 通过ID列表查询
     * @param idList
     * @return
     */
    List<SysResource> getByIdList(List<Long> idList);

    /**
     * 获取用户的操作权限
     * @return
     */
    List<String> getUserPerms(Long userId);

    void saveOrUpdate(List<AuthResourceScan.AuthRes> scanInfoList);

    /**
     * 获取某种请求方式资源权限
     *
     * @param method
     * @return
     */
    List<ResourcePermVo> getResourcePerms(String method);

    List<SysResource> getByTypeAndIdList(Integer resType, List<Long> resIds);

    /**
     * 构建Vue前端路由所需要的菜单
     *
     * @param resourceVos 菜单资源列表
     * @return 路由列表
     */
    List<VueRouterVo> buildVueMenu(List<SysResourceVo> resourceVos);
}
