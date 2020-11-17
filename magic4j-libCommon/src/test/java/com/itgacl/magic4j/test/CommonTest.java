package com.itgacl.magic4j.test;

import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

@Slf4j
public class CommonTest {

    @Test
    public void test() throws PinyinException {
        String convert = PinyinHelper.convertToPinyinString("中国" , "", PinyinFormat.WITHOUT_TONE);
        log.debug(convert);
    }
}
