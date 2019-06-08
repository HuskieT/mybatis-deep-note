
1.1、把 mysql-5.7.19-winx64.zip 压缩文件解压到 C:\MySQL\ 目录下；
2、在 C:\MySQL\ 目录下新建 my.ini 配置文件；
3、用文本编辑器或其他编辑器打开 my.ini 文件，把以下代码复制粘贴进去，保存退出；

#代码开始
[Client]
#设置3306端口
port = 3306

[mysqld]
#设置3306端口
port = 3306
# 设置mysql的安装目录
basedir=C:\mysql
# 设置mysql数据库的数据的存放目录
datadir=C:\mysql\data
# 允许最大连接数
max_connections=200
# 服务端使用的字符集默认为8比特编码的latin1字符集
character-set-server=utf8
# 创建新表时将使用的默认存储引擎
default-storage-engine=INNODB
sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES

[mysql]
# 设置mysql客户端默认字符集
default-character-set=utf8
#代码结束

4、配置环境变量；

4.1、新建系统变量 MYSQL_HOME ，并配置变量值为 C:\mysql ；
4.2、编辑系统变量 Path ，将 ;%MYSQL_HOME%\bin 添加到 Path 变量值后面。

5、以管理员身份运行命令提示符cmd（一定要用管理员身份运行，不然权限不够）；

5.1、使用dos指令，进入C:\mysql 目录，运行以下指令

mysqld --defaults-file=my.ini --initialize-insecure
mysqld --install  （要以管理员身份运行 [找到cmd.exe右键管理员身份运行]）
net start mysql

5.2、设置 mysql 的 root 密码，运行以下指令

mysql -u root -p
use mysql;
update user set authentication_string=password('您的密码') where user='root';
flush privileges;
exit

至此，Mysql 5.7.19 winx64 解压缩版配置安装已经完成！祝您成功！

*******************************************************************************
解释说明：
Linux系统下是my.cnf  window系统下为my.ini


Client  客户；顾客；委托人 Section 部分

1.my.ini分两部分 
 Client Section MySQL客户端参数  包括 [Client] 和[mysql]
 server Section 包括 [mysqld]


过程中出现的几个错误：

1、不新建my.ini文件,直接执行mysqld -install  成功添加了mysql服务，因为mysql会使用默认配置，但我同时也没执行mysqld --initialize-insecure --user=  命令

结果是：net start mysql 无法启动服务。

2、编码问题，mysql的编码需要在my.ini中配置，默认不支持中文编码，所以第一次我执行insert语句是报错了，说是string格式错误。

3、配置文件中是有分模块配置的，比如[client]、[mysqld]、[mysql]，设置的参数不对号入座的话，就会发生错误


出现msvcr120.dll缺失时 将msvcr120.xp510.com.rar解压后msvcr120.dll放到C:\Windows\System32 下面

如果出现0x700000错误 在电脑中找DirectXRepair35.rar压缩文件 解压安装修复


********************************************************************************

修改密码：

方法1： 用SET PASSWORD命令 
首先登录MySQL。 
格式：mysql> set password for 用户名@localhost = password('新密码'); 
例子：mysql> set password for root@localhost = password('123'); 

方法2：用mysqladmin 
格式：mysqladmin -u用户名 -p旧密码 password 新密码 
例子：mysqladmin -uroot -p123456 password 123 

方法3：用UPDATE直接编辑user表 
首先登录MySQL。 
mysql> use mysql; 
mysql> update user set password=password('123') where user='root' and host='localhost'; 
mysql> flush privileges; 

方法4：在忘记root密码的时候，可以这样 
以windows为例： 
1. 关闭正在运行的MySQL服务。 
2. 打开DOS窗口，转到mysql\bin目录。 
3. 输入mysqld --skip-grant-tables 回车。--skip-grant-tables 的意思是启动MySQL服务的时候跳过权限表认证。 
4. 再开一个DOS窗口（因为刚才那个DOS窗口已经不能动了），转到mysql\bin目录。 
5. 输入mysql回车，如果成功，将出现MySQL提示符 >。 
6. 连接权限数据库： use mysql; 。 
6. 改密码：update user set password=password("123") where user="root";（别忘了最后加分号） 。 
7. 刷新权限（必须步骤）：flush privileges;　。 
8. 退出 quit。 
9. 注销系统，再进入，使用用户名root和刚才设置的新密码123登录。
