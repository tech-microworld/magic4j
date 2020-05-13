# magic4j-application

## 服务说明

## 服务名称:
magic4j-application

## 当前版本
1.0.0

## 关联资源

## 关联组件
无
## 部署说明

### 1.配置参数

| 字段 | 说明 | 默认值 | 备注 |
| --- | --- | --- | --- |
|SERVER_PORT|服务启动端口|8888|服务启动端口，默认配置的使用端口是:8888|

### 2.打包应用(需要先安装maven)

#### 2.1.打测试包
> mvn clean package -Ptest

#### 2.2.打生产包
> mvn clean package -Pprod

### 3.启动应用

#### 3.1.进入magic4j-application-0.0.1-SNAPSHOT.jar所在目录
> eg: cd /data/htdocs

#### 3.2.启动 
> 1.默认启动，使用application.yml的默认配置项启动：
```
nohup java -jar magic4j-application-0.0.1-SNAPSHOT.jar > /dev/null 2>&1 & 
```
使用这种方式启动项目时不输出nohup.out文件

> 2.带命令行参数的启动方式：替换application.yml定义的配置参数(环境变量)，格式：--key=value
```
nohup java -jar magic4j-application-0.0.1-SNAPSHOT.jar --DATASOURCE_URL=47.11.12.23:3806/magic4j --DATASOURCE_USERNAME=magic4j --DATASOURCE_PASSWORD=abcd> /dev/null 2>&1 & 
```
