package com.itgacl.magic4j.common.base;


import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.bean.PageParam;
import com.itgacl.magic4j.common.cache.biz.BizCacheService;
import com.itgacl.magic4j.libcommon.controller.Magic4jBaseController;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

public class AppBaseController extends Magic4jBaseController {

    @Autowired
    protected BizCacheService bizCacheService; //业务缓存

    /**
     * 当前记录起始索引
     */
    public static final String PAGE_NUM = "pageNum";

    /**
     * 每页显示记录数
     */
    public static final String PAGE_SIZE = "pageSize";

    /**
     * 封装分页对象，基于mybatisPlus
     */
    protected <T> Page<T> getPage() {
        HttpServletRequest request = SpringContextUtils.getRequest();
        PageParam pageParam = new PageParam();
        pageParam.setPageNum(Integer.valueOf(request.getParameter(PAGE_NUM)));
        pageParam.setPageSize(Integer.valueOf(request.getParameter(PAGE_SIZE)));
        return getPage(pageParam);
    }

    /**
     * 封装分页对象，基于mybatisPlus
     */
    protected <T> Page<T> getPage(PageParam pageParam) {
        Page<T> page = new Page<>(pageParam.getPageNum(),pageParam.getPageSize());
        page.addOrder(OrderItem.desc(pageParam.getOrderByColumn()));//排序
        return page;
    }
}
