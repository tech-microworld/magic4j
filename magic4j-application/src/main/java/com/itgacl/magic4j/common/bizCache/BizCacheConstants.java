package com.itgacl.magic4j.common.bizCache;

/**
 * 业务缓存常量
 */
public interface BizCacheConstants {

    String SECURITY_SETTING_CACHE = "securitySetting";

    interface User {
        String SID_PREFIX = "userInfo:sid:";//根据sid 获取 uid
        String UID_PREFIX = "userInfo:uid:";//根据uid 获取 userInfo
        String UID_SID_PREFIX = "userInfo:uid:sid:"; // 根据 uid 获取 sid
    }

    interface Sms {
        String VERIFICATION_CODE = "verification_code:mobile:";
    }

    interface SYS {
        String USER_ID ="user:id:";
        String ROLE_ID = "role:id:";
        String RESOURCE_ID = "resource:id:";
        String AREA_ID = "area:id:";
        String DEPT_ID = "dept:id:";
        String POST_ID = "post:id:";
        String CONFIG_ID = "config:id:";
    }

    /**
     * 字典类型
     */
    interface DICT_TYPE{
        String OPER_TYPE = "oper_type";
        String USER_SEX = "user_sex";
        String USER_STATUS = "user_status";
    }
}
