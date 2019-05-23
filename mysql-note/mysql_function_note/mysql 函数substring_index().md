# mysql 函数substring_index()

## 参考
http://www.cnblogs.com/lijiageng/p/6511334.html

## 详解

函数： 
1、从左开始截取字符串 
left（str, length） 
说明：left（被截取字段，截取长度） 
例：select left（content,200） as abstract from my_content_t 

 


2、从右开始截取字符串 
right（str, length） 
说明：right（被截取字段，截取长度） 
例：select right（content,200） as abstract from my_content_t 

 


3、截取字符串 
substring（str, pos） 
substring（str, pos, length） 
说明：substring（被截取字段，从第几位开始截取） 
substring（被截取字段，从第几位开始截取，截取长度） 
例：select substring（content,5） as abstract from my_content_t 
select substring（content,5,200） as abstract from my_content_t 
（注：如果位数是负数 如-5 则是从后倒数位数，到字符串结束或截取的长度） 

 


4、按关键字截取字符串 
substring_index（str,delim,count） 
说明：substring_index（被截取字段，关键字，关键字出现的次数） 
例：select substring_index（"blog.jb51.net"，"。"，2） as abstract from my_content_t 
结果：blog.jb51 
（注：如果关键字出现的次数是负数 如-2 则是从后倒数，到字符串结束） 

