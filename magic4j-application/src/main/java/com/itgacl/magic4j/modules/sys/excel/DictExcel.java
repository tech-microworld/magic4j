package com.itgacl.magic4j.modules.sys.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;
import lombok.Data;

import java.io.Serializable;

@Data
@ColumnWidth(25)
@HeadRowHeight(20)
@ContentRowHeight(18)
public class DictExcel implements Serializable {

    @ColumnWidth(15)
    @ExcelProperty("字典名称")
    private String dictName;

    @ColumnWidth(15)
    @ExcelProperty("字典类型")
    private String dictType;

    @ColumnWidth(15)
    @ExcelProperty("字典编码")
    private String dictCode;

    @ColumnWidth(15)
    @ExcelProperty("字典文本")
    private String dictLabel;
}
