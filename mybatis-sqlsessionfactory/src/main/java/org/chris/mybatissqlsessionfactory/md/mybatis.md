# 1 自定义TypeHandler 里用注解配置jdbcType 和javaType

@MappedTypes  定义 javaType 可以指定那些java类型被拦截
@MapperJdbcTypes  定义里用注解配置jdbcType ，他需要满足枚举类org.apache.ibatis.type.jdbc.JdbcType所列的枚举类型

在没有任何标识的情况下 mybatis是不会启用你定义的typeHandler进行类型结果转换的
所以必须给予标识，比如配置jdbcType和javaType  或者 直接使用typeHandler属性指定


# 2 引入映射器 (xml引入映射器的四种方式)

<mappers>
    <mapper  resource = "com/chris/xxx/mapper/roleMapper.xml" />
<mappers>

<mappers>
    <mapper  url = "file:///com/chris/xxx/mapper/roleMapper.xml" />
<mappers>

<mappers>
    <package  name = "com.xml.xxx.mapper.roleMapper" />
<mappers>

<mappers>
    <mapper  class = "com.xml.xxx.mapper.roleMapper" />
<mappers>