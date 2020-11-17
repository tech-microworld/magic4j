package com.itgacl.magic4j.modules.sys.controller;
import com.itgacl.magic4j.common.base.SuperController;
import com.itgacl.magic4j.libcommon.annotation.Auth;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.constant.Constants;

import com.itgacl.magic4j.libcommon.util.Maps;
import com.itgacl.magic4j.libcommon.util.TreeUtil;
import com.itgacl.magic4j.modules.sys.entity.SysRoleDept;
import com.itgacl.magic4j.modules.sys.entity.ext.SysDeptExt;
import com.itgacl.magic4j.modules.sys.service.SysDeptService;
import com.itgacl.magic4j.modules.sys.dto.SysDeptDTO;

import com.itgacl.magic4j.modules.sys.service.SysRoleDeptService;
import com.itgacl.magic4j.modules.sys.vo.DeptTreeVo;
import com.itgacl.magic4j.modules.sys.vo.TreeSelectVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * SysDeptController
 * @author 孤傲苍狼
 * @since 2020-04-02
 */
@Api(tags = "组织机构管理")
@Auth(name = "部门管理")
@RestController
@RequestMapping("/api/sys/dept")
public class SysDeptController extends SuperController{

    @Autowired
    private SysDeptService sysDeptService;

    @Autowired
    private SysRoleDeptService sysRoleDeptService;

    /**
     * 创建
     * @param sysDept
     * @return
     */
    @ApiOperation("新增")
    @Log(operation="创建",moduleName = "部门管理")
    @PostMapping
    public R<Void> create(@RequestBody @Validated(Constants.Create.class) SysDeptDTO sysDept){
        sysDeptService.create(sysDept);
        return R.ok();
    }

    /**
     * 更新
     * @param sysDept
     * @return
     */
    @ApiOperation("修改")
    @Log(operation="修改",moduleName = "部门管理")
    @PutMapping
    public R<Void> update(@RequestBody @Validated(Constants.Update.class) SysDeptDTO sysDept){
        sysDeptService.update(sysDept);
        return R.ok();
    }

    /**
     * 根据ID查找
     * @param id
     * @return
     */
    @ApiOperation("根据ID查找")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/{id}")
    public R<SysDeptDTO> get(@PathVariable("id") Long id){
        SysDeptDTO sysDeptDTO = sysDeptService.getSysDeptById(id);
        return R.ok(sysDeptDTO);
    }

    /**
     * 查询全部
     * @return
     */
    @ApiOperation("查询全部")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping
    public R<List<SysDeptDTO>> get() {
        List<SysDeptDTO> sysDeptList = sysDeptService.getList(null);
        return R.ok(sysDeptList);
    }

    /**
     * 根据ID删除
     * @param ids
     * @return
     */
    @ApiOperation("根据ID删除")
    @Log(operation="删除",moduleName = "部门管理")
    @DeleteMapping("/{ids}")
    public R<Void> delete(@PathVariable("ids") Long[] ids){
        if(ids.length==1){
            sysDeptService.deleteById(ids[0]);
        }else {
            List<Long> idList = Arrays.asList(ids);
            sysDeptService.deleteByIds(idList);
        }
        return R.ok();
    }

    /**
     * 获取部门树列表
     * @return
     */
    @ApiOperation("获取组织机构树列表")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/tree")
    public R<List<DeptTreeVo>> getDeptTreeList(SysDeptDTO dept) {
        return R.ok(TreeUtil.buildTree(sysDeptService.getDeptTree(dept)));
    }

    /**
     * 获取部门树
     * @return
     */
    @ApiOperation("获取组织机构树")
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/tree/{id}")
    public R<DeptTreeVo> getDeptTreeList(@PathVariable("id") Long id) {
        return R.ok(sysDeptService.getDeptTreeById(id));
    }

    /**
     * 列表
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/list")
    public List<SysDeptExt> list(){
        return sysDeptService.queryList();
    }

    /**
     * 获取部门下拉树列表
     */
    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/treeSelect")
    public R<List<TreeSelectVo>> treeSelect(SysDeptDTO dept) {
        List<DeptTreeVo> deptTree = TreeUtil.buildTree(sysDeptService.getDeptTree(dept));
        List<TreeSelectVo> treeSelectVos = new ArrayList<>();
        deptTree.forEach(deptTreeVo -> {
            TreeSelectVo treeSelectVo = new TreeSelectVo(deptTreeVo);
            treeSelectVos.add(treeSelectVo);
        });
        return R.ok(treeSelectVos);
    }

    @Auth(isAuth = false)//不进行权限控制
    @GetMapping("/roleDeptTreeSelect/{roleId}")
    public R<Map<Object, Object>> roleDeptTreeSelect(@PathVariable("roleId") Long roleId){
        List<SysRoleDept> roleDeptList = sysRoleDeptService.query().select(SysRoleDept.DEPT_ID).eq(SysRoleDept.ROLE_ID, roleId).list();
        List<Long> roleDeptIds = new ArrayList<>();
        roleDeptList.forEach(item-> roleDeptIds.add(item.getDeptId()));
        Map<Object, Object> dataMap = Maps.builder()
                .put("roleDeptIds",roleDeptIds)
                .build();
        return R.ok(dataMap);
    }
}