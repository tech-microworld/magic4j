package com.itgacl.magic4j.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itgacl.magic4j.common.enums.ErrorCodeEnum;
import com.itgacl.magic4j.common.util.AssertUtil;
import com.itgacl.magic4j.common.validator.DataValidator;
import com.itgacl.magic4j.modules.sys.dto.SysDictDTO;
import com.itgacl.magic4j.modules.sys.entity.SysDict;
import com.itgacl.magic4j.modules.sys.mapper.SysDictMapper;
import com.itgacl.magic4j.modules.sys.service.SysDictService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * SysDictService 实现类
 * @author 孤傲苍狼
 * @since 2020-03-29
 */
@Service
public class SysDictServiceImpl extends ServiceImpl<SysDictMapper, SysDict> implements SysDictService {

    @Override
    public void create(SysDictDTO sysDictDTO) {
        List<SysDictDTO.DictDataItem> dictDataItems = sysDictDTO.getDictDataItems();
        if(CollectionUtil.isNotEmpty(dictDataItems)){
            dictDataItems.forEach(item->{
                sysDictDTO.setDictCode(item.getDictCode());
                sysDictDTO.setDictLabel(item.getDictLabel());
                dataValidator.validate(sysDictDTO);//业务处理校验
                SysDict sysDict = new SysDict();
                BeanUtils.copyProperties(sysDictDTO,sysDict);
                save(sysDict);//保存
            });
        }else {
            dataValidator.validate(sysDictDTO);//业务处理校验
            SysDict sysDict = new SysDict();
            BeanUtils.copyProperties(sysDictDTO,sysDict);
            save(sysDict);//保存
        }
    }

    @Override
    public void update(SysDictDTO sysDictDTO) {
        dataValidator.validate(sysDictDTO);//业务处理校验
        SysDict sysDict = new SysDict();
        BeanUtils.copyProperties(sysDictDTO,sysDict);
        updateById(sysDict);
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
    public SysDictDTO getSysDictById(Long id) {
        SysDict sysDict = getById(id);
        AssertUtil.notNull(ErrorCodeEnum.DATA_NOT_EXIST,sysDict);
        SysDictDTO sysDictDTO = new SysDictDTO();
        BeanUtils.copyProperties(sysDict,sysDictDTO);
        return sysDictDTO;
    }

    @Override
    public void deleteAll() {
        remove(null);//全部删除(逻辑删除)
    }

    @Override
    public List<SysDictDTO> getList(QueryWrapper queryWrapper) {
        List<SysDictDTO> sysDictDTOList = new ArrayList<>();
        List<SysDict> sysDictList = list(queryWrapper);
        if(CollectionUtil.isNotEmpty(sysDictList)){
            sysDictList.forEach(sysDict -> {
                SysDictDTO sysDictDTO = new SysDictDTO();
                BeanUtils.copyProperties(sysDict,sysDictDTO);
                sysDictDTOList.add(sysDictDTO);
            });
        }
        return sysDictDTOList;
    }

    /**
     * 数据校验器
     */
    private DataValidator<SysDictDTO> dataValidator = new DataValidator<SysDictDTO>(){

        /**
        * 数据合法性校验(非空、数据格式等)
        * @param data
        */
        @Override
        protected void validateData(SysDictDTO data) {
            //todo:在这里编写数据校验处理逻辑，如果校验不通过，抛出DataValidationException异常
            // throw new DataValidationException("校验不通过抛出的错误提示消息");
        }

        /**
         * 保存之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeCreate(SysDictDTO data) {
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put(SysDict.DICT_TYPE, data.getDictType());
            paramMap.put(SysDict.DICT_CODE, data.getDictCode());
            Integer count = query().allEq(paramMap).count();
            AssertUtil.isTrue(ErrorCodeEnum.DATA_EXIST, count == 0);
        }

        /**
         * 更新之前进行校验(例如：数据是否已存在校验)
         * @param data
         */
        @Override
        protected void beforeUpdate(SysDictDTO data) {
            SysDict existDict = getById(data.getId());//已经存在的字典数据
            if(StrUtil.isNotEmpty(data.getDictType())){//用户修改了字典类型
                AssertUtil.equals(ErrorCodeEnum.DATA_FORBIDDEN_UPDATE,existDict.getDictType(),data.getDictType());
            }
            if(StrUtil.isNotEmpty(data.getDictCode())){//用户修改了字典编码
                AssertUtil.equals(ErrorCodeEnum.DATA_FORBIDDEN_UPDATE,existDict.getDictCode(),data.getDictCode());
            }
        }
    };
}
