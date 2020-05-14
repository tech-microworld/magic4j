&ensp;&ensp;&ensp;&ensp;一直都想按照自己的想法去开发一个基于SpringBoot的javaWeb快速开发平台(基础开发框架)，经过一个多月日夜奋战，利用业余时间，从0到1，终于按照自己的想法去实现了一个基于SpringBoot的java快速开发平台，我将其命名为<span style='color:red'>【magic4j】</span>，寓意<span style='color:red'>【神奇的、魔法般的Java开发平台】</span>。
# 一、项目简介
&ensp;&ensp;&ensp;&ensp;magic4j是一个<span style='color:red'>【前后端分离】</span>快速开发平台，支持<span style='color:red'>【多租户】</span>，基于 Spring Boot、mybatisPlus 和 Vue 开发，可以用于所有的Web应用程序，内置了许多通用性的功能模块，如用户管理、角色管理、资源管理等。magic4j旨在帮助中小型企业及个人实现项目的快速开发和交付。
# 二、主要特性
- 采用业界主流的<span style='color:red'>【前后端分离】</span>的开发模式，前端开源框架采用<span style='color:red'>【vue-element-admin】</span> (基于 Vue、Element-UI)
- 后端采用<span style='color:red'>【Springboot+Mybatis-Plus+jwt+redis】</span>等主流的技术栈实现，并对其基础的<span style='color:red'>【缓存组件】、【文件存储组件】</span>做了高度的封装，提供了多种实现，做到开箱即用，多种实现方式灵活切换。
- 基于Mybatis-Plus实现的功能强大的<span style='color:red'>【代码生成器】</span>、根据自定义模板生成Entity、Mapper、Mppper.xml、DTO、Service、Controller代码，生成的文件直接到相应的业务模块，省去文件拷贝步骤，灵活可控。
- 采用全新的思路自主实现了基于<span style='color:red'>【RBAC模型的权限管理】</span>，实现了<span style='color:red'>【菜单权限】、【功能权限】、【数据权限】</span>的细致化访问权限控制。
- 支持<span style='color:red'>【多租户】</span>，租户数据隔离方案为：<span style='color:red'>【共享数据库、Schema、数据表】</span>，通过在表中增加<span style='color:red'>【tenant_id】字段+【多租户SQL解析器】</span>优雅地实现租户数据隔离。同时支持<span style='color:red'>【一键开启或者关闭】</span>多租户模式
- 使用<span style='color:red'>【Mybatis拦截器】</span>优雅的实现了数据权限，根据角色所拥有的数据权限范围在执行SQL查询过程中动态拼接过滤条件，实现数据过滤。同时支持<span style='color:red'>【一键开启或者关闭】</span>数据权限控制
- 支持<span style='color:red'>【jwt和自定义Token】</span>两种用户登录Token认证，系统默认使用的Jwt进行ToKen认证，可以通过修改application.yml配置文件切换Token的认证方式，根据情况自由选择。
- 自带了<span style='color:red'>【缓存组件】</span>，提供基于注解和API两种使用方式，基于<span style='color:red'>【Redis和caffeine】两种实现</span>方式，可以通过修改application.yml配置文件切换缓存的实现，Redis的方式又支持【单机和集群】两种模式。这样可以做到开发阶段使用caffeine、测试阶段使用Redis单机，生产使用Redis集群三种方式自由切换。
- 支持<span style='color:red'>【本地】、【sftp】、【FastDFS】</span>以及第三方<span style='color:red'>【阿里云OSS】、【腾讯云COS】、【七牛云存储】</span>多种文件存储服务，可动态任意切换。
- 注重<span style='color:red'>【数据安全】</span>传输，提供了<span style='color:red'>【RSA和AES】两种加密</span>方式，客户端通过调用RestFul API获取到RSA加密公钥和AES加密密钥，将客户端的敏感数据加密后传输。同时提供了通用的数据解密过滤器，在请求到达业务处理接口之前，将数据解密成明文，免去了接口手动处理解密步骤，专注业务实现逻辑。
- 注重<span style='color:red'>【密码安全】</span>传输，对于登录、修改密码、重置密码这些涉及到密码传输的操作都使用了RSA加密后再传输到服务端，避免了密码直接明文暴露传输。
- 支持<span style='color:red'>【自定义密码验证规则】</span>，可以灵活设置【密码长度】、至少包含的【大小写字母】、【数字】、【特殊字符】等组成规则，增加密码的复杂度
- 使用<span style='color:red'>【ThreadLocal管理登录用户信息】</span>实现随用随取，可以在任何方法中很方便的获取用户信息
- 注重日志信息收集，系统日志细分为<span style='color:red'>【登录日志】和【操作日志】</span>，详细记录的了用户的操作行为和登录行为，通过系统日志可以很清新地知道用户对系统进行的相关操作。
- 整合Quartz做<span style='color:red'>【分布式定时任务】</span>，并记录了任务<span style='color:red'>【执行日志】</span>，任务执行情况一目了然。
- 使用<span style='color:red'>【拦截器实现防止重复提交】</span>，保证一些关键性操作的幂等性。
- 完善的<span style='color:red'>【用户】、【角色】、【菜单】、【组织机构】、【岗位】、【数据字典】、【系统配置】</span>等基础功能。
- 接口访问统一采用标准的restful方式，集成swagger-ui在线接口文档，支持跨域请求调用，服务端采用主流的cros作为跨域解决方案。
- 支持<span style='color:red'>【MySQL】和【Postgresql】</span>两种主流数据库，其他主流的数据库Oracle和SQLServer理论上也都支持。
- 强大的底层封装，提供了自定义注解<span style='color:red'>Auth、AutoIdempotent、Encrypt、Log、DataScope</span>，优雅地实现了访问权限验证、方法幂等性校验，数据统一解密处理、AOP日志记录，数据权限控制。
- 自定义了<span style='color:red'>【cloudStorage-spring-boot-starter】、【fastdfs-spring-boot-starter】、【jsch-spring-boot-starter】</span>，方便以starter快速集成oss、cos、kodo、fastdfs、jsch。
- 基于Maven构建的多模块项目，支持分环境(test、prod)打包，预设了大量的环境变量，便于运维人员部署时动态替换相关配置(如DB连接地址、用户名、密码)
# 三、内置功能
1. 用户管理：管理系统用户，实现对用户增删改查、批量禁用和启用，重置密码
2. 部门管理：管理系统组织机构（公司、部门），树结构展现，支持数据权限。
3. 岗位管理：管理系统用户所属担任职务。
4. 菜单管理：管理系统菜单，树结构展现。
5. 角色管理：角色菜单权限、操作权限分配、设置角色按部门进行数据范围权限划分。
6. 租户管理：管理合作的租户信息
7. 字典管理：对系统中经常使用的一些较为固定的数据进行维护。
8. 安全设置：用于帐号锁定设置和配置密码验证规则。
9. 平台设置：每个租户可以设置自己的系统名称和logo图片。
10. 配置管理：对系统动态配置常用参数进行维护。
11. 操作日志：记录用户对系统进行的增删改行为，支持按操作用户、业务模块、操作结果、操作时间多维度组合的数据查询。
12. 登录日志：记录用户的登录操作，支持按登录用户、登录结果、登录时间多维度组合的数据查询。
13. 定时任务：在线添加、修改、删除、执行、暂停、恢复调度任务。
14. 调度日志：记录调度任务的执行情况。
15. 文件管理：普通文件上传、下载、管理上传文件。
16. 表单构建器：拖动表单元素生成相应的HTML代码。

