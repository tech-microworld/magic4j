# 基于字段名规约的代码生成器

## 服务说明
基于数据库表字段名命名约定，推演出UI页面的控件渲染类型
约定如下：

    parent_id->tree-select
    region_id->tree-select
    order_num->el-input-number
    remark->textarea
    status->select/radio(数据字典(表名+Status))
    type->select/radio(数据字典(表名+Type))

    
## 服务名称:
magic4j-codeGenerator