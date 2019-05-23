# MYSQL 函数


## 1 参考资料

    http://www.w3school.com.cn/sql/sql_union.asp   w3c教程
    https://www.yiibai.com/mysql/functions.html    易百教程mysql函数（全）  
    https://www.cnblogs.com/xuyulin/p/5468102.html   MySQL函数大全及用法示例
## 2 常用
## 2.1 函数分类
函数分类： 字符串函数  数学函数 时间函数

## 2.2 字符串函数
 
 concat 把参数连成一个长字符串并返回(任何参数是null时返回null)  

    mysql> select concat('my', 's', 'ql');  
    　　-> 'mysql' 
    mysql> select concat('my', null, 'ql');  
    　　-> null 
    mysql> select concat(14.3);  
    　　-> '14.3' 

length(str)  返回长度 字节数

      mysql> select length('my'');  
        　　-> 2

length(str)/octet_length(str)：返回字节数
char_length(str)/character_length(str)：返回字符数


LOCATE(substr,str) 
返回子串substr在字符串str第一个出现的位置，如果substr不是在str里面，返回0. 　

LOCATE(substr,str,pos) 
返回子串substr在字符串str第一个出现的位置，从位置pos开始。如果substr不是在str里面，返回0。

REVERSE(str) 
返回颠倒字符顺序的字符串str

## 2.3 数学函数
## 2.4 时间函数
time_to_sec(time)    
返回time值有多少秒    
mysql> select time_to_sec('22:23:00');    
　　-> 80580    
mysql> select time_to_sec('00:39:38');    
　　-> 2378 