# 四、技术选型
## 4.1、后端
- 基础框架：Spring Boot 2.2.6.RELEASE
- 持久化框架：Mybatis-Plus_3.3.1.tmp
- 数据库：MySQL/Postgresql
- 安全框架：权限拦截器+自定义注解实现类似Shiro的细粒度权限控制
- JwtToken生成与解析：jjwt_0.9.0
- 数据库连接池：Hikari，一款非常强大,高效,并且号称“史上最快连接池”。在SpringBoot2.0之后,采用的默认数据库连接池就是Hikari
- 缓存框架：redis+caffeine
- 文件存储：oss、cos、kodo、fastdfs、sftp
- 定时任务：quartz
- 日志框架：logback
- 工具包：hutool
- 其他：fastjson，jsch, lombok等。
## 4.2、前端
- Vue2.6.10
- Vuex
- Vue Router
- Axios
- ElementUI2.13.0
- vue-element-admin(UI框架)
- jsencrypt(Rsa加密)
- crypto-js(Aes加密、sha256加密、md5加密、base64编码)

## 4.3、开发环境
- JDK：JDK 1.8
- IDE： IntelliJ IDEA，安装lombok插件、MybatisX快速开发插件。MybatisX 是一款基于 IDEA 的快速开发插件，为效率而生。
安装方法：打开 IDEA，进入 File -> Settings -> Plugins -> Browse Repositories，输入 mybatisx 搜索并安装。
- 依赖管理：Maven3.x
- 数据库：MySQL5.7或者MySQL8
- 缓存：如果使用的是Redis缓存，则需要安装Redis
- 文件服务器：如果将文件上传到FastDFS，则需要搭建FastDFS文件服务器
- Nginx：负载均衡以及静态资源访问服务器，部署magic-ui前端项目需要使用到nginx

