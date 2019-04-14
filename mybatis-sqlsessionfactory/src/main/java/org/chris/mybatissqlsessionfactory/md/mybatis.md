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

# 3 association

<association property="xxx" column="xxx" select="xxx" ></association>


property 表示 been对象
cloumn 指定传入给select语句的参数（可以多个 用逗号隔开）
select 指定的sql去查询

# collection

<collection ></collection>

# jdk动态代理

//让jdk产生一个代理对象
Proxy.newProxyInstance(target.getClass().getClassLoad(),target.getClass().getInterfaces(),this)

3各参数：
target.getClass().getClassLoad() 类加载器
target.getClass().getInterfaces() 接口（代理对象挂在那个接口下）
this 代表当前的代理类（例：HelloServiceProxy类）

public Object invoke(Object proxy,Method method , Object[] args)

proxy  代理对象
method 当前调用的那个方法
args  方法的参数

# Mapper执行sql 底层实现

https://blog.csdn.net/laravelshao/article/details/81191795   Mybatis源码解析-Mybatis初始化过程

https://blog.csdn.net/laravelshao/article/details/81260281   Mybatis源码解析-Mapper执行sql 











