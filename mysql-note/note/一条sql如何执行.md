# 一条sql如何执行.md


## 1 参考资料

https://github.com/HuskieT/JavaGuide/blob/master/docs/database/%E4%B8%80%E6%9D%A1sql%E8%AF%AD%E5%8F%A5%E5%9C%A8mysql%E4%B8%AD%E5%A6%82%E4%BD%95%E6%89%A7%E8%A1%8C%E7%9A%84.md
https://www.cnblogs.com/xiaolovewei/p/8999623.html     mysql语句的执行顺序

## 2 MySQL 基础架构分析

Server 层：主要包括连接器、查询缓存、分析器、优化器、执行器等，所有跨存储引擎的功能都在这一层实现，比如存储过程、触发器、视图，函数等，还有一个通用的日志模块 binglog 日志模块。
存储引擎： 主要负责数据的存储和读取，采用可以替换的插件式架构，支持 InnoDB、MyISAM、Memory 等多个存储引擎，其中 InnoDB 引擎有自有的日志模块 redolog 模块。现在最常用的存储引擎是 InnoDB，
            它从 MySQL 5.5.5 版本开始就被当做默认存储引擎了。

## sql查询的顺序
Select [select选项] 字段列表[字段别名]/* from 数据源 [where条件子句] [group by子句] [having子句] [order by子句] [limit 子句];

SQL Select语句完整的执行顺序：
1、from子句组装来自不同数据源的数据；
2、where子句基于指定的条件对记录行进行筛选；
3、group by子句将数据划分为多个分组；
4、使用聚集函数进行计算；
5、使用having子句筛选分组；
6、计算所有的表达式；
7、使用order by对结果集进行排序。

