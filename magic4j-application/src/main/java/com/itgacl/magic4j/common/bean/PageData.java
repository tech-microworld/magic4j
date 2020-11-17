package com.itgacl.magic4j.common.bean;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@ApiModel("分页数据")
@AllArgsConstructor
@Data
public class PageData<T> implements Serializable {

    @ApiModelProperty("总页数")
    private Long pages;

    @ApiModelProperty("总记录数")
    private Long total;

    @ApiModelProperty("数据列表")
    private List<T> rows;

    @ApiModelProperty("当前页")
    private Long currentPage;

    /**
     * 构建{@linkplain PageData}对象
     * @param pages
     * @param total
     * @param dataList
     * @param <T>
     * @return
     */
    public static <T> PageData<T> build(Long pages, Long total, List<T> dataList,Long currentPage) {
        return new PageData<>(pages,total,dataList,currentPage);
    }

    /**
     * 构建{@linkplain PageData}对象
     * @param page
     * @param <T>
     * @return
     */
    public static <T> PageData<T> build(IPage<T> page) {
        return build(page.getPages(),page.getTotal(),page.getRecords(),page.getCurrent());
    }
}
