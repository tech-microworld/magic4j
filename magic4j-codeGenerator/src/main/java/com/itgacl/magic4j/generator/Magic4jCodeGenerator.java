package com.itgacl.magic4j.generator;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.FileType;
import com.baomidou.mybatisplus.generator.config.rules.IColumnType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 基于MyBatisPlus的代码生成器
 */
@Slf4j
public class Magic4jCodeGenerator {

    private String module;//项目模块

    private static String bizModule;//业务模块

    private static boolean excelCodeGenerate = false;//是否生成Excel导入导出代码
    private static boolean appControllerCodeGenerate = false;//是否生成AppController代码

    private static boolean isTreeTable = false;//是否为树形结构表
    private static boolean lazyTree = true;//是否异步加载树形结构数据

    private static String pId = "parentId";//树形结构表父ID字段属性名称

    private static String vueViewTemp = "view.vue.vm";//默认使用的Vue视图模板

    private static String uiProjectPath;//UI项目所在的路径

    /**
     * 获取TemplateConfig
     *
     * @return
     */
    private TemplateConfig getTemplateConfig(){
        TemplateConfig tc = new TemplateConfig();
        tc.setXml(null);//关闭默认xml生成
        /**
         * 自动生成代码到相应的module，避免手动拷贝代码文件
         */
        if ("magic4j-dao".equals(module)) {
            //如果当前模块是magic4j-dao，不生成controller和service
            tc.setController(null);
            tc.setService(null);
            tc.setServiceImpl(null);
        } else if ("magic4j-application".equals(module)) {
            //如果当前模块是magic4j-application，不生成mapper和entity和xml
            tc.setMapper(null);
            tc.setEntity(null);
        }
        return tc;
    }

