package com.itgacl.magic4j.common.base;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.bean.PageParam;
import com.itgacl.magic4j.common.cache.biz.BizCacheService;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.controller.Magic4jBaseController;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;
import com.itgacl.magic4j.modules.sys.dto.TokenDTO;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class SuperController extends Magic4jBaseController {

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
     * 排序列
     */
    public static final String ORDER_BY_COLUMN = "orderByColumn";

    /**
     * 排序的方向 "desc" 或者 "asc".
     */
    public static final String SORT_DIRECTION = "sortDirection";

    /**
     * 获取当前登录的系统用户
     * @return
     */
    protected LoginUser getCurrLoginUser() {
        //从LoginUserContext中获取当前登录的系统用户
        return LoginUserContext.get();
    }

    protected TokenDTO getToken(){
        TokenDTO token = LoginUserContext.getToken();
        return token;
    }

    protected boolean isSuperAdminLogin(){
        boolean isSuperAdmin = false;
        List<LoginUser.Role> roles = getCurrLoginUser().getRoleList();
        for (LoginUser.Role role:roles) {
            if(Constants.SUPER_ADMIN_FLAG.equals(role.getRoleCode())){
                isSuperAdmin = true;
                break;
            }
        }
        return isSuperAdmin;
    }

    /**
     * 登录用户的ID
     * @return
     */
    protected Long getLoginUserId() {
        LoginUser loginUser = getCurrLoginUser();
        if(loginUser!=null){
            return loginUser.getId();
        }
        return null;
    }

    /**
     * 封装分页对象，基于mybatisPlus
     */
    protected <T> Page<T> getPage() {
        HttpServletRequest request = SpringContextUtils.getRequest();
        PageParam pageDomain = new PageParam();
        pageDomain.setPageNum(Integer.valueOf(request.getParameter(PAGE_NUM)));
        pageDomain.setPageSize(Integer.valueOf(request.getParameter(PAGE_SIZE)));
        pageDomain.setOrderByColumn(request.getParameter(ORDER_BY_COLUMN));
        pageDomain.setSortDirection(request.getParameter(SORT_DIRECTION));
        Page<T> page = new Page<>(pageDomain.getPageNum(),pageDomain.getPageSize());
        page.addOrder(OrderItem.desc(pageDomain.getOrderByColumn()));//排序
        return page;
    }

    /**
     * 封装分页对象，基于mybatisPlus
     */
    protected <T> Page<T> getPage(PageParam pageParam) {
        Page<T> page = new Page<>(pageParam.getPageNum(),pageParam.getPageSize());
        if(StrUtil.isNotBlank(pageParam.getOrderByColumn())){
            page.addOrder(OrderItem.desc(pageParam.getOrderByColumn()));//排序
        }
        return page;
    }
}
