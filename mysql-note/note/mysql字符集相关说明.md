# mysql 字符集
# 1 参考资料
https://help.aliyun.com/knowledge_detail/41706.html?spm=5176.2000002.0.0.101f4a3bAcSjmv

# 2 简介
[2] 排序规则的后半部份即后缀 含义
例如： utf8_general_ci
　　_BIN 二进制排序
　　_CI(CS) 是否区分大小写，CI不区分，CS区分
　　_AI(AS) 是否区分重音，AI不区分，AS区分
　　_KI(KS) 是否区分假名类型,KI不区分，KS区分
　　_WI(WS) 是否区分宽度 WI不区分，WS

[2] 字符集相关 MySQL 命令

show global variables like '%char%';    #查看RDS实例字符集相关参数设置
show global variables like 'coll%';     #查看当前会话字符序相关参数设置
show character set;                     #查看实例支持的字符集
show collation;                         #查看实例支持的字符序
show create table table_name \G         #查看表字符集设置
show create database database_name \G   #查看数据库字符集设置
show create procedure procedure_name \G #查看存储过程字符集设置
show procedure status \G                #查看存储过程字符集设置
alter database db_name default charset utf8;  #修改数据库的字符集
create database db_name character set utf8;   #创建数据库时指定字符集
alter table tab_name default charset utf8 collate utf8_general_ci;   #修改表字符集和字符序
# 详解