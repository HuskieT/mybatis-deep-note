-- 【例16.1】使用EXPLAIN语句来分析一个查询语句，执行如下语句：
EXPLAIN ANALYZE SELECT * FROM fruits;
-- 【例16.2】下面是查询语句中不使用索引和使用索引的对比。首先，分析未使用索引时的查询情况，EXPLAIN语句执行如下：
EXPLAIN  SELECT * FROM fruits WHERE f_name='apple';
-- 然后，在fruits表的f_name字段上加上索引。执行添加索引的语句及结果如下：
CREATE INDEX index_name ON fruits(f_name);
-- 现在，再分析上面的查询语句。执行的EXPLAIN语句及结果如下：
EXPLAIN ANALYZE  SELECT * FROM fruits WHERE f_name='apple';
-- 命令执行后结果如图16-3所示。
-- 【例16.8】使用ANALYZ来分析fruits表，执行的语句：
ANALYZE VERBOSE fruits;

