package com.itgacl.magic4j.common.datascope;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.db.Db;
import cn.hutool.db.Entity;
import com.baomidou.mybatisplus.core.toolkit.PluginUtils;
import com.baomidou.mybatisplus.extension.handlers.AbstractSqlParserHandler;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;
import com.itgacl.magic4j.datascope.DataScope;
import com.itgacl.magic4j.modules.sys.entity.SysRoleDept;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;

import javax.sql.DataSource;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * @Classname DataScopeInterceptor
 * @Description Mybatis拦截器 主要用于数据权限拦截，为了保证执行顺序，需要在mybatis-config.xml进行配置
 * @Author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @Date 2020-04-05 12:30
 * @Version 1.0
 */
@Slf4j
@AllArgsConstructor
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class, Integer.class})})
public class DataScopeInterceptor extends AbstractSqlParserHandler implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        DataScopeConfig dataScopeConfig = SpringContextUtils.getBean(DataScopeConfig.class);
        if(!dataScopeConfig.isEnabled()){
            return invocation.proceed();
        }
        StatementHandler statementHandler = PluginUtils.realTarget(invocation.getTarget());
        MetaObject metaObject = SystemMetaObject.forObject(statementHandler);
        this.sqlParser(metaObject);
        // 先判断是不是SELECT操作 不是直接过滤
        MappedStatement mappedStatement = (MappedStatement) metaObject.getValue("delegate.mappedStatement");
        if (!SqlCommandType.SELECT.equals(mappedStatement.getSqlCommandType())) {
            return invocation.proceed();
        }
        LoginUser loginUser = LoginUserContext.get();
        if(loginUser != null) {
            if (isSuperAdminLogin(loginUser)) {//超级管理员不过滤
                return invocation.proceed();//执行具体的方法
            } else {
                //根据数据权限过滤
                //没DataScope注解的方法不需要进行数据权限限制，直接执行具体的方法
                DataScope dataScope = getDataScope(mappedStatement);
                if (dataScope == null) {
                    return invocation.proceed();
                }
                BoundSql boundSql = (BoundSql) metaObject.getValue("delegate.boundSql");
                // 执行的SQL语句
                String originalSql = boundSql.getSql();
                String scopeName = dataScope.tableFieldName();
                List<Long> deptIds = new ArrayList<>();//需要过滤的部门ID
                // 解析角色Id
                List<Long> roleIdList = new ArrayList<>();
                loginUser.getRoleList().forEach(role -> roleIdList.add(role.getRoleId()));
                DataSource dataSource = SpringContextUtils.getBean(DataSource.class);
                // 通过角色Id查询范围权限
                Entity query = Db.use(dataSource)
                        .query("SELECT * FROM sys_role where id IN (" + CollUtil.join(roleIdList, ",") + ")")
                        .stream().min(Comparator.comparingInt(o -> o.getInt("data_scope"))).get();
                // 数据库权限范围字段
                Integer dsType = query.getInt("data_scope");
                // 查询全部
                if (DataScopeTypeEnum.ALL.getType() == dsType) {
                    return invocation.proceed();
                }
                // 通过角色Id查询范围权限
                List<Entity> entityList = Db.use(dataSource).query("SELECT * FROM sys_role_dept where role_id IN (" + CollUtil.join(roleIdList, ",") + ")");
                entityList.forEach(entity -> deptIds.add(entity.getLong(SysRoleDept.DEPT_ID)));
                if(CollectionUtil.isNotEmpty(deptIds)){
                    String join = CollectionUtil.join(deptIds, ",");
                    String dataScopeSql = "select * from (" + originalSql + ") temp_data_scope where temp_data_scope." + scopeName + " in (" + join + ")";
                    metaObject.setValue("delegate.boundSql.sql", dataScopeSql);
                }
                return invocation.proceed();
            }
        }
        return invocation.proceed();
    }

    /**
     * 生成拦截对象的代理
     *
     * @param target 目标对象
     * @return 代理对象
     */
    @Override
    public Object plugin(Object target) {
        if (target instanceof StatementHandler) {
            return Plugin.wrap(target, this);
        }
        return target;
    }

    /**
     * 通过反射获取mapper方法是否加了DataScope自定义注解
     */
    private DataScope getDataScope(MappedStatement mappedStatement) throws ClassNotFoundException {
        DataScope dataScope = null;
        String id = mappedStatement.getId();
        String className = id.substring(0, id.lastIndexOf("."));
        String methodName = id.substring(id.lastIndexOf(".") + 1);
        final Class<?> cls = Class.forName(className);
        final Method[] methods = cls.getMethods();
        for (Method method : methods) {
            if (method.getName().equals(methodName) && method.isAnnotationPresent(DataScope.class)) {
                dataScope = method.getAnnotation(DataScope.class);
                break;
            }
        }
        return dataScope;
    }

    /**
     * 判断是否为超级管理员登录
     * @param loginUser
     * @return
     */
    private boolean isSuperAdminLogin(LoginUser loginUser){
        boolean isSuperAdmin = false;
        List<LoginUser.Role> roles = loginUser.getRoleList();
        for (LoginUser.Role role:roles) {
            if(Constants.SUPER_ADMIN_FLAG.equals(role.getRoleCode())){
                isSuperAdmin = true;
                break;
            }
        }
        return isSuperAdmin;
    }
}
