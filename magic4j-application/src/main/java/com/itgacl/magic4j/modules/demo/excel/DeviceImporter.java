package com.itgacl.magic4j.modules.demo.excel;
import com.itgacl.magic4j.libcommon.excel.ExcelImporter;
import com.itgacl.magic4j.modules.demo.service.DeviceService;
import lombok.RequiredArgsConstructor;

import com.itgacl.magic4j.modules.demo.dto.DeviceDTO;
import java.util.List;

/**
 * Device数据导入器
 */
@RequiredArgsConstructor
public class DeviceImporter implements ExcelImporter<DeviceDTO> {

    private final DeviceService deviceService;
    private final Boolean isCovered;

    @Override
    public void save(List<DeviceDTO> data) {
            deviceService.importData(data, isCovered);
    }
}