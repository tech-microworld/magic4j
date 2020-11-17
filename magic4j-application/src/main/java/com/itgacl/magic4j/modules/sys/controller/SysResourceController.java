package com.itgacl.magic4j.modules.sys.controller;

import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.scan.AuthResourceScan;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.Maps;
import com.itgacl.magic4j.libcommon.util.TreeUtil;
import com.itgacl.magic4j.modules.sys.dto.SysResourceDTO;
import com.itgacl.magic4j.modules.sys.service.SysResourceService;
import com.itgacl.magic4j.modules.sys.service.SysRoleService;
import com.itgacl.magic4j.modules.sys.vo.SysResourceVo;
import com.itgacl.magic4j.modules.sys.vo.TreeSelectVo;
import com.itgacl.magic4j.modules.sys.vo.VueRouterVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 *
 * @author 孤傲苍狼
 */
@Api(tags = "系统资源管理")
@Auth(name = "系统资源") //在类上标注了@Auth注解后这个类下的所有接口都需要做访问权限控制
@RestController
@RequestMapping("/api/sys/resource")
public class SysResourceController extends SuperController {

    @Autowired
    private SysResourceService sysResourceService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private AuthResourceScan authResourceScan;

    /**
     * 创建
     * @param sysResource
     * @return
     */
    @ApiOperation("新增")
    @PostMapping
    public R<Void> create(@RequestBody @Validated(Constants.Create.class) SysResourceDTO sysResource){
        sysResourceService.create(sysResource);
        return R.ok();
    }

