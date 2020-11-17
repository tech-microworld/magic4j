package com.itgacl.magic4j.modules.sys.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 仪表板折线图数据Vo
 */
@ApiModel("仪表板折线图数据Vo")
@Data
public class DashboardLineChartVo implements Serializable {

    @ApiModelProperty("日期范围")
    private List<String> dateRangeList;//日期范围
    @ApiModelProperty("用户访问统计数据列表")
    private List<Integer> userAccessCountList;//用户访问统计数据列表
}
