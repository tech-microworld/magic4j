package com.itgacl.magic4j.modules.sys.dto;
import com.alibaba.fastjson.annotation.JSONField;
import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@Data
public class SysDictDTO extends BaseDTO implements Serializable{

     private Integer parentId;//保留字段

     @NotBlank(message = "字典名称不能为空",groups = Constants.Create.class)
     private String dictName;

     /**
      *  字典类型(静态数据，设置了就不允许再更改)
      */
     @NotBlank(message = "字典类型不能为空",groups = Constants.Create.class)
     private String dictType;//固定的，不变的

     /**
      *  字典编码(静态数据，设置了就不允许再更改)
      */
     private String dictCode;

     private String dictLabel;

     private List<DictDataItem> dictDataItems;//字典数据项

     /**
      *  顺序
      */
     private Integer sortNo;

     /**
      * 字典描述
      */
     private String dictDesc;

     private LocalDateTime createTime;

     @JSONField(serialize = false)//不序列化
     private Date beginTime;

     @JSONField(serialize = false)//不序列化
     private Date endTime;

     @Data
     public static class DictDataItem{
          /**
           *  字典编码(静态数据，设置了就不允许再更改)
           */
          @NotBlank(message = "字典编码不能为空",groups = Constants.Create.class)
          private String dictCode;

          @NotBlank(message = "字典文本不能为空",groups = Constants.Create.class)
          private String dictLabel;
     }
}
