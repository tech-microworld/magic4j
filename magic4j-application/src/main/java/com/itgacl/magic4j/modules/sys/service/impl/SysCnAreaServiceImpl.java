package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;
import com.itgacl.magic4j.libcommon.component.api.bean.RegionInfo;
import com.itgacl.magic4j.libcommon.component.api.service.CommApiService;
import com.itgacl.magic4j.modules.sys.dto.SysCnAreaDTO;
import com.itgacl.magic4j.modules.sys.entity.SysDept;
import com.itgacl.magic4j.modules.sys.query.SysCnAreaQuery;
import com.itgacl.magic4j.modules.sys.vo.AreaTreeVo;
import com.itgacl.magic4j.modules.sys.vo.DeptTreeVo;
import com.itgacl.magic4j.modules.sys.vo.SysCnAreaVo;
import com.itgacl.magic4j.modules.sys.converter.SysCnAreaConverter;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.entity.SysCnArea;
import com.itgacl.magic4j.modules.sys.mapper.SysCnAreaMapper;
import com.itgacl.magic4j.modules.sys.service.SysCnAreaService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itgacl.magic4j.common.bean.PageData;
import com.itgacl.magic4j.common.bean.PageParam;
import java.util.ArrayList;
import java.util.List;

/**
 * @Classname SysCnAreaServiceImpl
 * @Description SysCnAreaService实现类
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-09-03
 * @Version 1.0
 */
@Service
public class SysCnAreaServiceImpl extends ServiceImpl<SysCnAreaMapper, SysCnArea> implements SysCnAreaService {

    @Autowired
    private CommApiService commApiService;

    @Override
    public void create(SysCnAreaDTO sysCnAreaDTO) {
        dataValidator.validate(sysCnAreaDTO);//业务处理校验
        SysCnArea sysCnArea = SysCnAreaConverter.build().entity(sysCnAreaDTO);//DTO转换成Entity
        save(sysCnArea);//保存
    }

