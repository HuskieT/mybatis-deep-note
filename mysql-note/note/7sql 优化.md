# sql优化


# 1 参考资料
https://www.cnblogs.com/skymyyang/p/7239010.html  MySQL慢查询日志分析
# 2 注意事项

# 3 获取有性能问题的sql的三种方法
用户反馈
慢查询日志获取存在问题的sql
实时获取存在性能问题的sql

# 4 慢查询日志


slow_query_log_file 指定慢查询日志的存储路径及文件
long_query_time 指定记录慢查询日志sql执行时间的阈值
log_queries_not_using_indexes 是否记录未使用索引的sql

配置方式：
配置文件配置
sql配置
通过脚本开定时的开关（启用/不启用慢查询日志）

## 4.1 慢查询日志配置

1 临时开启：  （如果需要长时间开启，则需要更改mysql配置文件）
sql> set global slow_query_log = on; 
关闭：
sql>  set global slow_query_log = off; 

2 临时设置慢查询时间临界点 
查询时间高于这个临界点的都会被记录到慢查询日志中（如果需要长时间开启，则需要更改mysql配置文件）。
//大于1秒的查询会被记录
set long_query_time = 1;

3设置慢查询存储的方式
就是说我的慢查询日志是通过file体现的,默认是none,我们可以设置为table或者file,如果是table则慢查询信息会保存到mysql库下的slow_log表中
set globle log_output = file;

4 查询慢查询日志的开启状态和慢查询日志储存的位置
show variables like '%quer%';

slow_query_log : 是否已经开启慢查询
slow_query_log_file : 慢查询日志文件路径
long_query_time :  超过多少秒的查询就写入日志 
log_queries_not_using_indexes 如果值设置为ON，则会记录所有没有利用索引的查询(性能优化时开启此项,平时不要开启)
log_slow_queries  指定日志文件存放位置，可以为空，系统会给一个缺省的文件host_name-slow.log
log_queries_not_using_indexes  记录超过的时间，默认为10s
    
**slow_query_log_file 与 log_slow_queries 区别：**
log_slow_queries 旧版（5.6以下版本）
slow_query_log_file  新版（5.6及以上版本）

## 4.2 慢查询工具 mysqldumpslow

日志分析工具mysqldumpslow  （mysql自带）
在实际生产环境中，如果要手工分析日志，查找、分析SQL，显然是个体力活，MySQL提供了日志分析工具mysqldumpslow

使用方法:
例：mysqldumpslow -s r -t 10 slow-mysql.log 

 


[root@localhost~]# mysqldumpslow --help
Usage: mysqldumpslow [ OPTS... ] [ LOGS... ]

    Parse and summarize the MySQL slow query log. Options are
    
      --verbose    verbose
      --debug      debug
      --help       write this text to standard output
    
      -v           verbose
      -d           debug
      -s ORDER     what to sort by (al, at, ar, c, l, r, t), 'at' is default
                    al: average lock time
                    ar: average rows sent
                    at: average query time
                     c: count
                     l: lock time
                     r: rows sent
                     t: query time  
      -r           reverse the sort order (largest last instead of first)
      -t NUM       just show the top n queries
      -a           don't abstract all numbers to N and strings to 'S'
      -n NUM       abstract numbers with at least n digits within names
      -g PATTERN   grep: only consider stmts that include this string
      -h HOSTNAME  hostname of db server for *-slow.log filename (can be wildcard),
                   default is '*', i.e. match all
      -i NAME      name of server instance (if using mysql.server startup script)
      -l           don't subtract lock time from total time
    
    mysqldumpslow --help

    解释说明：
    -s, 是表示按照何种方式排序
        c: 访问计数
     
        l: 锁定时间
     
        r: 返回记录
     
        t: 查询时间
     
        al:平均锁定时间
     
        ar:平均返回记录数
     
        at:平均查询时间
     
    -t, 是top n的意思，即为返回前面多少条的数据；
    -g, 后边可以写一个正则匹配模式，大小写不敏感的；
     
    比如:
    得到返回记录集最多的10个SQL。
    mysqldumpslow -s r -t 10 /database/mysql/mysql06_slow.log
     
    得到访问次数最多的10个SQL
    mysqldumpslow -s c -t 10 /database/mysql/mysql06_slow.log
     
    得到按照时间排序的前10条里面含有左连接的查询语句。
    mysqldumpslow -s t -t 10 -g “left join” /database/mysql/mysql06_slow.log
     
    另外建议在使用这些命令时结合 | 和more 使用 ，否则有可能出现刷屏的情况。
    mysqldumpslow -s r -t 20 /mysqldata/mysql/mysql06-slow.log | more

 
## 4.3 慢查询工具 pt-query-digest processlist表查询运行较慢的sql

可使用命令 快速安装
wget https://www.percona.com/downloads/percona-toolkit/2.2.16/RPM/percona-toolkit-2.2.16-1.noarch.rpm && yum localinstall -y  percona-toolkit-2.2.16-1.noarch.rpm


## 5 通过information_schema数据库下的
// 查询超过3秒的sql
SELECT id,user,host,DB,command,time,state,info FROM information_schema.PROCESSLIST WHERE TIME> =3





















