package com.itgacl.magic4j.common.context;

import com.itgacl.magic4j.common.bean.LoginUser;
import com.itgacl.magic4j.modules.sys.dto.TokenDTO;
import lombok.extern.slf4j.Slf4j;

/**
 * 登录用户上下文
 */
@Slf4j
public class LoginUserContext {

    /**
     * ThreadLocal 适用于每个线程需要自己独立的实例且该实例需要在多个方法中被使用（相同线程数据共享），也就是变量在线程间隔离（不同的线程数据隔离）而在方法或类间共享的场景。
     * 利用ThreadLocal管理登录用户信息实现随用随取
     * 每个请求都会对应一个线程，这个ThreadLocal就是这个线程使用过程中的一个变量，该变量为其所属线程所有，各个线程互不影响
     * 在一个请求中，所有调用的方法都在同一个线程中去处理，这样就实现了在任何地方都可以获取到用户信息了
     *
     */
    //private static final ThreadLocal<LoginUser> loginUserLocal = new ThreadLocal<>();
    private static final ThreadLocal<LoginUser> loginUserLocal = new InheritableThreadLocal<>();

    //private static final ThreadLocal<TokenDTO> loginTokenLocal = new ThreadLocal<>();
    private static final ThreadLocal<TokenDTO> loginTokenLocal = new InheritableThreadLocal<>();//父线程生成的变量需要传递到子线程中进行使用，ThreadLocal有一个子类InheritableThreadLocal就是为了解决这个问题而产生的，使用InheritableThreadLocal就可以轻松的在子线程中依旧使用父线程中的本地变量

    public static void set(LoginUser userInfo,TokenDTO tokenDTO) {
        loginUserLocal.set(userInfo);
        loginTokenLocal.set(tokenDTO);
    }

    public static void set(LoginUser userInfo) {
        loginUserLocal.set(userInfo);
    }

    public static void set(TokenDTO tokenDTO) {
        loginTokenLocal.set(tokenDTO);
    }

    public static LoginUser get() {
        return loginUserLocal.get();
    }

    public static TokenDTO getToken(){
        return loginTokenLocal.get();
    }

    public static void remove() {
        loginUserLocal.remove();
        loginTokenLocal.remove();
    }
}