    @Override
    public void update(SysCnAreaDTO sysCnAreaDTO) {
        dataValidator.validate(sysCnAreaDTO);//业务处理校验
        SysCnArea sysCnArea = SysCnAreaConverter.build().entity(sysCnAreaDTO);//DTO转换成Entity
        updateById(sysCnArea);
    }
    /**
    * 导入数据
    * @param dataList
    * @param isCovered
    */
    @Override
    public void importData(List<SysCnAreaDTO> dataList, Boolean isCovered) {
        dataList.forEach(sysCnAreaDTO -> {
            if(isCovered) {
                SysCnArea oldData = query().eq(SysCnArea.NAME,sysCnAreaDTO.getName()).one();
                if (oldData != null && oldData.getId() != null) {
                    //找到了就覆盖旧数据
                    sysCnAreaDTO.setId(oldData.getId());
                    update(sysCnAreaDTO);
                }else{
                    //找不到就新增
                    create(sysCnAreaDTO);
                }
            }else {
                create(sysCnAreaDTO);
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
    public SysCnAreaVo getSysCnAreaById(Long id) {
        SysCnArea sysCnArea = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysCnArea);
        return SysCnAreaConverter.build().vo(sysCnArea);
    }

    @Override
    public void delete(QueryWrapper<SysCnArea> queryWrapper) {
        remove(queryWrapper);
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysCnAreaVo> getList(QueryWrapper<SysCnArea> queryWrapper) {
        List<SysCnArea> sysCnAreaList = list(queryWrapper);
        return SysCnAreaConverter.build().listVO(sysCnAreaList);
    }

    @Override
    public PageData<SysCnAreaVo> pageList(Page<SysCnArea> page, QueryWrapper<SysCnArea> queryWrapper) {
        IPage<SysCnArea> pageInfo = page(page,queryWrapper);//mybatisPlus分页查询
        IPage<SysCnAreaVo> pageVO = SysCnAreaConverter.build().pageVO(pageInfo);
        return PageData.build(pageVO);
    }

    @Override
    public PageData<SysCnAreaVo> pageList(PageParam pageParam, QueryWrapper<SysCnArea> queryWrapper) {
        Page<SysCnArea> page = new Page<>(pageParam.getPageNum(),pageParam.getPageSize());
        return pageList(page,queryWrapper);
    }

    @Override
    public List<AreaTreeVo> geAreaTreeList() {
        List<SysCnArea> cnAreaList = list();
        List<AreaTreeVo> areaTreeVoList = new ArrayList<>();
        for(SysCnArea cnArea:cnAreaList){
            AreaTreeVo areaTreeVo = new AreaTreeVo();
            BeanUtils.copyProperties(cnArea, areaTreeVo);
            areaTreeVo.setId(cnArea.getId());
            if(cnArea.getParentId() != null){
                areaTreeVo.setParentId(cnArea.getParentId());
            }
            areaTreeVoList.add(areaTreeVo);
        }
        return areaTreeVoList;
    }

    @Override
    public List<AreaTreeVo> getAreaTreeListById(Long id) {
        SysCnArea sysCnArea = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysCnArea);
        AreaTreeVo areaTreeVo = new AreaTreeVo();
        BeanUtils.copyProperties(sysCnArea, areaTreeVo);
        areaTreeVo.setId(sysCnArea.getId());
        if(sysCnArea.getParentId() != null){
            areaTreeVo.setParentId(sysCnArea.getParentId());
        }
        List<AreaTreeVo> areaTreeVoList = new ArrayList<>();
        areaTreeVoList.add(areaTreeVo);
        recursionQuerySubArea(areaTreeVoList, areaTreeVo.getId());//递归查询子区域
        return areaTreeVoList;
    }

    @Override
    public List<AreaTreeVo> getParentAreaTreeListById(Long id) {
        List<AreaTreeVo> areaTreeVoList = new ArrayList<>();
        SysCnArea cnArea = getById(id);
        recursionQueryParentArea(areaTreeVoList,cnArea);
        return areaTreeVoList;
    }

    @Override
    public AreaTreeVo getAreaTreeById(Long id) {
        SysCnArea sysCnArea = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysCnArea);
        AreaTreeVo areaTreeVo = new AreaTreeVo();
        BeanUtils.copyProperties(sysCnArea, areaTreeVo);
        areaTreeVo.setId(sysCnArea.getId());
        if(sysCnArea.getParentId() != null){
            areaTreeVo.setParentId(sysCnArea.getParentId());
        }
        recursionQuerySubArea(areaTreeVo);//递归查询子资源
        return areaTreeVo;
    }

    @Override
    public List<AreaTreeVo> getAreaTree(SysCnAreaQuery query) {
        QueryWrapper<SysCnArea> queryWrapper = new QueryWrapper<>();
        List<AreaTreeVo> areaTreeVoList = new ArrayList<>();
        if(query != null){
            //构建查询条件
            if(query.getId() != null){
                //查询出所有的父区域
                List<AreaTreeVo> areaTreeVos = getParentAreaTreeListById(query.getId());
                List<Long> parentIds = new ArrayList<>();
                areaTreeVos.forEach(areaTreeVo -> {
                    if(areaTreeVo.getParentId()!=null){
                        areaTreeVoList.add(areaTreeVo);
                    }
                    parentIds.add(areaTreeVo.getId());
                });
                queryWrapper.eq(SysCnArea.LEVEL,1).notIn(SysCnArea.ID,parentIds);
            }
            if(StrUtil.isNotBlank(query.getName())){
                queryWrapper.like(SysCnArea.NAME,query.getName());
            }
            if(StrUtil.isNotBlank(query.getShortName())){
                queryWrapper.like(SysCnArea.SHORT_NAME,query.getShortName());
            }
            if(query.getParentId() != null){
                queryWrapper.eq(SysCnArea.PARENT_ID,query.getParentId());
            }
            if(StrUtil.isNotBlank(query.getParentName())){
                queryWrapper.like(SysCnArea.PARENT_NAME,query.getParentName());
            }
        }
        if(queryWrapper.isEmptyOfWhere()){
            queryWrapper.eq(SysCnArea.LEVEL,1);
        }
        List<SysCnArea> sysCnAreaList = list(queryWrapper);
        areaTreeVoList.addAll(SysCnAreaConverter.build().treeListVo(sysCnAreaList));
        return areaTreeVoList;
    }

    /**
     * 递归查询子区域
     */
    private void recursionQuerySubArea(AreaTreeVo areaTreeVo){
        Long id = areaTreeVo.getId();
        //根据parentId查询
        List<AreaTreeVo> childrenVoList = new ArrayList<>();
        //查找子资源信息
        List<SysCnArea> subAreaList = query().eq(SysCnArea.PARENT_ID,id).list();
        if(CollectionUtils.isNotEmpty(subAreaList)){
            //子节点信息不为空
            for(SysCnArea sysCnArea:subAreaList) {
                AreaTreeVo subAreaTreeVo = new AreaTreeVo();
                BeanUtils.copyProperties(sysCnArea, subAreaTreeVo);
                subAreaTreeVo.setId(sysCnArea.getId());
                if(sysCnArea.getParentId() != null){
                    subAreaTreeVo.setParentId(sysCnArea.getParentId());
                }
                childrenVoList.add(subAreaTreeVo);
            }
            for(AreaTreeVo resourceVo:childrenVoList){
                //递归查询
                recursionQuerySubArea(resourceVo);
            }
        }
        areaTreeVo.setChildren(childrenVoList);
    }

    /**
     * 递归查询子区域信息
     * @param voList
     * @param areaId
     */
    private void recursionQuerySubArea(List<AreaTreeVo> voList, Long areaId){
        //根据parentId查询子区域信息
        List<SysCnArea> subAreaList = query().eq(SysCnArea.PARENT_ID,areaId).list();
        if(CollectionUtils.isNotEmpty(subAreaList)){
            List<AreaTreeVo> childrenVoList = new ArrayList<>();
            //子节点信息不为空
            for(SysCnArea sysCnArea:subAreaList) {
                AreaTreeVo subAreaTreeVo = SysCnAreaConverter.build().treeVo(sysCnArea);
                childrenVoList.add(subAreaTreeVo);
            }
            voList.addAll(childrenVoList);
            for(AreaTreeVo resourceVo:childrenVoList){
                List<AreaTreeVo> childrenList = new ArrayList<>();
                //递归查询
                recursionQuerySubArea(childrenList,resourceVo.getId());
                voList.addAll(childrenList);
            }
        }
    }

    /**
     * 递归查询父区域信息
     * @param voList
     * @param area
     */
    private void recursionQueryParentArea(List<AreaTreeVo> voList, SysCnArea area){
        //根据Id查询父区域信息
        if(area.getParentId()!=null){
            SysCnArea parentArea = getById(area.getParentId());
            AreaTreeVo parentAreaTreeVo = SysCnAreaConverter.build().treeVo(parentArea);
            voList.add(parentAreaTreeVo);
            //递归
            recursionQueryParentArea(voList,parentArea);
        }
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysCnAreaDTO> dataValidator = new DataValidator<SysCnAreaDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysCnAreaDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysCnAreaDTO data) {
            Integer count = query().eq(SysCnArea.NAME, data.getName()).count();
            AssertUtil.isTrue(ErrorCodeEnum.NAME_ALREADY_EXISTS, count == 0);
            if(data.getParentId()!=null){
                SysCnArea cnArea = getById(data.getParentId());
                data.setParentName(cnArea.getName());
                data.setLevel(cnArea.getLevel()+1);//计算级别
                try {
                    data.setPinyin(PinyinHelper.convertToPinyinString(data.getName() , "", PinyinFormat.WITHOUT_TONE));//汉字转拼音
                    RegionInfo regionInfo = commApiService.getRegionInfo(data.getName(), cnArea.getName());
                    data.setAreaCode(regionInfo.getAdCode());
                    data.setLat(regionInfo.getLat());
                    data.setLng(regionInfo.getLng());
                } catch (Exception e) {
                    log.error(e.getMessage(),e);
                }
            }else {
                data.setLevel(1);//计算级别
                try {
                    data.setPinyin(PinyinHelper.convertToPinyinString(data.getName() , "", PinyinFormat.WITHOUT_TONE));//汉字转拼音
                    RegionInfo regionInfo = commApiService.getRegionInfo(data.getName(), data.getName());
                    data.setAreaCode(regionInfo.getAdCode());
                    data.setLat(regionInfo.getLat());
                    data.setLng(regionInfo.getLng());
                } catch (Exception e) {
                    log.error(e.getMessage(),e);
                }
            }
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysCnAreaDTO data) {
            SysCnArea cnArea = query().eq(SysCnArea.NAME, data.getName()).one();
            if(cnArea != null){
                AssertUtil.equals(ErrorCodeEnum.NAME_ALREADY_EXISTS,cnArea.getId(),data.getId());
            }
            if(data.getParentId()!=null){
                SysCnArea parentArea = getById(data.getParentId());
                data.setParentName(parentArea.getName());
                data.setLevel(parentArea.getLevel()+1);//计算级别
            }
        }
    };
}
