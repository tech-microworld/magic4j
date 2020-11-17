package com.itgacl.magic4j.modules.sys.vo;

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
@Data
public class UserAccessAreaMapVo implements Serializable {

    private Map<String, BigDecimal[]> geoCoordMap = new HashMap<>();

    private List<MapData> dataList = new ArrayList<>();

    @Data
    public static class MapData{
        private String name;
        private Integer value;
    }
}
