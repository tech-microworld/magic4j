package com.itgacl.magic4j.modules.sys.vo;

import com.itgacl.magic4j.libcommon.bean.TreeNode;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class AreaVo extends TreeNode<AreaVo,Long> implements Serializable {

    private String name;

    private String shortName;

    private Integer zipCode;

    private String cityCode;

    private String pinyin;

    private BigDecimal lng;

    private BigDecimal lat;
}
