# mysql 存储过程
# 参考
 [MySQL 游标的使用](https://www.cnblogs.com/oukele/p/10684639.html)
# 简介

MySQL游标是只读的，不可滚动且不敏感的。

- 只读：您无法通过游标更新基础表中的数据。
- 不可滚动：您只能按SELECT语句确定的顺序获取行。您无法以相反的顺序获取行。此外，您不能跳过行或跳转到结果集中的特定行。
- 未定型：有两种光标：未定型游标和不敏感游标。敏感光标指向实际数据，而不敏感光标使用数据的临时副本。敏感性游标比不敏感游标执行得更快，因为它不必创建临时数据副本。但是，对来自其他连接的数据所做的任何更改都将影响敏感光标正在使用的数据，因此，如果不更新敏感光标正在使用的数据，则更安全。MySQL游标是敏感的。
您可以在存储过程，存储函数和触发器中使用MySQL游标


当光标不再使用时，您应关闭它。使用MySQL游标时，还必须声明NOT FOUND处理程序以在光标找不到任何行时处理情况。因为每次调用FETCH语句时，游标都会尝试读取结果集中的下一行。当光标到达结果集的末尾时，它将无法获取数据，并且会引发一个条件处理程序用于处理此情况。

要声明NOT FOUND处理程序，请使用以下语法：
```sql
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1; 
```
这  finished是一个变量，表示光标已到达结果集的末尾。请注意，处理程序声明必须出现在存储过程内的变量和游标声明之后。


# 详解

## 下图说明了MySQL游标的工作原理
![在这里插入图片描述](https://img-blog.csdnimg.cn/20201117160953834.png#pic_center)

## 1 简单游标示例sql
```
CREATE DEFINER=`root`@`localhost` PROCEDURE `test1`()
BEGIN
	 -- 定义变量
	 -- 注意 接收游标值为中文时 需要 给变量 指定 字符集为utf8
	 declare cid VARCHAR(40);
	 declare companyId VARCHAR(40);
	 -- 游标使用
	 -- 定义游标 behavior
     -- 游标声明必须在任何变量声明之后。如果在变量声明之前声明游标，MySQL将发出错误。游标必须始终与SELECT语句关联
	 declare behavior cursor for SELECT id,company_id FROM cxrz_archive_behavior ;
	 -- 打开游标 OPEN语句初始化游标的结果集，因此，必须在从结果集中获取行之前调用OPEN语句
	 OPEN  behavior;
	 -- 获取结果 使用FETCH语句检索光标指向的下一行，并将光标移动到结果集中的下一行
	 fetch behavior into cid,companyId;
	 -- 这里是为了显示获取结果
    select cid,companyId;
	 -- 关闭游标 调用CLOSE语句以停用游标并释放与其关联的内存
   close behavior;
	 
END
```

```
-- 定义语法结束符号
delimiter //
-- 创建一个 名称为 p2 的存储过程
create procedure p2()
begin
    -- 创建 用于接收游标值的变量
    declare id,age,total int;
    -- 注意 接收游标值为中文时 需要 给变量 指定 字符集为utf8
    declare name,sex varchar(20) character set utf8;
    
    -- 游标结束的标志
    declare done int default 0;
    -- 声明游标
    declare cur cursor for select stuId,stuName,stuSex,stuAge from student where stuAge > 19;
    -- 指定游标循环结束时的返回值 
    declare continue handler for not found set done =1;
    -- 打开游标
    open cur;
    
    -- 初始化 变量
    set total = 0;
    
    -- loop 循环
    xxx:loop
        -- 根据游标当前指向的一条数据  
        fetch cur into id,name,sex,age;
        -- 当 游标的返回值为 1 时 退出 loop循环 
        if done = 1 then
            leave xxx;
        end if;
        -- 累计
        set total = total + 1;
    end loop;
    -- 关闭游标
    close cur;
    -- 输出 累计的结果
    select total;
end //
delimiter ;
```
