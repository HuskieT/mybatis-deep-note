# 参考
https://blog.csdn.net/nangeali/article/details/73620044 

# 详解
1、delete语句，是DML语句，truncate语句通常被认为是DDL语句。

2、delete语句，后面可以跟where子句，通常指定where子句中的条件表达式，只删除满足条件的部分记录，而truncate语句，只能用于删除表中的所有记录。

3、truncate语句，删除表中的数据后，向表中添加记录时，自动增加字段的默认初始值重新从1开始，而使用delete语句，删除表中所有记录后，向表中添加记录时，自动增加字段的值，为删除时该字段的最大值加1，也就是在原来的基础上递增。

4、delete语句，每删除一条记录，都会在日志中记录，而使用truncate语句，不会在日志中记录删除的内容，因此，truncate语句的执行效率比delete语句高。
