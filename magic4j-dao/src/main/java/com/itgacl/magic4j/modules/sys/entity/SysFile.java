package com.itgacl.magic4j.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 文件管理
 * </p>
 *
 * @author Created by xudp (alias:孤傲苍狼) 290603672@qq.com
 * @since 2020-05-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_file")
public class SysFile implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 租户ID
     */
    private Long tenantId;

    /**
     * 上传文件的原始文件名
     */
    private String originalFileName;

    /**
     * 上传文件重命名后的文件名
     */
    private String newFileName;

    /**
     * 文件保存路径
     */
    private String savePath;

    /**
     * 文件网络访问URL地址
     */
    private String fileUrl;

    /**
     * 文件后缀名
     */
    private String fileSuffix;

    /**
     * 存储方式
     */
    private String storageType;

    /**
     * 文件大小
     */
    private Integer fileLength;

    /**
     * 文件MD5值
     */
    private String fileMd5;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private Long createUser;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 更新人
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateUser;

    /**
     * 删除标识(0:正常，1:已删除)
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleteFlag;


    public static final String ID = "id";

    public static final String TENANT_ID = "tenant_id";

    public static final String ORIGINAL_FILE_NAME = "original_file_name";

    public static final String NEW_FILE_NAME = "new_file_name";

    public static final String SAVE_PATH = "save_path";

    public static final String FILE_URL = "file_url";

    public static final String FILE_SUFFIX = "file_suffix";

    public static final String STORAGE_TYPE = "storage_type";

    public static final String FILE_LENGTH = "file_length";

    public static final String FILE_MD5 = "file_md5";

    public static final String REMARK = "remark";

    public static final String CREATE_TIME = "create_time";

    public static final String CREATE_USER = "create_user";

    public static final String UPDATE_TIME = "update_time";

    public static final String UPDATE_USER = "update_user";

    public static final String DELETE_FLAG = "delete_flag";

}
