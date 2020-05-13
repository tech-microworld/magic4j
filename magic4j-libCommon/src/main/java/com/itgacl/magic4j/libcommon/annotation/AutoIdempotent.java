package com.itgacl.magic4j.libcommon.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 在编程中，一个对外暴露的接口往往会面临很多次请求，如何保证其不影响后台的业务处理，如何保证其只影响数据一次是非常重要的，这就要求我们做到接口幂等。我们来解释一下幂等的概念：任意多次执行所产生的影响均与一次执行的影响相同。按照这个含义，最终的含义就是 对数据库的影响只能是一次性的，不能重复处理。举几个例子：
 1.比如前端对同一表单数据的重复提交，后台应该只会产生一个结果。
 2.比如我们发起一笔付款请求，应该只扣用户账户一次钱，当遇到网络重发或系统bug重发，也应该只扣一次钱。
 3.比如发送消息，也应该只发一次，同样的短信如果多次发给用户，用户会崩溃。
 4.比如创建业务订单，一次业务请求只能创建一个，不能出现创建多个订单。
 还有很多诸如此类的，这些逻辑都需要幂等的特性来支持。
 常见解决方案
 如何保证其幂等性，通常有以下手段：
 1.数据库建立唯一性索引，可以保证最终插入数据库的只有一条数据
 2.token机制，每次接口请求前先获取一个token，然后再下次请求的时候在请求的header体中加上这个token，后台进行验证，如果验证通过删除token，下次请求再次判断token
 3.悲观锁或者乐观锁
    悲观锁可以保证每次for update的时候其他sql无法update数据；
        select * from table_xxx where id=’xxx’ for update;  注意：id字段一定是主键或者唯一索引，不然会锁表
    (在数据库引擎是innodb的时候,select的条件必须是唯一索引,防止锁全表。悲观锁使用时一般伴随事务一起使用，数据锁定时间可能会很长，根据实际情况选用。)
    乐观锁只是在更新数据那一刻锁表，其他时间不锁表，所以相对于悲观锁，效率更高。乐观锁的实现方式多种多样可以通过version或者其他状态条件：
         1.通过版本号实现 update table_xxx set name=#name#,version=version+1 where version=#version#
         2.通过条件限制 update table_xxx set avai_amount=avai_amount-#subAmount# where avai_amount-#subAmount# >= 0
     要求：avai_amount-subAmount >=0
     这个情景适合不用版本号，只更新是做数据安全校验，适合库存模型，扣份额和回滚份额，性能更高。
     注意：乐观锁的更新操作，最好用主键或者唯一索引来更新，这样是行锁，否则更新时会锁表，上面两个sql改成下面的两个更好。
     1、update table_xxx set name=#name#,version=version+1 where id=#id# and version=#version#
     2、update table_xxx set avai_amount=avai_amount-#subAmount# where id=#id# and avai_amount-#subAmount# >= 0
    4.先查询后判断，首先通过查询数据库是否存在数据，如果存在证明已经请求过了，直接拒绝该请求，如果没有存在，就证明是第一次进来，直接放行。
 */

/**
 * 方法幂等性校验注解
 * 此注解的主要目的是把它添加在需要实现幂等的方法上，凡是某个方法注解了它，都会实现自动幂等。
 * 后台利用反射如果扫描到这个注解，就会处理这个方法实现自动幂等，
 * 使用元注解ElementType.METHOD表示它只能放在方法上，etentionPolicy.RUNTIME表示它在运行时
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface AutoIdempotent {

}
