package com.itgacl.magic4j.modules.sys.dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.itgacl.magic4j.common.base.BaseDTO;
import com.itgacl.magic4j.libcommon.constant.Constants;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * 数据传输对象（DTO)(Data Transfer Object)
 */
@ApiModel("数据字典DTO")
@Data
public class SysDictDTO extends BaseDTO implements Serializable{

     @ApiModelProperty(hidden = true)
     private Integer parentId;//保留字段

     @ApiModelProperty(value = "字典名称")
     @NotBlank(message = "字典名称不能为空",groups = Constants.Create.class)
     private String dictName;

     /**
      *  字典类型(静态数据，设置了就不允许再更改)
      */
     @ApiModelProperty(value = "字典类型")
     @NotBlank(message = "字典类型不能为空",groups = Constants.Create.class)
     private String dictType;//固定的，不变的

     /**
      *  字典编码(静态数据，设置了就不允许再更改)
      */
     @ApiModelProperty(value = "字典编码")
     private String dictCode;

     @ApiModelProperty(value = "字典文本")
     private String dictLabel;

     @ApiModelProperty(hidden = true)
     private Long[] dictIds;

     @ApiModelProperty(hidden = true)
     private String[] exportColumnNames;

     private List<DictDataItem> dictDataItems;//字典数据项

     /**
      *  顺序
      */
     @ApiModelProperty(value = "字典排序")
     private Integer sortNo;

     /**
      * 字典描述
      */
     @ApiModelProperty(value = "字典描述")
     private String dictDesc;

     @ApiModelProperty(hidden = true)
     private LocalDateTime createTime;

     @ApiModelProperty(hidden = true)
     @JSONField(serialize = false)//不序列化
     private Date beginTime;

     @ApiModelProperty(hidden = true)
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
