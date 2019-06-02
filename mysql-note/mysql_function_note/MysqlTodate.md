# MYSQL 函数


## 1 参考资料

    http://www.w3school.com.cn/sql/sql_union.asp   w3c教程
    https://www.yiibai.com/mysql/functions.html    易百教程mysql函数
    https://www.cnblogs.com/xuyulin/p/5468102.html   MySQL函数大全及用法示例
    https://docs.qq.com/doc/DVkZyRGd1TU9wYk9E      尚硅谷资料汇总
## 2 常用
【1】distinct 去重
用distinct来返回不重复的用户名：
sql> select distinct name from user;
【2】 if函数类似于java三目
F(expr1,expr2,expr3)，如果expr1的值为true，则返回expr2的值，如果expr1的值为false，
【3】 连接字符 CONCAT
sql> SELECT CONCAT('a','b','c') AS 结果;  // 输出： abc
【4】IFNULL  函数
MYSQL IFNULL(expr1,expr2)          
如果expr1不是NULL，IFNULL()返回expr1，否则它返回expr2。IFNULL()返回一个数字或字符串值，取决于它被使用的上下文环境
【5】isnull 函数
isnull(exper) 判断exper是否为空，是则返回1，否则返回0
【6】nullif 函数
nullif(exper1,exper2)如果expr1= expr2 成立，那么返回值为NULL，否则返回值为   expr1。
[7] **is null或is not null 可以判断null值**
[8] asc ：升序，如果不写默认升序  
[9] 其他函数
SELECT VERSION(); // 当前数据库服务器的版本
SELECT DATABASE(); //数据库名称
SELECT USER(); //当前用户

[10]

# 3 常用函数 作用总结
二、单行函数
1、字符函数
concat:连接
substr:截取子串
upper:变大写
lower：变小写
replace：替换
length：获取字节长度
trim:去前后空格
lpad：左填充
rpad：右填充
instr:获取子串第一次出现的索引
2、数学函数
ceil:向上取整
round：四舍五入
mod:取模
floor：向下取整
truncate:截断
rand:获取随机数，返回0-1之间的小数

3、日期函数

now：返回当前日期+时间
year:返回年
month：返回月
day:返回日
date_format:将日期转换成字符
curdate:返回当前日期
str_to_date:将字符转换成日期
curtime：返回当前时间
hour:小时
minute:分钟
second：秒
datediff:返回两个日期相差的天数
monthname:以英文形式返回月

4、其他函数
version 当前数据库服务器的版本
database 当前打开的数据库
user当前用户
password('字符')：返回该字符的密码形式
md5('字符'):返回该字符的md5加密形式

5、流程控制函数

①if(条件表达式，表达式1，表达式2)：如果条件表达式成立，返回表达式1，否则返回表达式2
②case情况1
case 变量或表达式或字段
when 常量1 then 值1
when 常量2 then 值2
...
else 值n
end

③case情况2
case 
when 条件1 then 值1
when 条件2 then 值2
...
else 值n
end

三、分组函数
1、分类
max 最大值
min 最小值
sum 和
avg 平均值
count 计算个数

2、特点

①语法
select max(字段) from 表名;

②支持的类型
sum和avg一般用于处理数值型
max、min、count可以处理任何数据类型

③以上分组函数都忽略null
④都可以搭配distinct使用，实现去重的统计
select sum(distinct 字段) from 表;
⑤count函数
count(字段)：统计该字段非空值的个数
count(*):统计结果集的行数
案例：查询每个部门的员工个数
1 xx    10
2 dd    20
3 mm    20
4 aa    40
5 hh    40

count(1):统计结果集的行数

效率上：
MyISAM存储引擎，count(*)最高
InnoDB存储引擎，count(*)和count(1)效率>count(字段)

⑥ 和分组函数一同查询的字段，要求是group by后出现的字段
















