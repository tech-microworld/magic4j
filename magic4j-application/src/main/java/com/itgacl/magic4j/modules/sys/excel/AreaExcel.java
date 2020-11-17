package com.itgacl.magic4j.modules.sys.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 区域导出Excel模板
 */
@Data
@ColumnWidth(25)
@HeadRowHeight(20)
@ContentRowHeight(18)
public class AreaExcel implements Serializable {

     @ColumnWidth(15)
     @ExcelProperty("名称")
     private String name;

     @ColumnWidth(15)
     @ExcelProperty("简称")
     private String shortName;

     @ColumnWidth(15)
     @ExcelProperty("邮编")
     private Integer zipCode;

     @ColumnWidth(15)
     @ExcelProperty("城市编码")
     private String cityCode;

     @ColumnWidth(15)
     @ExcelProperty("区域编码")
     private String areaCode;

     @ColumnWidth(15)
     @ExcelProperty("拼音")
     private String pinyin;

     @ColumnWidth(15)
     @ExcelProperty("经度")
     private BigDecimal lng;

     @ColumnWidth(15)
     @ExcelProperty("纬度")
     private BigDecimal lat;


}
