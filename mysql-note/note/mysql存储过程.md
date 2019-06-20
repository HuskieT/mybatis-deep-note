# mysql 存储过程
# 参考

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



[ IN | OUT | INOUT ] param_name type
其中，IN表示输入参数；OUT表示输出参数； INOUT表示既可以是输入，也可以是输出； 
param_name参数是存储过程的参数名称；type参数指定存储过程的参数类型，该类型可以是MySQL数据库的任意数据类型。
# 详解

[1] out 示例

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
[2] in 示例
```sql

CREATE DEFINER=`root`@`localhost` PROCEDURE `chris_test`(in param1 VARCHAR(11))
BEGIN
	SELECT count(*) from test where id=param1 ;
END
```
[3] mybatis 调用存储过程

```sql
<select id="getInfo" statementType="CALLABLE" resultMap="infoResultMap" parameterType="java.util.HashMap">
	{call net_procedure_request(#{select_type,mode=IN,jdbcType=VARCHAR},#{client_ip,mode=IN,jdbcType=VARCHAR})}
</select>

```




