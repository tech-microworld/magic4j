package com.itgacl.magic4j.libcommon.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.itgacl.magic4j.libcommon.component.storage.StorageFactory;
import com.itgacl.magic4j.libcommon.component.storage.bean.UploadResult;
import com.itgacl.magic4j.libcommon.component.storage.service.StorageService;
import lombok.extern.slf4j.Slf4j;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.HashMap;

/**
 * 二维码生成工具
 *
 */
@Slf4j
public class QrCodeUtil {


    /**
     * 生成二维码
     * */
    public static String createQrCode(String text){
        return qrCode(text, 300, 300);
    }

    /**
     * 生成二维码，自定义高宽
     * */
    public static String createQrCode(String text, Integer width, Integer height){
        return qrCode(text, width, height);
    }

    private static String qrCode(String text, Integer qrCodeWidth, Integer qrCodeHeight){
        String qrcodeFilePath = "";
        try {
            HashMap<EncodeHintType, String> hints = new HashMap<>();
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
            BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, qrCodeWidth, qrCodeHeight, hints);
            BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix);
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, "png", os);
            StorageService storageService = StorageFactory.build();
            String fileName = GUIDUtil.genRandomGUID()+"-qrcode.png";
            //上传到文件服务器
            UploadResult uploadResult = storageService.uploadFile(os.toByteArray(), fileName);
            if(uploadResult.isUploadSuccess()){
                qrcodeFilePath = uploadResult.getFileUrl();
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return qrcodeFilePath;
    }

}
