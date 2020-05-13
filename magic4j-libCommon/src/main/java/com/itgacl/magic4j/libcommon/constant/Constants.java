package com.itgacl.magic4j.libcommon.constant;

/**
 * 业务类常量
 */
public interface Constants {

    /** 超级管理员角色标识*/
    String SUPER_ADMIN_FLAG = "magic4j_admin";

    /** 超级租户ID */
    Long SUPER_TENANT_ID = 0L;

    interface SYS_CONFIG_KEY{
        String AES_SECRET_KEY = "AesSecretKey";
        String RSA_KEY_PAIR = "RsaKeyPair";
        String PRIVATE_KEY = "privateKey";
        String PUBLIC_KEY = "publicKey";
        String SECURITY_SETTING = "securitySetting";
        String FILE_STORAGE_TYPE = "fileStorageType";
        String PLATFORM_SETTING = "PlatformSetting";
    }


    /**
     * 验证码
     */
    String VERIFY_CODE = "verifyCode:";

    String STORAGE_TYPE= "file_storage_type";

   interface SECURITY{
        String AES_SECRET_KEY = "aes_secret_key";
        String RSA_PUBLIC_KEY = "rsa_public_key";
        String RSA_PRIVATE_KEY = "rsa_private_key";
   }

   interface CACHE_KEY{
       String STORE_KEY = "cacheKey";
       String RESOURCE_ACCESS_PERMISSION="resource_access_permission";
   }

   interface TOKEN_TYPE{
       String JWT = "BearerToken";
       String SESSION ="SessionToken";
   }

    /**
     * 令牌
     */
    String TOKEN = "token";

    /**
     * 令牌前缀
     */
    String TOKEN_PREFIX = "Bearer ";

    /**
     * 令牌前缀
     */
    String LOGIN_USER_KEY = "login_user_key";

    /**
     * 登录用户信息
     */
    interface LOGIN_USER{

        //认证Token
        String AUTHORIZATION ="authorization";

        /**
         * 登录用户的token
         */
        String TOKEN_PREFIX = "loginUser:token:";
        /**
         * 登录用户的用户ID
         */
        String UID_PREFIX = "loginUser:uid:";
        /**
         * 登录用户的权限
         */
        String PERMS_PREFIX = "loginUser:perms:uid:";
        /**
         * 登录用户名（唯一）
         */
        String USERNAME_PREFIX = "loginUser:username:";
    }

    /**
     * 数据库的各个表的deleteFlag字段取值
     *
     */
    interface DELETE_FLAG{
        /**
         * 已删除
         */
        Integer YES = 1;
        /**
         * 未删除
         */
        Integer NO = 0;

    }

    /**
     * 资源类型
     * 0：系统授权资源 1：菜单   2：按钮
     */
    interface RESOURCE_TYPE{
        /**
         * 系统授权资源
         */
        Integer SYS_AUTH_RESOURCE = 0;
        /**
         * 菜单
         */
        Integer MENU = 1;
        /**
         * 案例
         */
        Integer BUTTON = 2;
    }

    /**
     * 用户状态
     * 0-正常，1-冻结禁用
     */
    interface USER_STATUS {
        int NORMAL = 0;//正常
        int FROZEN = 1;//冻结禁用
    }


    /**
     * 数据库性别字段
     */
    interface GENDER {
        /**
         * 男
         */
        int MALE = 1;
        /**
         * 女
         */
        int FEMALE = 2;

        /**
         * 保密
         */
        int SECRECY = 0;
    }

    /**
     * 邮件类型
     */
    interface EMAIL_TYPE{
        int SIMPLE_MAIL = 0;//简单文本邮件
        int HTML_MAIL = 1;//html邮件
        int ATTACHMENTS_MAIL = 2;//带附件的邮件
        int RESOURCE_MAIL = 3;//带静态资源邮件
    }

    /**
     * 分组校验标识接口
     */
    interface Create {

    }

    /**
     * 分组校验标识接口
     */
    interface Update {

    }

    /**
     * 分组校验标识接口
     */
    interface Status {

    }

    interface Page {

        /**
         * 页数
         */
        String PAGE_PAGE = "cursor";
        /**
         * 分页大小
         */
        String PAGE_ROWS = "limit";
        /**
         * 排序字段 ASC
         */
        String PAGE_ASC = "asc";
        /**
         * 排序字段 DESC
         */
        String PAGE_DESC = "desc";
        /**
         * 查询总数
         */
        String SEARCH_COUNT = "searchCount";
        /**
         * 默认每页条目20,最大条目数100
         */
        int DEFAULT_LIMIT = 20;
        int MAX_LIMIT = 100;

    }
}
