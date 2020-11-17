package com.itgacl.magic4j.common.bean;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * 分页参数
 *
 */
@Data
@ApiModel("分页参数对象")
public class PageParam {
    /**
     * 当前页，最小值为1
     */
    @ApiModelProperty(value = "当前页，从1开始",required = true)
    @NotNull(message = "当前页不能为空")
    @Min(value = 1,message = "分页页码不正确，最小值为1")
    private Integer pageNum;

    /**
     * 每页显示记录数，最小值为1
     */
    @ApiModelProperty(value = "每页显示记录数，最小值为1",required = true)
    @NotNull(message = "每页显示记录数不能为空")
    @Min(value = 1,message = "每页显示记录数不正确，最小值为1")
    private Integer pageSize;

    /**
     * 排序列
     *
     */
    @ApiModelProperty("排序列")
    private String orderByColumn;

    /**
     * 排序的方向 "desc" 或者 "asc".
     *
     */
    @ApiModelProperty("排序的方向 desc或者asc")
    private String sortDirection;

    public String getOrderBy() {
        if (StringUtils.isEmpty(orderByColumn)) {
            return "";
        }
        return orderByColumn + " " + sortDirection;
    }
}