# 五、项目结构
## 5.1、magic4j服务端
![](http://blog.itgacl.com/upload/2020/5/magic4j%E9%A1%B9%E7%9B%AE%E7%BB%93%E6%9E%84_20200508151434-90bb75e5250d443a9d354605150f61cd.png)

## 5.2、magic4j前端
![](http://blog.itgacl.com/upload/2020/4/image-8bc29c9e6c624378b2bc578dad0a8ad3.png)

# 六、在线体验
## 6.1、演示地址
http://magic4j.itgacl.com

演示账号1：admin(系统管理员)
密码：123456

演示账号2：mapout(租户管理员1)
密码：123456

演示账号3：comba(租户管理员2)
密码：123456

## 6.2、演示效果
![](http://blog.itgacl.com/upload/2020/5/%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86_20200508223717-1192d580b21747ed8a955edbb0cb0afb.png)

![](http://blog.itgacl.com/upload/2020/5/%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%86_20200508223902-bd80bc04da544746a511601fe6f958d2.png)

![](http://blog.itgacl.com/upload/2020/5/%E6%B7%BB%E5%8A%A0%E8%A7%92%E8%89%B2_20200508224752-24646d652eee4083b6158358355d7b14.png)

![](http://blog.itgacl.com/upload/2020/5/%E5%88%86%E9%85%8D%E6%95%B0%E6%8D%AE%E6%9D%83%E9%99%90_20200508224907-71468a7f9eb04ac5add34846a02642fa.png)

![](http://blog.itgacl.com/upload/2020/5/%E8%8F%9C%E5%8D%95%E7%AE%A1%E7%90%86_20200508225015-9a9d64bf6c6e460bb8b971bd6b79e47d.png)

![](http://blog.itgacl.com/upload/2020/5/%E7%B3%BB%E7%BB%9F%E9%85%8D%E7%BD%AE_20200508225213-5f89f66607c4444d865c848eb71c2814.png)

![](http://blog.itgacl.com/upload/2020/5/%E6%95%B0%E6%8D%AE%E5%AD%97%E5%85%B8_20200508225243-29bddd2cb3bb4a449636a88c0b85433c.png)

![](http://blog.itgacl.com/upload/2020/5/%E5%AE%89%E5%85%A8%E8%AE%BE%E7%BD%AE_20200508225338-a5955e9885d1404bb41a4a7a46cd4fd2.png)

![](http://blog.itgacl.com/upload/2020/5/%E7%A7%9F%E6%88%B7%E7%AE%A1%E7%90%86_20200508225423-01757ce2f5cb4dbfb51cf0cddef8a207.png)

![](http://blog.itgacl.com/upload/2020/5/%E9%83%A8%E9%97%A8%E7%AE%A1%E7%90%86_20200508225525-7d1dc6a2d84e430f9c9a463c78e945e9.png)

![](http://blog.itgacl.com/upload/2020/5/%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86_20200508225557-58ef9ccfd682492e8049d679f644d047.png)

![](http://blog.itgacl.com/upload/2020/5/%E6%96%87%E4%BB%B6%E7%AE%A1%E7%90%86_20200508225749-0e085611a39b4661ae8036be11b5810f.png)

![](http://blog.itgacl.com/upload/2020/5/%E5%AD%98%E5%82%A8%E8%AE%BE%E7%BD%AE_20200508225845-c2a2b53723864122a21e3b93de5a0f19.png)

![](http://blog.itgacl.com/upload/2020/5/%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%97_20200508230420-c957f49c7011431785f0a2771cd67ec3.png)

![](http://blog.itgacl.com/upload/2020/5/%E6%93%8D%E4%BD%9C%E6%97%A5%E5%BF%97_20200508230511-e9647a8739ca4baab70e1ca1851b571a.png)

![](http://blog.itgacl.com/upload/2020/5/%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86_20200508233208-cbcbaddbbdba42abb2a7eb0d37e738fe.png)

![](http://blog.itgacl.com/upload/2020/5/cron%E8%A1%A8%E8%BE%BE%E5%BC%8F_20200508233251-d376b15e8f58436f8b9d3b84647116c3.png)

![](http://blog.itgacl.com/upload/2020/5/%E8%B0%83%E5%BA%A6%E6%97%A5%E5%BF%97_20200508233444-03b3ad2e909f49bb94a110fbbed6d1c8.png)

# 七、二次开发
## 7.1、源码获取
magic4j服务端项目地址：<a href="https://gitee.com/gacl/magic4j" target="_blank" style="color: blue">https://gitee.com/gacl/magic4j</a>

magic4j前端项目地址：<a href="https://gitee.com/gacl/magic4j-ui" target="_blank" style="color: blue">https://gitee.com/gacl/magic4j-ui</a>

magic4j技术文档：<a href="http://file.itgacl.com/magic4j-docs" target="_blank" style="color: blue">http://file.itgacl.com/magic4j-docs</a>

# 八、技术交流
qq交流群：938107164

# 九、项目合作
## 9.1、关于作者
本人有8年的软件开发经验，擅长分布式JavaWeb应用，物联网应用，微信公众号、微信小程序的应用开发，擅长JavaEE开发中常用的SpringBoot、SpringCloud、Netty、JFinal、motan、shiro、MyBatis、MyBatisPlus、Spring-data-jpa框架，有基于motan和SpringCloud实现的微服务化的项目实战经验。有基于SpringBoot+Netty的物联网项目开发实战经验。

技术博客：<a href="http://blog.itgacl.com" target="_blank" style="color: blue">http://blog.itgacl.com</a>
## 9.2、联系作者

手机：13822290843
邮箱：290603672@qq.com

<img src="http://blog.itgacl.com/upload/2020/5/wxQrCode-122aa7a8d56b47e8bab06e0dc1fc3fb1.jpg" width="300px" height="300px"/>
<img src="http://blog.itgacl.com/upload/2020/5/qqQrCode-607009b34b424d359cff4499ca75ca51.jpg" width="300px" height= "300px"/>




