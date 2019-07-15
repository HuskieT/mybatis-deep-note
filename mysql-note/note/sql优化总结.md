# 参考
[Mysql语句优化的原则——让你写sql更加顺手](https://blog.csdn.net/u011277123/article/details/78904569)
[数据库性能优化之SQL语句优化](https://blog.csdn.net/u011225629/article/details/50492403)
[数据库SQL优化大总结之 百万级数据库优化方案](https://blog.csdn.net/zhushuai1221/article/details/51740846)
[sql优化](https://www.cnblogs.com/dukuan/p/9486166.html)
[优化数据库对象](https://www.cnblogs.com/dukuan/p/9517365.html)
[浅谈MySQL中优化sql语句查询常用的30种方法](https://www.cnblogs.com/lonnie/p/8320095.html)
[常见Mysql的慢查询优化方式](https://blog.csdn.net/qq_35571554/article/details/82800463)
 
# 优化措施

## 语句优化

    1、检索不必要的列会带来额外的系统开销，该省则省，特别是LOB类型的列
    2、不要在子查询中使用count()求和执行存在性检查
    （推荐： sleect column_list from table where exists (select column_list from table2 where ...)）
    3、使用union实现or操作 （如果不是必须要不同的结果集，使用union all效果会更好，因为它不会对结果集排序。）
    4、为大对象使用延迟加载策略（在不同的表中存储大对象(如VARCHAR(MAX)，Image，Text等)，然后在主表中存储这些大对象的引用;）
    5、使用 join 优化子查询（因为使用join，MySQL不需要在内存中创建临时表）
    6、优化group by 语句（默认情况，MySQL对所有的group by col1,col2进行排序。这与在查询中指定order by col1, col2类似。如果查询中包括group by但用户想要避免排序结果的消耗，则可以使用order by null禁止排序）
    7、少用in,not in,<> 多用exists,not exists,=><
    8、能在代码里完成的业务逻辑就尽量不要放在SQL里
    9、尽量让SQL中少出现case、when、then，这样会让逻辑更清楚，让SQL可读性更强
    10、文件、图片等大文件用文件系统存储，不用数据库（不用多说，铁律！！！数据库只存储路径。）
    11、集中批量查询【减少数据库交互次数】
    12、sql语句尽可能简单：一条sql只能在一个cpu运算；大语句拆小语句，减少锁时间；一条大sql可以堵死整个库
    13、OR的效率是n级别，IN的效率是log(n)级别，in的个数建议控制在200以内
    14、使用同类型进行比较，比如用'123'和'123'比，123和123比
    15、尽量避免在WHERE子句中使用 != 或 <> 操作符，否则将引擎放弃使用索引而进行全表扫描
    16、列表数据不要拿全表，要使用LIMIT来分页，每页数量也不要太大
##  语句优化2

    1、最左前缀匹配原则 mysql会一直向右匹配直到遇到  范围查询(大于 、 小于、between、like)就停止匹配。所以要尽量把"="条件放在前面，把这些条件放在最后
    2、当取出的数据超过全表数据的20%时，不会使用索引。
    3、字段加函数不会使用索引。所以尽量把函数放在数值上
    4、使用组合索引时，必须要包括第一个列
        例如
        alter table test add index(a,b,c)：
        不使用索引：
        where b=1, c=2
        where b=1  
        where c=2
        使用索引： 
        where a=1, b=1, c=2 
        where a=1, b=1
        where a=1, c=2
         
