package com.itgacl.magic4j.libcommon.component.cache;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.itgacl.magic4j.libcommon.constant.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class CacheServiceImpl implements CacheService {

    @Autowired
    private CacheManager cacheManager;

    /**
     * 设置缓存
     *
     * @param key   缓存的key
     * @param value 缓存value
     * @return
     */
    @Override
    public void set(Object key, Object value) {
        Cache cache = cacheManager.getCache(CacheConstants.DEFAULT_CACHE);
        if (cache == null) {
            throw new RuntimeException("获取缓存节点为空");
        }
        cache.put(key, value);
        saveCacheKey(cache, key);
    }

    /**
     * 存储所有缓存的key
     * @param cache
     * @param key
     */
    private void saveCacheKey(Cache cache,Object key){
        Set setCacheKey = cache.get(Constants.CACHE_KEY.STORE_KEY,Set.class);
        if(setCacheKey == null){
            setCacheKey = new HashSet();
        }
        setCacheKey.add(key);
        cache.put(Constants.CACHE_KEY.STORE_KEY,setCacheKey);
    }

    /**
     * 移除缓存的Key
     * @param cache
     * @param key
     */
    private void removeCacheKey(Cache cache,Object key){
        Set setCacheKey = cache.get(Constants.CACHE_KEY.STORE_KEY,Set.class);
        if(CollectionUtil.isNotEmpty(setCacheKey)){
            if(ObjectUtil.isNotEmpty(key)){
                setCacheKey.remove(key);
            }else {
                //删除全部的key
                setCacheKey.clear();
            }
        }
    }

    /**
     * 获取缓存中的内容
     *
     * @param key
     * @return
     */
    @Override
    public <T> T get(Object key,Class<T> cls) {
        Cache cache = cacheManager.getCache(CacheConstants.DEFAULT_CACHE);
        if(cache == null){
            throw new RuntimeException("获取缓存节点为空");
        }
        return cache.get(key,cls);
    }

    /**
     * 获取缓存中的内容
     *
     * @param key
     * @return
     */
    @Override
    public <T> T get(Object key) {
        Cache cache = cacheManager.getCache(CacheConstants.DEFAULT_CACHE);
        if(cache == null){
            throw new RuntimeException("获取缓存节点为空");
        }
        Cache.ValueWrapper valueWrapper = cache.get(key);
        if(valueWrapper != null && valueWrapper.get()!=null){
            return (T) valueWrapper.get();
        }
        return null;
    }

    /**
     * 获取缓存中的内容
     *
     * @param key
     * @param isRemove 获取完成之后是否清除缓存内容，true:清除，false不清除
     * @return
     */
    @Override
    public <T> T get(Object key, boolean isRemove) {
        T t = get(key);
        if(isRemove){
            remove(key);
        }
        return t;
    }

    /**
     * 获取缓存中的内容，如果获取不到，则通过DataLoader去DB加载
     *
     * @param key
     * @return
     */
    @Override
    public <T> T get(Object key, DataLoader<T> dataLoader) {
        T data = get(key);
        if (data == null) {
            data = dataLoader.load();
            if(data != null){
                set(key,data);
            }
        }
        return data;
    }

    /**
     * 根据缓存的key删除缓存
     *
     * @param key
     * @return
     */
    @Override
    public void remove(Object key) {
        Cache cache = cacheManager.getCache(CacheConstants.DEFAULT_CACHE);
        if(cache == null){
            throw new RuntimeException("获取缓存节点为空");
        }
        cache.evict(key);
        removeCacheKey(cache,key);
    }

    /**
     * 删除所有缓存
     *
     * @return
     */
    @Override
    public void removeAll() {
        Cache cache = cacheManager.getCache(CacheConstants.DEFAULT_CACHE);
        if(cache == null){
            throw new RuntimeException("获取缓存节点为空");
        }
        cache.clear();
        removeCacheKey(cache,null);
    }

    /**
     * 获取所有的缓存的Key
     *
     * @return
     */
    @Override
    public List<Object> getCacheKeys() {
        Map<Object, Object> cacheMap = getCacheMap();
        return new ArrayList<>(cacheMap.keySet());
    }

    /**
     * 根据Key前缀获取缓存的Key
     *
     * @param keyPrefix
     * @return
     */
    @Override
    public List<Object> getCacheKeys(String keyPrefix) {
        Cache cache = cacheManager.getCache(CacheConstants.DEFAULT_CACHE);
        if(cache == null){
            throw new RuntimeException("获取缓存节点为空");
        }
        List<Object> cacheKeyList = new ArrayList<>();
        Set setCacheKey = cache.get(Constants.CACHE_KEY.STORE_KEY,Set.class);
        setCacheKey.forEach(item->{
            //keyPrefix=loginUser:token:*
            if(item instanceof String){
                // 编译正则表达式
                Pattern pattern = Pattern.compile(keyPrefix);
                //判断是否匹配
                Matcher matcher = pattern.matcher((String) item);
                if (matcher.find()) {//如果匹配
                    cacheKeyList.add(item);
                }
            }
        });
        return cacheKeyList;
    }

    /**
     * 获取所有的缓存
     *
     * @return
     */
    @Override
    public Map<Object, Object> getCacheMap() {
        Cache cache = cacheManager.getCache(CacheConstants.DEFAULT_CACHE);
        if(cache == null){
            throw new RuntimeException("获取缓存节点为空");
        }
        Map<Object, Object> cacheMap = new HashMap<>();
        Set setCacheKey = cache.get(Constants.CACHE_KEY.STORE_KEY,Set.class);
        if(CollectionUtil.isNotEmpty(setCacheKey)){
            setCacheKey.forEach(item->{
                Object o = get(item);
                cacheMap.put(item,o);
            });
        }
        return cacheMap;
    }

}
