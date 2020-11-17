package com.itgacl.magic4j.modules.sys.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;
import com.itgacl.magic4j.libcommon.excel.LocalDateTimeConverter;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 岗位导出Excel模板
 */
@Data
@ColumnWidth(20)
@HeadRowHeight(20)
@ContentRowHeight(18)
public class PostExcel implements Serializable {

     @ExcelProperty("岗位ID")
     private Long id;

     @ExcelProperty("岗位编码")
     private String postCode;

     @ExcelProperty("岗位名称")
     private String postName;

     @ExcelProperty("显示顺序")
     private Integer orderNum;

     @ExcelProperty("岗位类型")
     private String postCategory;

     @ExcelProperty(value = "创建时间",converter = LocalDateTimeConverter.class)
     private LocalDateTime createTime;
}
