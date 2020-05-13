package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.dto.SysDeptDTO;
import com.itgacl.magic4j.modules.sys.entity.SysDept;
import com.itgacl.magic4j.modules.sys.entity.ext.SysDeptExt;
import com.itgacl.magic4j.modules.sys.mapper.SysDeptMapper;
import com.itgacl.magic4j.modules.sys.service.SysDeptService;
import com.itgacl.magic4j.modules.sys.vo.DeptTreeVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * SysDeptService 实现类
 * @author 孤傲苍狼
 * @since 2020-04-02
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {

    @Autowired
    private SysDeptMapper sysDeptMapper;

    @Override
    public void create(SysDeptDTO sysDeptDTO) {
        dataValidator.validate(sysDeptDTO);//业务处理校验
        SysDept sysDept = new SysDept();
        BeanUtils.copyProperties(sysDeptDTO,sysDept);
        save(sysDept);//保存
    }

    @Override
    public void update(SysDeptDTO sysDeptDTO) {
        dataValidator.validate(sysDeptDTO);//业务处理校验
        SysDept sysDept = new SysDept();
        BeanUtils.copyProperties(sysDeptDTO,sysDept);
        updateById(sysDept);
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
    public SysDeptDTO getSysDeptById(Long id) {
        SysDept sysDept = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysDept);
        SysDeptDTO sysDeptDTO = new SysDeptDTO();
        BeanUtils.copyProperties(sysDept,sysDeptDTO);
        return sysDeptDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysDeptDTO> getList(QueryWrapper<SysDept> queryWrapper) {
        List<SysDeptDTO> sysDeptDTOList = new ArrayList<>();
        List<SysDept> sysDeptList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysDeptList)){
            sysDeptList.forEach(sysDept -> {
                SysDeptDTO sysDeptDTO = new SysDeptDTO();
                BeanUtils.copyProperties(sysDept,sysDeptDTO);
                sysDeptDTOList.add(sysDeptDTO);
            });
        }
        return sysDeptDTOList;
    }

    /**
     * 根据部门ID获取该部门及其下属部门树
     */
    @Override
    public DeptTreeVo getDeptTreeById(Long id) {
        List<DeptTreeVo> deptTreeVoList = getDeptTree(null);
        Map<Long, DeptTreeVo> map = deptTreeVoList.stream().collect(Collectors.toMap(DeptTreeVo::getId, deptTreeVo -> deptTreeVo));
        for (DeptTreeVo dept : map.values()) {
            DeptTreeVo parent = map.get(dept.getParentId());
            if (parent != null) {
                List<DeptTreeVo> children = parent.getChildren() == null ? new ArrayList<>() : parent.getChildren();
                children.add(dept);
                parent.setChildren(children);
            }
        }
        return map.get(id);
    }

    /**
     * 获取部门树
     *
     * @return
     */
    @Override
    public List<DeptTreeVo> getDeptTree(SysDeptDTO dept) {
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc(SysDept.ORDER_NUM);
        if(ObjectUtil.isNotEmpty(dept)){
            if(ObjectUtil.isNotEmpty(dept.getParentId())){
                queryWrapper.eq(SysDept.PARENT_ID,dept.getParentId());
            }
            if(ObjectUtil.isNotEmpty(dept.getStatus())){
                queryWrapper.eq(SysDept.STATUS,dept.getStatus());
            }
            if(StrUtil.isNotEmpty(dept.getDeptName())){
                queryWrapper.like(SysDept.DEPT_NAME,dept.getDeptName());
            }
        }
        List<SysDept> sysDeptList = list(queryWrapper);
        List<DeptTreeVo> deptTreeVoList = new ArrayList<>();
        sysDeptList.forEach(sysDept -> {
            DeptTreeVo deptTreeVo = new DeptTreeVo();
            BeanUtils.copyProperties(sysDept,deptTreeVo);
            deptTreeVo.setId(sysDept.getId());
            if(sysDept.getParentId() != null){
                deptTreeVo.setParentId(sysDept.getParentId());
            }
            deptTreeVoList.add(deptTreeVo);
        });
        return deptTreeVoList;
    }

    /**
     * 通过部门id查询于此相关的部门ids(包括自身和子部门的ID)
     * @param deptId
     * @return
     */
    @Override
    public List<Long> selectDeptIds(Long deptId) {
        DeptTreeVo deptTreeVo = getDeptTreeById(deptId);
        List<Long> deptIdList = new ArrayList<>();
        if (deptTreeVo != null) {
            deptIdList.add(deptTreeVo.getId());
            recursionDeptIdList(deptIdList, deptTreeVo);
        }
        return deptIdList;
    }

    @Override
    public List<SysDeptExt> queryList() {
        return sysDeptMapper.queryList();
    }

    private void recursionDeptIdList(List<Long> deptIdList, DeptTreeVo deptTreeVo) {
        List<DeptTreeVo> children = deptTreeVo.getChildren();
        if (children != null) {
            for (DeptTreeVo d : children) {
                deptIdList.add(d.getId());
                recursionDeptIdList(deptIdList, d);//递归
            }
        }
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysDeptDTO> dataValidator = new DataValidator<SysDeptDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysDeptDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysDeptDTO data) {
            Integer count = query().eq(SysDept.DEPT_NAME, data.getDeptName()).count();
            AssertUtil.isTrue(ErrorCodeEnum.NAME_ALREADY_EXISTS, count == 0);
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysDeptDTO data) {
            SysDept sysDept = query().eq(SysDept.DEPT_NAME, data.getDeptName()).one();
            if(sysDept != null){
                AssertUtil.equals(ErrorCodeEnum.NAME_ALREADY_EXISTS,sysDept.getId(),data.getId());
            }
        }
    };
}
