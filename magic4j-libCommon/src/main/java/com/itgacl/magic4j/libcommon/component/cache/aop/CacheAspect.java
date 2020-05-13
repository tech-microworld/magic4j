package com.itgacl.magic4j.libcommon.component.cache.aop;

import cn.hutool.core.util.ArrayUtil;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import com.itgacl.magic4j.libcommon.component.cache.annotation.Cache;
import com.itgacl.magic4j.libcommon.component.cache.annotation.CacheClear;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.support.SimpleValueWrapper;
import org.springframework.core.DefaultParameterNameDiscoverer;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.Expression;
import org.springframework.expression.spel.standard.SpelExpression;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * 使用AOP实现基于注解的缓存
 */
@Component
@Aspect
@Slf4j
public class CacheAspect {

    @Autowired
    protected CacheService cacheService; //缓存服务

    /**
     * 针对使用了Cache注解的方法进行切入
     */
    @Pointcut("@annotation(com.itgacl.magic4j.libcommon.component.cache.annotation.Cache)")
    public void cacheAround(){

    }

    /**
     * 针对使用了CacheClear注解的方法进行切入
     */
    @Pointcut("@annotation(com.itgacl.magic4j.libcommon.component.cache.annotation.CacheClear)")
    public void cacheClear(){

    }

    @Around("cacheAround()")
    public Object aroundCache(ProceedingJoinPoint joinPoint) throws Throwable {
        Method currentMethod = getCurrentMethod(joinPoint);
        //获取方法上的注解
        Cache cache = currentMethod.getAnnotation(Cache.class);
        String key; //缓存key
        if (StringUtils.isEmpty(cache.key())) {
            //根据方法签名生成key
            key = generateKey(joinPoint);
        } else {
            //使用注解中的key, 支持SpEL表达式
            String spEL = cache.key();
            key = generateKeyBySpEL(spEL, joinPoint);
        }
        //尝试从缓存中获取
        Object result = cacheService.get(key);
        if (null != result) {
            //缓存中存在即直接返回该值
            log.debug("cache hit,get data from cache by key:{}",key);
            return result;
        }
        //将通过执行方法获取到的值放入缓存并返回结果
        result = joinPoint.proceed();
        if(result != null){
            //缓存中不存在则执行该方法
            cacheService.set(key, result);
            log.debug("cache miss! put into cache...,key:{}",key);
        }
        return result;
    }

    @Around("cacheClear()")
    public Object aroundCacheClear(ProceedingJoinPoint joinPoint) throws Throwable {
        Method currentMethod = getCurrentMethod(joinPoint);
        //获取方法上的注解
        CacheClear cacheClear = currentMethod.getAnnotation(CacheClear.class);
        //首先执行方法
        Object result = joinPoint.proceed();
        //删除对应缓存
        String key; //缓存key
        if (StringUtils.isEmpty(cacheClear.key())) {
            //默认根据方法签名生成key
            key = generateKey(joinPoint);
        } else {
            //使用注解中的key, 支持SpEL表达式
            String spEL = cacheClear.key();
            key = generateKeyBySpEL(spEL, joinPoint);
        }
        log.debug("clear cache  remove key:{}",key);
        cacheService.remove(key);//清除缓存
        //返回结果
        return result;
    }

    /**
     * 默认缓存key生成器.
     * 注解中key不传参，根据方法签名和参数生成key.
     *
     * @param joinPoint
     * @return
     */
    private String generateKey(ProceedingJoinPoint joinPoint) {
        Class itsClass = joinPoint.getTarget().getClass();
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        StringBuilder keyBuilder = new StringBuilder();
        keyBuilder.append(itsClass.getName());
        keyBuilder.append(".").append(methodSignature.getName());
        keyBuilder.append("(");
        for(Object arg : joinPoint.getArgs()) {
            if(arg != null){
                keyBuilder.append(arg.getClass().getSimpleName()).append(arg).append(";");
            }
        }
        keyBuilder.append(")");
        return keyBuilder.toString();
    }

    /**
     * SpEL表达式缓存Key生成器.
     * 注解中传入key参数，则使用此生成器生成缓存.
     *
     * @param spELString
     * @param joinPoint
     * @return
     */
    private String generateKeyBySpEL(String spELString, ProceedingJoinPoint joinPoint) {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        SpelExpressionParser parser = new SpelExpressionParser();//用于SpEL表达式解析
        DefaultParameterNameDiscoverer nameDiscoverer = new DefaultParameterNameDiscoverer();//用于获取方法参数定义名字.
        String[] paramNames = nameDiscoverer.getParameterNames(methodSignature.getMethod());
        Expression expression = parser.parseExpression(spELString);
        EvaluationContext context = new StandardEvaluationContext();
        Object[] args = joinPoint.getArgs();
        if(ArrayUtil.isNotEmpty(paramNames)){
            for(int i = 0 ; i < args.length ; i++) {
                context.setVariable(paramNames[i], args[i]);
            }
            try {
                return expression.getValue(context).toString();
            }catch (Exception e){
                return spELString;
            }
        }else {
            return spELString;
        }

    }

    /**
     * 获取当前方法
     * @param pjp
     * @return
     * @throws NoSuchMethodException
     */
    private Method getCurrentMethod(ProceedingJoinPoint pjp) throws NoSuchMethodException {
        Signature signature = pjp.getSignature();
        if (!(signature instanceof MethodSignature)) {
            throw new IllegalArgumentException("该注解只能用于方法");
        }
        MethodSignature methodSignature = (MethodSignature) signature;
        Object target = pjp.getTarget();
        return target.getClass().getMethod(methodSignature.getName(), methodSignature.getParameterTypes());
    }
}
