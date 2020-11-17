package com.itgacl.magic4j.libcommon.component.cache.controller;

import com.itgacl.magic4j.libcommon.annotation.Validator;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 缓存管理
 */
@Api(tags = "缓存管理")
@RestController
@RequestMapping("/api/cache")
public class CacheApiController {

    @Autowired
    private CacheService cacheService;

    @ApiOperation("获取全部缓存数据")
    @GetMapping
    public R<Map<Object, Object>> cacheMap(){
        Map<Object, Object> cacheMap = cacheService.getCacheMap();
        return R.ok(cacheMap);
    }

    @ApiOperation("获取缓存key值")
    @GetMapping("/keys")
    public R<List<Object>> keys(){
        return R.ok(cacheService.getCacheKeys());
    }

    @ApiOperation("根据key的前缀获取缓存key值")
    @ApiImplicitParam(name = "keyPrefix",value = "key前缀",required = true)
    @GetMapping("/keys/{keyPrefix}")
    public R<List<Object>> keys(@PathVariable("keyPrefix") String keyPrefix){
        return R.ok(cacheService.getCacheKeys(keyPrefix));
    }

    @ApiOperation("根据key删除缓存")
    @ApiImplicitParam(name = "key",value = "key值",required = true)
    @Validator(value = "key",message = "要删除的缓存的key不能为空")
    @DeleteMapping("/remove/{key}")
    public R<Void> remove(@PathVariable("key") Object key){
        cacheService.remove(key);
        return R.ok();
    }

    /**
     * 清除所有缓存
     * @return
     */
    @ApiOperation("清除所有缓存")
    @DeleteMapping
    public R<Void> removeAll(){
        cacheService.removeAll();
        return R.ok();
    }
}
