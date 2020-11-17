package com.itgacl.magic4j.modules.demo.excel;
import com.itgacl.magic4j.libcommon.excel.ExcelImporter;
import com.itgacl.magic4j.modules.demo.service.MiniappUserService;
import lombok.RequiredArgsConstructor;

import com.itgacl.magic4j.modules.demo.dto.MiniappUserDTO;
import java.util.List;

/**
 * MiniappUser数据导入器
 */
@RequiredArgsConstructor
public class MiniappUserImporter implements ExcelImporter<MiniappUserDTO> {

    private final MiniappUserService miniappUserService;
    private final Boolean isCovered;

    @Override
    public void save(List<MiniappUserDTO> data) {
            miniappUserService.importData(data, isCovered);
    }
}