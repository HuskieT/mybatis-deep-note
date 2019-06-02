# 参考

# 简介
DML 语句


# 详解

[1] inset
方式一：
语法：
insert into 表名(字段名,...) values(值,...);

方式二：
语法：
insert into 表名 set 字段=值,字段=值,...;

两种方式 的区别：
1.方式一支持一次插入多行，语法如下：
insert into 表名【(字段名,..)】 values(值，..),(值，...),...;
2.方式一支持子查询，语法如下：
insert into 表名
查询语句;

[2] update
一：
语法：update 表名 set 字段=值,字段=值 【where 筛选条件】;

二、修改多表的记录【补充】
语法：
update 表1 别名 
left|right|inner join 表2 别名 
on 连接条件  
set 字段=值,字段=值 
【where 筛选条件】;



[3] delete
一：
语法：delete from 表名 【where 筛选条件】【limit 条目数】
二、级联删除[补充]
语法：
delete 别名1,别名2 from 表1 别名 
inner|left|right join 表2 别名 
on 连接条件
 【where 筛选条件】

方式三：使用truncate
语法：truncate table 表名

[4] delete 与 truncate 区别
两种方式的区别【面试题】★

1.truncate删除后，如果再插入，标识列从1开始
  delete删除后，如果再插入，标识列从断点开始
2.delete可以添加筛选条件
 truncate不可以添加筛选条件
3.truncate效率较高
4.truncate没有返回值
delete可以返回受影响的行数
5.truncate不可以回滚
delete可以回滚






