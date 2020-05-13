package com.itgacl.magic4j.common.aop;

import com.alibaba.fastjson.JSON;
import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.common.context.LoginUserContext;
import com.itgacl.magic4j.libcommon.ThreadManager;
import com.itgacl.magic4j.libcommon.annotation.Log;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.cache.CacheService;
import com.itgacl.magic4j.libcommon.constant.Constants;
import com.itgacl.magic4j.libcommon.util.IpUtil;
import com.itgacl.magic4j.libcommon.util.SpringContextUtils;
import com.itgacl.magic4j.modules.sys.entity.SysLog;
import com.itgacl.magic4j.modules.sys.service.SysLogService;
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
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 使用AOP实现日志记录
 实现AOP的切面主要有以下几个要素：
 使用@Aspect注解将一个java类定义为切面类
 使用@Pointcut定义一个切入点，可以是一个规则表达式，比如下例中某个package下的所有函数，也可以是一个注解等。
 根据需要在切入点不同位置的切入内容
 使用@Before在切入点开始处切入内容
 使用@After在切入点结尾处切入内容
 使用@AfterReturning在切入点return内容之后切入内容（可以用来对处理返回值做一些加工处理）
 使用@Around在切入点前后切入内容，并自己控制何时执行切入点自身的内容
 使用@AfterThrowing用来处理当切入内容部分抛出异常之后的处理逻辑
 使用@Order(i)注解来标识切面的优先级。i的值越小，优先级越高
 参考http://blog.csdn.net/YLIMH_HMILY/article/details/78303464
 */
