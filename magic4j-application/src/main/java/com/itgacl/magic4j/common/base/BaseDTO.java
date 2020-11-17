package com.itgacl.magic4j.common.base;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.itgacl.magic4j.libcommon.constant.Constants;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
public class BaseDTO implements Serializable {

    @ApiModelProperty("ID")
    @ExcelIgnore //数据导入的时候忽略ID
    //更新的时候id不能为空
    @NotNull(message = "Id不能为空!",groups = Constants.Update.class)
    private Long id;
}
