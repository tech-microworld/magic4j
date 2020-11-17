package com.itgacl.magic4j.modules.sys.mapper;

import com.itgacl.magic4j.modules.sys.vo.CountStatisticVo;

import java.util.List;

/**
 *
 */
public interface DataStatisticMapper {

    /**
     * 统计指定的表7天内的新增数据
     * @return
     */
    List<CountStatisticVo> countStatistic(String tableName);

}
