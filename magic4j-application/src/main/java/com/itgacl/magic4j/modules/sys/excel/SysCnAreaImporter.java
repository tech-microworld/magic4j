package com.itgacl.magic4j.modules.sys.excel;
import com.itgacl.magic4j.libcommon.excel.ExcelImporter;
import com.itgacl.magic4j.modules.sys.service.SysCnAreaService;
import lombok.RequiredArgsConstructor;

import com.itgacl.magic4j.modules.sys.dto.SysCnAreaDTO;
import java.util.List;

/**
 * SysCnArea数据导入器
 */
@RequiredArgsConstructor
public class SysCnAreaImporter implements ExcelImporter<SysCnAreaDTO> {

    private final SysCnAreaService sysCnAreaService;
    private final Boolean isCovered;
    private final Long parentId;

    @Override
    public void save(List<SysCnAreaDTO> data) {
        if(parentId!=null){
            data.forEach(item->{
                item.setParentId(parentId);
            });
        }
        sysCnAreaService.importData(data, isCovered);
    }
}