@Aspect
@Order(Integer.MAX_VALUE)
@Component
public class LogAspect {

    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);

    @Autowired
    private SysLogService logService;

    @Autowired
    protected CacheService cacheService; //缓存

    /**
     * 针对使用了LogRecord注解的方法进行切入
     */
    @Pointcut("@annotation(com.itgacl.magic4j.libcommon.annotation.Log)")
    public void recordLog(){

    }

    @Around("recordLog()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long beginTime = System.currentTimeMillis();
        //在执行业务方法之前获取当前登录用户，如果执行的是登录操作，那么在执行登录方法之前是获取不到登录用户信息的
        LoginUser loginUser = getCurrLoginUser();
        //执行业务方法，返回执行结果result
        Object retVal = point.proceed();
        //执行时长(毫秒)
        long time = System.currentTimeMillis() - beginTime;
        if(loginUser==null){
            //如果在执行业务方法之前获取当前登录用户为空，则在执行业务方法之后再尝试获取一次
            loginUser = getCurrLoginUser();
        }
        //捕获异常，保证即使操作日志保存出错也不影响业务方法执行结果的正常返回
        try{
            LoginUser finalLoginUser = loginUser;
            ThreadManager.getInstance().createShortPool().execute(() -> {
                //组装需要保存的数据
                SysLog sysLog = new SysLog();
                //设置操作人信息
                if(finalLoginUser !=null){
                    sysLog.setTenantId(finalLoginUser.getTenantId());//手动设置租户ID
                    sysLog.setUserId(finalLoginUser.getId());
                    if(StringUtils.isNotEmpty(finalLoginUser.getRealName())){
                        sysLog.setUsername(finalLoginUser.getUsername()+"["+finalLoginUser.getRealName()+"]");
                    }else {
                        sysLog.setUsername(finalLoginUser.getUsername());
                    }
                    sysLog.setClientIp(finalLoginUser.getIpAddress());//发起请求的客户端IP地址
                    sysLog.setClientBrowser(finalLoginUser.getBrowser());//发起请求的客户端浏览器
                    sysLog.setClientOperationSystem(finalLoginUser.getOs());//发起请求的客户端操作系统
                    sysLog.setClientOperationLocation(finalLoginUser.getLoginLocation());//发起请求的客户端的位置
                }
                sysLog.setHandleServerIp(IpUtil.getLocalIP());//处理用户请求的服务器IP地址
                sysLog.setExecuteTime(time);//执行时长(毫秒)
                int result = getOperationResult(retVal);
                sysLog.setStatus(result);//执行结果
                sysLog.setJsonResult(JSON.toJSONString(retVal));
                //保存日志
                saveSysLog(point,sysLog);//TODO 待优化，以后改成在消息队列中处理
            });
        }catch (Exception e){
            logger.error("组装操作日志数据并保存出错：",e.getMessage());
        }
        return retVal;
    }


    /**
     * 保存日志信息
     * @param pjp
     * @return
     */
    private void saveSysLog(ProceedingJoinPoint pjp, SysLog sysLog) {
        try {
            //请求的类名
            String className = pjp.getTarget().getClass().getName();
            sysLog.setClassName(className);//类名
            //获取当前请求的方法
            Method currentMethod = getCurrentMethod(pjp);
            sysLog.setMethod(currentMethod.getName());//方法名
            //获取方法上的注解
            Log logRecord = currentMethod.getAnnotation(Log.class);
            sysLog.setModuleName(logRecord.moduleName());//操作的模块名
            sysLog.setOperation(logRecord.operation());// 操作说明：自定义,如用户登录、添加用户等
            sysLog.setRemark(logRecord.remark());//备注信息
            sysLog.setLogType(logRecord.logType());//日志类型（0：操作日志，1：登录日志）
            if(logRecord.isSaveReqData()){//保存请求参数
                //获取相关方法参数
                Object[] args = pjp.getArgs();
                String[] argNames = getArgNames(currentMethod);
                if (args != null && argNames != null && args.length>0){
                    Map<String,Object> argMap = new HashMap<>(args.length);
                    for (int i = 0; i < args.length; i++) {
                        Object arg = args[i];
                        if (isIgnoreArg(arg)) {
                            continue;
                        }
                        String name = argNames[i];
                        argMap.put(name, arg);
                    }
                    try{
                        sysLog.setReqParam(JSON.toJSONString(argMap));//请求参数
                    }catch (Exception e){
                        logger.error(e.getMessage(),e);
                    }
                }
            }
            if(!logRecord.isSaveResData()){
                sysLog.setJsonResult(null);//不保存响应数据
            }
            sysLog.setCreateTime(LocalDateTime.now());
            logService.save(sysLog);//保存日志信息
        } catch (Exception e) {
            logger.error("保存系统日志出错",e);
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

    /**
     * 获取方法的参数名
     * @param method
     * @return
     */
    private String[] getArgNames(Method method ) {
        //通过Spring的LocalVariableTableParameterNameDiscoverer类获取方法的参数名称
        LocalVariableTableParameterNameDiscoverer parameterNameDiscoverer = new LocalVariableTableParameterNameDiscoverer();
        //获取方法的参数名称
        String[] methodParamNames = parameterNameDiscoverer.getParameterNames(method);
        return methodParamNames;
    }

    /**
     * 判断是否忽略该参数，如果不需要记录到日志里，则返回true
     * @param arg
     * @return
     */
    private boolean isIgnoreArg(Object arg) {
        //如果方法中定义的参数是ServletRequest或者ServletResponse类型则忽略，因为这些是系统参数
        return arg instanceof ServletRequest || arg instanceof ServletResponse;
    }

    /**
     * 获取当前登录的系统用户
     * @return
     */
    private LoginUser getCurrLoginUser() {
        return LoginUserContext.get();
    }

    /**
     * 获取操作结果
     * @param object
     * @return 0-成功，1-失败
     */
    private int getOperationResult(Object object) {
        //Controller定义的增删改方法的操作结果都统一以R这个类的对象实例返回
        if (object != null && object instanceof R) {
            R result = (R)object;
            if (result.getCode() == 0) {
                return 0;
            }else{
                return 1;
            }
        }
        return 0;//默认返回成功
    }
}
