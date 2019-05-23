# mysql 视图


## 1 参考资料


## 2 注意事项

**因为视图是一张虚拟表，所以新创建的视图的名称不能和当前数据库中的其他视图或者表的名称冲突！**
**般情况下，我们只在视图上执行查询操作而不进行更新操作！**

## 3 视图简介

视图其实就是某个查询的别名，而不是某个查询的结果集，换句话说就是，创建视图的时候并不会把那个又臭又长的查询语句的结果集维护在硬盘或者内存里！
在对视图进行查询时，MySQL服务器将会帮助我们把对视图的查询语句转换为对底层表的查询语句然后再执行

视图语法：CREATE VIEW 视图名 AS 查询语句
查看视图定义：SHOW CREATE VIEW 视图名
删除视图：DROP VIEW 视图名


不过并不是可以在所有的视图上执行更新语句的，在生成视图的时候使用了下边这些语句的都不能进行更新：

分组
连接查询
子查询
组合查询
聚集函数
DISTINCT
查询列表上是非列名的表达式

## 4  创建视图

CREATE [OR REPLACE] [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    VIEW view_name [(column_list)]
    AS select_statement
   [WITH [CASCADED | LOCAL] CHECK OPTION]
1）OR REPLACE：表示替换已有视图 （如果没有就新增 有就替换）

2）ALGORITHM：表示视图选择算法，默认算法是UNDEFINED(未定义的)：MySQL自动选择要使用的算法 ；merge合并；temptable临时表

3）select_statement：表示select语句

4）[WITH [CASCADED | LOCAL] CHECK OPTION]：表示视图在更新时保证在视图的权限范围之内

　　cascade是默认值，表示更新视图的时候，要满足视图和表的相关条件

　　local表示更新视图的时候，要满足该视图定义的一个条件即可

TIPS：推荐使用WHIT [CASCADED|LOCAL] CHECK OPTION选项，可以保证数据的安全性 

常用格式：
　　create view <视图名称>[(column_list)]
    as select语句
    with check option;

定义视图时的其他选项：
CREATE [OR REPLACE]   
　　[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]  
　　[DEFINER = { user | CURRENT_USER }]  
　　[SQL SECURITY { DEFINER | INVOKER }]
VIEW view_name [(column_list)]  
AS select_statement  
　　[WITH [CASCADED | LOCAL] CHECK OPTION]


1、ALGORITHM选项：选择在处理定义视图的select语句中使用的方法
　　①UNDEFINED：MySQL将自动选择所要使用的算法
　　②MERGE：将视图的语句与视图定义合并起来，使得视图定义的某一部分取代语句的对应部分
　　③TEMPTABLE：将视图的结果存入临时表，然后使用临时表执行语句
缺省ALGORITHM选项等同于ALGORITHM = UNDEFINED
2、DEFINER选项：指出谁是视图的创建者或定义者
　　①definer= '用户名'@'登录主机'
　　②如果不指定该选项，则创建视图的用户就是定义者，指定关键字CURRENT_USER(当前用户)和不指定该选项效果相同
3、SQL SECURITY选项：要查询一个视图，首先必须要具有对视图的select权限。
　　但是，如果同一个用户对于视图所访问的表没有select权限，那会怎么样？
SQL SECURITY选项决定执行的结果：
　　①SQL SECURITY DEFINER：定义(创建)视图的用户必须对视图所访问的表具有select权限，也就是说将来其他用户访问表的时候以定义者的身份，此时其他用户并没有访问权限。
　　②SQL SECURITY INVOKER：访问视图的用户必须对视图所访问的表具有select权限。
缺省SQL SECURITY选项等同于SQL SECURITY DEFINER　
视图权限总结：
　　使用root用户定义一个视图(推荐使用第一种)：u1、u2
　　　　1）u1作为定义者定义一个视图，u1对基表有select权限，u2对视图有访问权限：u2是以定义者的身份访问可以查询到基表的内容；
　　　　2）u1作为定义者定义一个视图，u1对基表没有select权限，u2对视图有访问权限，u2对基表有select权限：u2访问视图的时候是以调用者的身份，此时调用者是u2，可以查询到基表的内容。






















