# mysql 存储过程
# 参考
 [MySQL 游标的使用](https://www.cnblogs.com/oukele/p/10684639.html)
# 简介

# 详解
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
	 declare behavior cursor for SELECT id,company_id FROM cxrz_archive_behavior ;
	 -- 打开游标
	 OPEN  behavior;
	 -- 获取结果
	 fetch behavior into cid,companyId;
	 -- 这里是为了显示获取结果
    select cid,companyId;
	 -- 关闭游标
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
