package com.itgacl.magic4j.modules.sys.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户访问地图Vo
 */
@ApiModel("用户访问地图Vo")
@Data
public class UserAreaMapVo implements Serializable {

    @ApiModelProperty("气泡框数据列表")
    private List<ToolTipData> toolTipDataList = new ArrayList<>();
    @ApiModelProperty("地图数据列表")
    private List<MapData> dataList = new ArrayList<>();

    @Data
    public static class MapData{
        @ApiModelProperty("省份名称")
        private String name;//省份名称
        @ApiModelProperty("统计数据")
        private Integer value;//统计数据
    }

    @Data
    public static class ToolTipData{
        @ApiModelProperty("省份名称")
        private String name;//省份名称
        @ApiModelProperty("区域统计数据集合")
        private List<NV> value;//区域统计数据集合
    }

    @Data
    public static class NV{
        @ApiModelProperty("区域名称")
        private String name;//区域名称
        @ApiModelProperty("区域统计数据")
        private Integer value;//区域统计数据
    }
}
