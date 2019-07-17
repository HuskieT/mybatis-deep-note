# mysql 存储过程
# 参考
[MySQL存储过程中，定义变量有两种方式](https://blog.csdn.net/ctx645634642/article/details/77484716)
# 简介
[1]【definer和invoker的解释】
    创建存储过程的时候可以指定 SQL SECURITY属性，设置为 DEFINER 或者INVOKER，用来奉告mysql在执行存储过程的时候，，是以DEFINER用户的权限来执行，还是以调用者的权限来执行。
    默认情况下，使用DEFINER方式，此时调用存储过程的用户必须有存储过程的EXECUTE权限，并且DEFINER指定的用户必须是在mysql.user表中存在的用户。
    **DEFINER模式下**，默认DEFINER=CURRENT_USER，在存储过程执行时，mysql会检查DEFINER定义的用户'user_name'@'host_name'的权限；
    **INVOKER模式下**，在存储过程执行时，会检查存储过程调用者的权限。
[2] delimiter 
其实就是告诉MySQL解释器，该段命令是否已经结束了，mysql是否可以执行了。默认情况下，delimiter是分号;。在命令行客户端中，
如果有一行命令以分号结束，那么回车后，mysql将会执行该命令。

如下示例：先设置：  DELIMITER $$  (设置结束符为 $$)   
                    END$$ 标识sql结束 
                    DELIMITER ;   将结束符从新设置为默认
```sql
DROP procedure IF EXISTS net_procedure_request;
DELIMITER $$
CREATE procedure net_procedure_request(in select_type varchar(99))
BEGIN
   IF select_type='0' THEN
      select client_ip,request_size_all,from_unixtime(start_time,'%Y年%m月%d日-%H时:%i分:%S秒') as startTime from net_table_request;
   ELSEIF select_type='1' THEN
      select client_ip,request_size_all,from_unixtime(start_time,'%Y年%m月%d日-%H时:%i分') as startTime from net_table_request;
   ELSEIF select_type='2' THEN
      select client_ip,request_size_all,from_unixtime(start_time,'%Y年%m月%d日-%H时') as startTime from net_table_request;
   END IF;
END$$
DELIMITER ;
```   
[3] 语法
```
CREATE
    [DEFINER = { user | CURRENT_USER }]
　PROCEDURE sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body

proc_parameter:
    [ IN | OUT | INOUT ] param_name type

characteristic:
    COMMENT 'string'
  | LANGUAGE SQL
  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }

routine_body:
　　Valid SQL routine statement

[begin_label:] BEGIN
　　[statement_list]
　　　　……
END [end_label]
```
[4] 存储过程体
存储过程体包含了在过程调用时必须执行的语句，例如：dml、ddl语句，if-then-else和while-do语句、声明变量的declare语句等
过程体格式：以begin开始，以end结束(可嵌套)
```
BEGIN
　　BEGIN
　　　　BEGIN
　　　　　　statements; 
　　　　END
　　END
END
```
注意：每个嵌套块及其中的每条语句，必须以分号结束，表示过程体结束的begin-end块(又叫做复合语句compound statement)，则不需要分号。

[5] 为语句块贴标签
标签有两个作用：①增强代码的可读性 　②在某些语句(例如:leave和iterate语句)，需要用到标签
```
[begin_label:] BEGIN
　　[statement_list]
END [end_label]
```
例如：
```
label1: BEGIN
　　label2: BEGIN
　　　　label3: BEGIN
　　　　　　statements; 
　　　　END label3 ;
　　END label2;
END label1
```
[6] 
[ IN | OUT | INOUT ] param_name type
其中，IN表示输入参数；OUT表示输出参数； INOUT表示既可以是输入，也可以是输出； 
param_name参数是存储过程的参数名称；type参数指定存储过程的参数类型，该类型可以是MySQL数据库的任意数据类型。

①如果过程没有参数，也必须在过程名后面写上小括号
　例：CREATE PROCEDURE sp_name ([proc_parameter[,...]]) ……
②确保参数的名字不等于列的名字，否则在过程体中，参数名被当做列名来处理

**强烈建议**
>输入值使用in参数；
>返回值使用out参数；
>inout参数就尽量的少用。

[7] 变量赋值
语法： SET 变量名 = 表达式值 [,variable_name = expression ...]

SET @p_in=1
[8] 变量 
语法： DECLAREvariable_name [,variable_name...] datatype [DEFAULT value];
例如：
   1.  DECLARE l_int int unsigned default 4000000;  
   2.  DECLARE l_numeric number(8,2) DEFAULT 9.95;  
   3.  DECLARE l_date date DEFAULT '1999-12-31';  
   4.  DECLARE l_datetime datetime DEFAULT '1999-12-31 23:59:59';  
   5.  DECLARE l_varchar varchar(255) DEFAULT 'This will not be padded
[9] 用户变量 

①用户变量名一般以@开头
②滥用用户变量会导致程序难以理解及管理
**1 在存储过程中使用用户变量**
```sql
mysql > CREATE PROCEDURE GreetWorld( ) SELECT CONCAT(@greeting,' World');  
mysql > SET @greeting='Hello';  
mysql > CALL GreetWorld( );  
+----------------------------+  
| CONCAT(@greeting,' World') |  
+----------------------------+  
|  Hello World               |  
+----------------------------+  
```
**2 在存储过程间传递全局范围的用户变量** 
```sql
1.  mysql> CREATE PROCEDURE p1()   SET @last_procedure='p1';  
2.  mysql> CREATE PROCEDURE p2() SELECT CONCAT('Last procedure was ',@last_procedure);  
3.  mysql> CALL p1( );  
4.  mysql> CALL p2( );  
5.  +-----------------------------------------------+  
6.  | CONCAT('Last procedure was ',@last_proc       |  
7.  +-----------------------------------------------+  
8.  | Last procedure was p1                        |  
9.  +-----------------------------------------------+  
```
[10] 存储过程 查询

    我们可以用
    select name from mysql.proc where db=’数据库名’;
    或者
    select routine_name from information_schema.routines where routine_schema='数据库名';
    或者
    show procedure status where db='数据库名';


# 详解

## [1] out 示例

```sql
mysql> delimiter $$
mysql> CREATE PROCEDURE simpleproc (OUT param1 INT)
    -> BEGIN
    ->   SELECT COUNT(*) INTO param1 FROM t;
    -> END$$
mysql> delimiter ;
mysql> CALL simpleproc(@a);
mysql> SELECT @a;

```
## [2] in 示例
```sql

CREATE DEFINER=`root`@`localhost` PROCEDURE `chris_test`(in param1 VARCHAR(11))
BEGIN
	SELECT count(*) from test where id=param1 ;
END
```
## [3] mybatis 调用存储过程

```sql
<select id="getInfo" statementType="CALLABLE" resultMap="infoResultMap" parameterType="java.util.HashMap">
	{call net_procedure_request(#{select_type,mode=IN,jdbcType=VARCHAR},#{client_ip,mode=IN,jdbcType=VARCHAR})}
</select>

```
## [4]  定义变量有两种方式
MySQL存储过程中，定义变量有两种方式：
   
    1、使用set或select直接赋值，变量名以 @ 开头，（可以在一个会话的任何地方声明，作用域是整个会话，称为会话变量）
    2、以 DECLARE 关键字声明的变量，只能在存储过程中使用，称为存储过程变量

**两者的区别是：**

    在调用存储过程时，以DECLARE声明的变量都会被初始化为 NULL。而会话变量（即@开头的变量）则不会被再初始化，在一个会话内，只须初始化一次，之后在会话内都是对上一次计算的结果，就相当于在是这个会话内的全局变量。


