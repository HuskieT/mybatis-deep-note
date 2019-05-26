# mysql 触发器

## 1 参考

https://www.cnblogs.com/geaozhang/p/6819648.html 

## 2 详解

SQL触发器是一种特殊类型的存储过程。 这是特别的，因为它不像直接像存储过程那样调用。 触发器和存储过程之间的主要区别在于，
当对表执行数据修改事件时，会自动调用触发器，而存储过程必须要明确地调用。


触发器语法：
CREATE
    [DEFINER = user]
    TRIGGER trigger_name
    trigger_time trigger_event
    ON tbl_name FOR EACH ROW
    [trigger_order]
    trigger_body
    
    
    
trigger_name 触发器名称
trigger_time: { BEFORE | AFTER }是触发动作时间。它可以是BEFORE或 AFTER表示触发器在每行要修改之前或之后激活
trigger_event: { INSERT | UPDATE | DELETE } 表示激活触发器的操作类型
//是MySQL5.7之后的一个功能，用于定义多个触发器， 使用follows(尾随)或precedes(在…之先)来选择触发器执行的先后顺序
trigger_order: { FOLLOWS | PRECEDES } other_trigger_name   

常用语法格式：
CREATE TRIGGER 触发器名 BEFORE|AFTER 触发事件 ON 表名 FOR EACH ROW 执行语句;

# 3 查看 删除触发器
**所有触发器信息都存储在information_schema数据库下的triggers表中，可以使用SELECT语句查询，如果触发器信息过多，
最好通过TRIGGER_NAME字段指定查询。**
1 查看触发器：

【1】查看触发器  （结果，显示所有触发器的基本信息；无法查询指定的触发器。）
 mysql> SHOW TRIGGERS

【2】在information_schema.triggers表中查看触发器信息（结果，显示所有触发器的详细信息；同时，该方法可以查询制定触发器的详细信息）
mysql> SELECT * FROM information_schema.triggers

mysql> select * from information_schema.triggers  where trigger_name='upd_check'

2 删除触发器：

DROP TRIGGER [IF EXISTS] [schema_name.]trigger_name


# 4 触发器执行顺序

触发器的执行顺序

我们建立的数据库一般都是 InnoDB 数据库，其上建立的表是事务性表，也就是事务安全的。这时，若SQL语句或触发器执行失败，MySQL 会回滚事务，有：

①如果 BEFORE 触发器执行失败，SQL 无法正确执行。
②SQL 执行失败时，AFTER 型触发器不会触发。
③AFTER 类型的触发器执行失败，SQL 会回滚



