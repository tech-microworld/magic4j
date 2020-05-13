package com.itgacl.magic4j.libcommon.component.cache;


import java.util.List;
import java.util.Map;

/**
 * 定义缓存操作接口
 */
public interface CacheService {

    /**
     * 设置缓存
     * @param key 缓存的key
     * @param value 缓存value
     * @return
     */
    void set(Object key, Object value);

    /**
     * 获取缓存中的内容
     * @param key
     * @param <T>
     * @return
     */
    <T> T get(Object key, Class<T> cls);

    /**
     * 获取缓存中的内容
     * @param key
     * @param <T>
     * @return
     */
    <T> T get(Object key);

    /**
     * 获取缓存中的内容
     * @param key
     * @param isRemove 获取完成之后是否清除缓存内容，true:清除，false不清除
     * @param <T>
     * @return
     */
    <T> T get(Object key, boolean isRemove);

    /**
     * 优先从缓存里面取数据，如果没有，则通过DataLoader从数据库加载
     * @param key
     * @param dataLoader
     * @param <T>
     * @return
     */
    <T> T get(Object key, DataLoader<T> dataLoader);

    /**
     * 根据缓存的key删除缓存
     * @param key
     * @return
     */
    void remove(Object key);

    /**
     * 删除所有缓存
     * @return
     */
    void removeAll();

    /**
     * 获取所有的缓存的Key
     * @return
     */
    List<Object> getCacheKeys();

    /**
     * 根据Key前缀获取缓存的Key
     * @return
     */
    List<Object> getCacheKeys(String keyPrefix);

    /**
     * 获取所有的缓存
     * @return
     */
    Map<Object, Object> getCacheMap();
}