    /**
     * 获取InjectionConfig
     *
     * @return
     */
    private InjectionConfig getInjectionConfig() {
        //添加自定义模板文件
        List<FileOutConfig> fileOutConfigList = new ArrayList<>();
        if ("magic4j-application".equals(module)) {
            FileOutConfig fileDto = new FileOutConfig("/templates/dto.java.vm") {
                // 自定义输出文件目录
                @Override
                public String outputFile(TableInfo tableInfo) {
                    if(StringUtils.isNoneBlank(bizModule)){
                        return getJavaPath() + "/com/itgacl/magic4j/modules/"+bizModule+"/dto/" + tableInfo.getEntityName() + "DTO.java";
                    }else {
                        return getJavaPath() + "/com/itgacl/magic4j/dto/" + tableInfo.getEntityName() + "DTO.java";
                    }

                }
            };
            FileOutConfig fileVo = new FileOutConfig("/templates/vo.java.vm") {
                // 自定义输出文件目录
                @Override
                public String outputFile(TableInfo tableInfo) {
                    if(StringUtils.isNoneBlank(bizModule)){
                        return getJavaPath() + "/com/itgacl/magic4j/modules/"+bizModule+"/vo/" + tableInfo.getEntityName() + "Vo.java";
                    }else {
                        return getJavaPath() + "/com/itgacl/magic4j/vo/" + tableInfo.getEntityName() + "Vo.java";
                    }

                }
            };

            FileOutConfig fileQuery = new FileOutConfig("/templates/query.java.vm") {
                // 自定义输出文件目录
                @Override
                public String outputFile(TableInfo tableInfo) {
                    if(StringUtils.isNoneBlank(bizModule)){
                        return getJavaPath() + "/com/itgacl/magic4j/modules/"+bizModule+"/query/" + tableInfo.getEntityName() + "Query.java";
                    }else {
                        return getJavaPath() + "/com/itgacl/magic4j/vo/" + tableInfo.getEntityName() + "Query.java";
                    }

                }
            };

            FileOutConfig fileConverter = new FileOutConfig("/templates/converter.java.vm") {
                // 自定义输出文件目录
                @Override
                public String outputFile(TableInfo tableInfo) {
                    if(StringUtils.isNoneBlank(bizModule)){
                        return getJavaPath() + "/com/itgacl/magic4j/modules/"+bizModule+"/converter/" + tableInfo.getEntityName() + "Converter.java";
                    }else {
                        return getJavaPath() + "/com/itgacl/magic4j/converter/" + tableInfo.getEntityName() + "Converter.java";
                    }

                }
            };
            //如果配置了UI项目的路径则生成UI相关代码
            if(StringUtils.isNoneBlank(uiProjectPath)) {
                FileOutConfig fileJs = new FileOutConfig("/templates/api.js.vm") {
                    // 自定义输出文件目录
                    @Override
                    public String outputFile(TableInfo tableInfo) {
                        String entityPath = tableInfo.getEntityPath();
                        if (StringUtils.isNoneBlank(bizModule)) {
                            if (tableInfo.getEntityPath().startsWith(bizModule)) {
                                entityPath = tableInfo.getEntityPath().substring(bizModule.length());
                                entityPath = entityPath.substring(0, 1).toLowerCase() + entityPath.substring(1);
                            }
                            return uiProjectPath + "/src/api/" + bizModule + "/" + entityPath + ".js";
                        } else {
                            return uiProjectPath + "/src/api/" + entityPath + ".js";
                        }

                    }
                };
                if (isTreeTable) {
                    vueViewTemp = "treeView.vue.vm";
                }
                FileOutConfig fileVueView = new FileOutConfig("/templates/" + vueViewTemp) {
                    // 自定义输出文件目录
                    @Override
                    public String outputFile(TableInfo tableInfo) {
                        String entityPath = tableInfo.getEntityPath();
                        if (StringUtils.isNoneBlank(bizModule)) {
                            if (tableInfo.getEntityPath().startsWith(bizModule)) {
                                entityPath = tableInfo.getEntityPath().substring(bizModule.length());
                                entityPath = entityPath.substring(0, 1).toLowerCase() + entityPath.substring(1);
                            }
                            String savePath = uiProjectPath + "/src/views/" + bizModule + "/" + entityPath;
                            File dir = new File(savePath);
                            if (!dir.exists()) {
                                dir.mkdirs();//mkdirs方法在创建当前目录时，会自动创建所有不存在的父目录
                            }
                            return savePath + "/index.vue";
                        } else {
                            String savePath = uiProjectPath + "/src/views/" + entityPath;
                            File dir = new File(savePath);
                            if (!dir.exists()) {
                                dir.mkdirs();//mkdirs方法在创建当前目录时，会自动创建所有不存在的父目录
                            }
                            return savePath + "/index.vue";
                        }
                    }
                };

                fileOutConfigList.add(fileJs);
                fileOutConfigList.add(fileVueView);
            }
            fileOutConfigList.add(fileDto);
            fileOutConfigList.add(fileVo);
            fileOutConfigList.add(fileQuery);
            fileOutConfigList.add(fileConverter);
            if(excelCodeGenerate){
                FileOutConfig fileImporter = new FileOutConfig("/templates/importer.java.vm") {
                    // 自定义输出文件目录
                    @Override
                    public String outputFile(TableInfo tableInfo) {
                        if(StringUtils.isNoneBlank(bizModule)){
                            return getJavaPath() + "/com/itgacl/magic4j/modules/"+bizModule+"/excel/" + tableInfo.getEntityName() + "Importer.java";
                        }else {
                            return getJavaPath() + "/com/itgacl/magic4j/excel/" + tableInfo.getEntityName() + "Importer.java";
                        }

                    }
                };
                fileOutConfigList.add(fileImporter);
            }

            if(isTreeTable){
                FileOutConfig fileTreeVo = new FileOutConfig("/templates/treeVo.java.vm") {
                    // 自定义输出文件目录
                    @Override
                    public String outputFile(TableInfo tableInfo) {
                        if(StringUtils.isNoneBlank(bizModule)){
                            return getJavaPath() + "/com/itgacl/magic4j/modules/"+bizModule+"/vo/" + tableInfo.getEntityName() + "TreeVo.java";
                        }else {
                            return getJavaPath() + "/com/itgacl/magic4j/vo/" + tableInfo.getEntityName() + "TreeVo.java";
                        }

                    }
                };
                fileOutConfigList.add(fileTreeVo);
            }

            if(appControllerCodeGenerate){
                FileOutConfig fileAppController = new FileOutConfig("/templates/apiController.java.vm") {
                    // 自定义输出文件目录
                    @Override
                    public String outputFile(TableInfo tableInfo) {
                        if(StringUtils.isNoneBlank(bizModule)){
                            String savePath = getJavaPath() + "/com/itgacl/magic4j/modules/api/controller";
                            File dir = new File(savePath);
                            if(!dir.exists()) {
                                dir.mkdirs();//mkdirs方法在创建当前目录时，会自动创建所有不存在的父目录
                            }
                            return savePath + "/" + tableInfo.getEntityName() + "ApiController.java";
                        }else {
                            String savePath = getJavaPath() + "/com/itgacl/magic4j/api/controller";
                            File dir = new File(savePath);
                            if (!dir.exists()) {
                                dir.mkdirs();//mkdirs方法在创建当前目录时，会自动创建所有不存在的父目录
                            }
                            return savePath + "/" + tableInfo.getEntityName() + "ApiController.java";
                        }
                    }
                };
                fileOutConfigList.add(fileAppController);
            }

        }else if("magic4j-dao".equals(module)){
            FileOutConfig fileMapperXml = new FileOutConfig("/templates/mapper.xml.vm") {
                // 自定义输出文件目录
                @Override
                public String outputFile(TableInfo tableInfo) {
                    if (StringUtils.isNoneBlank(bizModule)) {
                        return getResourcePath() + "/mapper/" + bizModule + "/" + tableInfo.getEntityName() + "Mapper.xml";
                    } else {
                        return getResourcePath() + "/mapper/" + tableInfo.getEntityName() + "Mapper.xml";
                    }
                }
            };
            fileOutConfigList.add(fileMapperXml);
        }
        //注入自定义配置
        InjectionConfig injectionConfig = new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> map = new HashMap<>();
                map.put("parentGroupId", "com.itgacl");
                map.put("parentArtifactId", "magic4j");
                map.put("excelCodeGenerate", excelCodeGenerate);
                map.put("isTreeTable", isTreeTable);
                if(isTreeTable){
                    map.put("lazyTree", lazyTree);
                    map.put("pId", pId);
                }
                this.setMap(map);
            }
        };
        injectionConfig.setFileOutConfigList(fileOutConfigList);
        /**
         * 由于实际项目中，表字段有增减，编写的service或者controller方法不需要重复生成，可以进行定制开发来设置 ，目前根据实际项目需要
         ,对已存在的文件，只要对 entity 和mapper 进行重复生成
         */
        injectionConfig.setFileCreate(new IFileCreate() {
            @Override
            public boolean isCreate(ConfigBuilder configBuilder, FileType fileType, String filePath) {
                // 判断自定义文件夹是否需要创建,这里调用默认的方法
                checkDir(filePath);
                //对于已存在的文件，只需重复生成entity
                File file = new File(filePath);
                boolean exist = file.exists();
                if(exist){
                    if (FileType.ENTITY == fileType){
                        return true;
                    }else {
                        return false;
                    }
                }
                //不存在的文件都需要创建
                return  true;
            }
        });
        return injectionConfig;
    }

    /**
     * 获取PackageConfig
     *
     * @return
     */
    private PackageConfig getPackageConfig() {
        PackageConfig packageConfig = new PackageConfig();
        packageConfig
                .setParent("com.itgacl.magic4j")
                .setController("controller")
                .setEntity("entity")
                .setMapper("mapper")
                .setService("service")
                .setServiceImpl("service.impl");
        if(StringUtils.isNotEmpty(bizModule)){
            packageConfig
                    .setParent("com.itgacl.magic4j.modules")
                    .setModuleName(bizModule);
        }
        return packageConfig;
    }

    /**
     * 获取StrategyConfig
     *
     * @param tableName
     * @return
     */
    private StrategyConfig getStrategyConfig(String... tableName) {
        return new StrategyConfig()
                .setCapitalMode(false)// 全局大写命名
                //.setTablePrefix("demo_")// 去除前缀
                .setNaming(NamingStrategy.underline_to_camel)// 表名生成策略
                //.setInclude(new String[] { "user" }) // 需要生成的表
                //自定义实体父类
                //.setSuperEntityClass("com.itgacl.model.BaseModel")
                // 自定义实体，公共字段
                //.setSuperEntityColumns("id")
                .setTableFillList(getTableFills())
                .setLogicDeleteFieldName("delete_flag") //逻辑删除标识
                // 自定义 mapper 父类
                //.setSuperMapperClass("com.itgacl.mapper.BaseMapper")
                // 自定义 controller 父类
                .setSuperControllerClass("com.itgacl.magic4j.common.base.SuperController")
                // 自定义 service 实现类父类
                //.setSuperServiceImplClass("com.itgacl.service.impl.BaseServiceImpl")
                // 自定义 service 接口父类
                //.setSuperServiceClass("com.itgacl.service.BaseService")
                // 【实体】是否生成字段常量（默认 false）
                .setEntityColumnConstant(true)
                // 【实体】是否为构建者模型（默认 false）
                .setEntityBuilderModel(false)
                // 【实体】是否为lombok模型（默认 false）<a href="https://projectlombok.org/">document</a>
                .setEntityLombokModel(true)
                // Boolean类型字段是否移除is前缀处理
                .setEntityBooleanColumnRemoveIsPrefix(true)
                .setRestControllerStyle(true)
                .setInclude(tableName);
    }

    /**
     * 获取TableFill策略
     *
     * @return
     */
    private List<TableFill> getTableFills() {
        // 自定义需要填充的字段
        List<TableFill> tableFillList = new ArrayList<>();
        tableFillList.add(new TableFill("create_time", FieldFill.INSERT));
        tableFillList.add(new TableFill("update_time", FieldFill.INSERT_UPDATE));
        tableFillList.add(new TableFill("create_user", FieldFill.INSERT));
        tableFillList.add(new TableFill("update_user", FieldFill.INSERT_UPDATE));
        tableFillList.add(new TableFill("delete_flag", FieldFill.INSERT));
        return tableFillList;
    }

    /**
     * 获取DataSourceConfig
     *
     * @return
     */
    private DataSourceConfig getMySqlDataSourceConfig() {
        return new DataSourceConfig()
                .setDbType(DbType.MYSQL)// 数据库类型
                .setTypeConvert(new MySqlTypeConvert() {
                    @Override
                    public IColumnType processTypeConvert(GlobalConfig globalConfig, String fieldType) {
                        if (fieldType.toLowerCase().equals("bit")) {
                            return DbColumnType.BOOLEAN;
                        }
                        if (fieldType.toLowerCase().equals("tinyint")) {
                            return DbColumnType.BOOLEAN;
                        }
                        if (fieldType.toLowerCase().equals("date")) {
                            return DbColumnType.LOCAL_DATE;
                        }
                        if (fieldType.toLowerCase().equals("time")) {
                            return DbColumnType.LOCAL_TIME;
                        }
                        if (fieldType.toLowerCase().equals("datetime")) {
                            return DbColumnType.LOCAL_DATE_TIME;
                        }
                        if (fieldType.toLowerCase().equals("bigint")) {
                            return DbColumnType.LONG;
                        }
                        return super.processTypeConvert(globalConfig, fieldType);
                    }
                })
                .setDriverName("com.mysql.cj.jdbc.Driver")
                .setUsername("root")
                .setPassword("abcd1234")
                .setUrl("jdbc:mysql://127.0.0.1:3306/magic4j?useUnicode=true&characterEncoding=UTF-8&useSSL=false");
    }

    /**
     * 获取GlobalConfig
     *
     * @return
     */
    private GlobalConfig getGlobalConfig() {
        return new GlobalConfig()
                .setOutputDir(getJavaPath())//输出目录
                .setFileOverride(false)// 是否覆盖文件
                .setActiveRecord(false)// 开启 activeRecord 模式
                .setEnableCache(false)// XML 二级缓存
                .setBaseResultMap(false)// XML ResultMap
                .setBaseColumnList(false)// XML columList
                .setKotlin(false) //是否生成 kotlin 代码
                .setOpen(false)
                .setSwagger2(true)//生成swagger注解
                .setAuthor("Created by xudp (alias:孤傲苍狼) 290603672@qq.com") //作者
                //自定义文件命名，注意 %s 会自动填充表实体属性！
                .setEntityName("%s")
                .setMapperName("%sMapper")
                .setXmlName("%sMapper")
                .setServiceName("%sService")
                .setServiceImplName("%sServiceImpl")
                .setControllerName("%sController");
    }


    /**
     * 获取根目录
     *
     * @return
     */
    private String getRootPath() {
        return System.getProperty("user.dir");
    }

    /**
     * 获取JAVA目录
     *
     * @return
     */
    private String getJavaPath() {
        String javaPath;
        if(StringUtils.isNotEmpty(module)){
            File file = new File(module);
            javaPath = file.getAbsolutePath()+ "/src/main/java";
        }else {
            javaPath = getRootPath() + "/src/main/java";
        }
        System.err.println(" Generator Java Path:【 " + javaPath + " 】");
        return javaPath;
    }

    /**
     * 获取Resource目录
     *
     * @return
     */
    protected String getResourcePath() {
        String resourcePath = getRootPath() + "/src/main/resources";
        if(StringUtils.isNotEmpty(module)){
            File file = new File(module);
            resourcePath = file.getAbsolutePath() + "/src/main/resources";
        }
        System.err.println(" Generator Resource Path:【 " + resourcePath + " 】");
        return resourcePath;
    }

    /**
     * 获取AutoGenerator
     *
     * @param tableName
     * @return
     */
    private AutoGenerator getAutoGenerator(String... tableName) {
        return new AutoGenerator()
                // 全局配置
                .setGlobalConfig(getGlobalConfig())
                // 数据源配置
                .setDataSource(getMySqlDataSourceConfig())
                // 策略配置
                .setStrategy(getStrategyConfig(tableName))
                // 包配置
                .setPackageInfo(getPackageConfig())
                // 注入自定义配置，可以在 VM 中使用 cfg.abc 设置的值
                .setCfg(getInjectionConfig())
                .setTemplate(getTemplateConfig());
    }

    /**
     * <p>
     * generator
     * </p>
     */
    private void generator(String... tableName) {
        // 代码生成器
        AutoGenerator mpg = getAutoGenerator(tableName);
        mpg.execute();
        if (tableName == null) {
            System.err.println(" Generator Success !");
        } else {
            System.err.println(" TableName【 " + tableName + " 】" + "Generator Success !");
        }
    }

    private Magic4jCodeGenerator(String module){
        this.module = module;
    }

    public Magic4jCodeGenerator(){

    }

    public static void main(String[] args){

        Magic4jCodeGenerator.bizModule="sys";//指定业务模块名称，例如：系统模块
        Magic4jCodeGenerator.uiProjectPath = "F:\\myProject\\project-ui\\magic4j-ui";
        Magic4jCodeGenerator.excelCodeGenerate = true;
        Magic4jCodeGenerator.appControllerCodeGenerate = true;
        Magic4jCodeGenerator.isTreeTable = true;//sys_org表是树形结构表
        Magic4jCodeGenerator.lazyTree = false;
        String[] modules = {"magic4j-dao","magic4j-application"};//模块名称
        for(String module:modules){
            Magic4jCodeGenerator codeGenerator = new Magic4jCodeGenerator(module);
            codeGenerator.generator("sys_org");
        }
    }
}