    /**
     * 更新
     * @param sysResource
     * @return
     */
    @ApiOperation("修改")
    @PutMapping
    public R<Void> update(@RequestBody @Validated(Constants.Update.class) SysResourceDTO sysResource){
        sysResourceService.update(sysResource);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @ApiOperation("根据ID查找")
    @GetMapping("/{id}")
    @Auth(isAuth = false)//不进行权限控制
    public R<SysResourceDTO> get(@PathVariable("id") Long id){
        SysResourceDTO sysResourceDTO = sysResourceService.getSysResourceById(id);
        return R.ok(sysResourceDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @ApiOperation("查询全部")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<SysResourceDTO>> get() {
        List<SysResourceDTO> sysResourceList = sysResourceService.getList(null);
        return R.ok(sysResourceList);
    }

    /**
     * 根据ID删除
     * @param ids
     * @return
     * @throws Exception
     */
    @ApiOperation("根据ID删除")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysResourceService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysResourceService.deleteByIds(idList);
        }
        return R.ok();
    }

    /**
     * 获取资源树列表
     * @return
     */
    @ApiOperation("获取资源树列表")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/tree")
    public R<List<SysResourceVo>> getResourceTreeList(){
        return R.ok(sysResourceService.getResourceTreeList());
    }

    /**
     * 根据资源ID获取资源信息以及子资源信息
     * @param id
     * @return
     */
    @ApiOperation("根据资源ID获取资源信息以及子资源信息")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/tree/{id}")
    public R<SysResourceVo> getResourceTreeById(@PathVariable("id") Long id) {
        return R.ok(sysResourceService.getResourceTreeById(id));
    }

    /**
     * 获取用户所拥有的资源列表
     * @param userId
     * @param type 类型（0：系统资源 1：菜单   2：按钮）
     * @return
     */
    @ApiOperation("获取用户所拥有的资源列表")
    @ApiImplicitParam(name = "type",value = "类型（0：系统资源 1：菜单   2：按钮）")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{sysUserId}/res")
    public R<List<SysResourceVo>> getUserResourceList(@PathVariable("sysUserId") Long userId,@RequestParam(required = false) Integer type){
        return R.ok(sysResourceService.getUserResourceList(userId,type));
    }

    /**
     * 获取用户所拥有的资源树列表
     * @param userId
     * @return
     */
    @ApiOperation("获取用户所拥有的资源树列表")
    @ApiImplicitParam(name = "type",value = "类型（0：系统资源 1：菜单   2：按钮）")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{sysUserId}/res/tree")
    public R<List<SysResourceVo>> getUserResourceTreeList(@PathVariable("sysUserId") Long userId,@RequestParam(required = false) Integer type){
        List<SysResourceVo> resourceVoList = sysResourceService.getUserResourceList(userId,type);
        return R.ok(TreeUtil.buildTree(resourceVoList));
    }

    /**
     * 获取登录用户所拥有的授权资源树列表
     * @return
     */
    @ApiOperation("获取登录用户所拥有的授权资源树列表")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/authRes/list")
    public R<List<SysResourceVo>> getAuthResourceTreeList(){
        List<SysResourceVo> resourceVoList = sysResourceService.getUserResourceList(getLoginUserId(),Constants.RESOURCE_TYPE.SYS_AUTH_RESOURCE);
        return R.ok(TreeUtil.buildTree(resourceVoList));
    }

    /**
     * 获取Vue路由信息
     *
     * @return 路由信息
     */
    @ApiOperation("获取Vue路由信息")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/getRouters")
    public R<List<VueRouterVo>> getRouters() {
        List<SysResourceVo> resourceVoList = sysResourceService.getUserResourceList(getLoginUserId(),Constants.RESOURCE_TYPE.MENU);
        return R.ok(sysResourceService.buildVueMenu(resourceVoList));
    }

    /**
     * 获取系统菜单
     *
     * @return 系统菜单
     */
    @ApiOperation("获取系统菜单树")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/menu/list")
    public R<List<SysResourceVo>> getSysResourceList(String name) {
        List<SysResourceVo> treeList = TreeUtil.buildTree(sysResourceService.getMenuResList(getLoginUserId(), name));
        return R.ok(treeList);
    }

    /**
     * 获取系统权限树
     *
     * @return 系统菜单
     */
    @ApiOperation("获取系统权限树")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/perm/tree")
    public R<List<TreeSelectVo>> getPermsTree() {
        List<SysResourceVo> resourceVoList = sysResourceService.getUserResourceList(getLoginUserId(),Constants.RESOURCE_TYPE.SYS_AUTH_RESOURCE);
        List<TreeSelectVo> treeSelectVos = new ArrayList<>();
        Map<String,SysResourceVo> resourceVoMap = new HashMap<>();
        resourceVoList.forEach(resourceVo -> {
            resourceVoMap.put(resourceVo.getName()+ resourceVo.getPerms(),resourceVo);//去除【名字+权限标识】重复的数据
        });
        List<SysResourceVo> tmpResList = new ArrayList<>();
        tmpResList.addAll(resourceVoMap.values());
        List<SysResourceVo> treeList = TreeUtil.buildTree(tmpResList);
        treeList.forEach(item->{
            TreeSelectVo treeSelectVo = new TreeSelectVo(item);
            treeSelectVos.add(treeSelectVo);
        });
        return R.ok(treeSelectVos);
    }

    /**
     * 获取菜单下拉树列表
     */
    @ApiOperation("获取菜单下拉树列表")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/menu/treeSelect")
    public R<List<TreeSelectVo>> menuTreeSelect() {
        List<SysResourceVo> resourceVoList = TreeUtil.buildTree(sysResourceService.getUserResourceList(getLoginUserId(),Constants.RESOURCE_TYPE.MENU));
        List<TreeSelectVo> treeSelectVos = new ArrayList<>();
        resourceVoList.forEach(resourceVo -> {
            TreeSelectVo treeSelectVo = new TreeSelectVo(resourceVo);
            treeSelectVos.add(treeSelectVo);
        });
        return R.ok(treeSelectVos);
    }

    /**
     * 加载对应角色资源列表树
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping(value = "/roleResTreeSelect/{roleId}")
    public R<Map<Object, Object>> roleResTreeSelect(@PathVariable("roleId") Long roleId) {
        List<SysResourceVo> roleResList = sysRoleService.getRoleResList(roleId, null);
        List<Long> roleMenuIdList = new ArrayList<>();//菜单资源
        List<Long> roleAuthResIdList = new ArrayList<>();//授权资源
        roleResList.forEach(sysResourceVo -> {
            if(Objects.equals(sysResourceVo.getType(), Constants.RESOURCE_TYPE.MENU)){
                roleMenuIdList.add(sysResourceVo.getId());
            }else if(Objects.equals(sysResourceVo.getType(), Constants.RESOURCE_TYPE.SYS_AUTH_RESOURCE)){
                roleAuthResIdList.add(sysResourceVo.getId());
            }
        });
        Map<Object, Object> dataMap = Maps.builder()
                .put("roleMenuIdList", roleMenuIdList)
                .put("roleAuthResIdList", roleAuthResIdList)
                .build();
        return R.ok(dataMap);
    }

    /**
     * 刷新系统权限控制资源
     * @return
     */
    @ApiOperation("刷新系统权限控制资源")
    @PostMapping("/refreshAuthRes")
    public R<Void> refreshAuthRes(){
        List<AuthResourceScan.AuthRes> authResList = authResourceScan.scan();//扫描系统的权限控制资源
        sysResourceService.saveOrUpdate(authResList);
        return R.ok();
    }
}