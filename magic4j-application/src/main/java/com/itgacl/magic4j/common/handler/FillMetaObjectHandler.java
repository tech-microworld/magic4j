package com.itgacl.magic4j.common.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.libcommon.constant.Constants;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 自动填充公共字段
 */
@Slf4j
@Component
public class FillMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        LoginUser loginUser = LoginUserContext.get();
        if(loginUser!=null){
            this.strictInsertFill(metaObject, "createUser", Long.class, loginUser.getId());
            this.strictInsertFill(metaObject, "updateUser", Long.class, loginUser.getId());
            //this.strictInsertFill(metaObject, "tenantId", Long.class, loginUser.getTenantId());
        }else {
            this.strictInsertFill(metaObject, "createUser", Long.class, 1L);
            this.strictInsertFill(metaObject, "updateUser", Long.class, 1L);
            //this.strictInsertFill(metaObject, "tenantId", Long.class, 0);
        }
        this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now());
        this.strictInsertFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
        this.strictInsertFill(metaObject, "deleteFlag", Integer.class, Constants.DELETE_FLAG.NO);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        LoginUser loginUser = LoginUserContext.get();
        if(loginUser!=null){
            this.strictInsertFill(metaObject, "updateUser", Long.class, loginUser.getId());
        }else {
            this.strictInsertFill(metaObject, "updateUser", Long.class, 1L);
        }
        this.strictUpdateFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
    }
}