package com.itgacl.magic4j.libcommon.component.cache.controller;

import com.itgacl.magic4j.libcommon.annotation.NotEmpty;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 缓存管理
 */
@RestController
@RequestMapping("/api/cache")
public class CacheApiController {

    @Autowired
    private CacheService cacheService;

    @GetMapping
    public R cacheMap(){
        Map<Object, Object> cacheMap = cacheService.getCacheMap();
        return R.ok(cacheMap);
    }

    @GetMapping("/keys")
    public R keys(){
        return R.ok(cacheService.getCacheKeys());
    }

    @GetMapping("/keys/{keyPrefix}")
    public R keys(@PathVariable("keyPrefix") String keyPrefix){
        return R.ok(cacheService.getCacheKeys(keyPrefix));
    }

    @NotEmpty(value = "key",message = "要删除的缓存的key不能为空")
    @DeleteMapping("/remove/{key}")
    public R remove(@PathVariable("key") Object key){
        cacheService.remove(key);
        return R.ok();
    }

    /**
     * 清除所有缓存
     * @return
     */
    @DeleteMapping
    public R removeAll(){
        cacheService.removeAll();
        return R.ok();
    }
}
