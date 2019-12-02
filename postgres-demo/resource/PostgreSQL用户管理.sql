-- 组角色管理

-- 【例13.1】创建一个名称为post2的角色，SQL代码如下：
CREATE ROLE post2;
-- 【例13.2】查看系统中的角色，SQL代码如下：
SELECT rolname FROM pg_roles;
-- 【例13.3】修改角色post1的名称为post3。SQL语句如下：
ALTER ROLE post1 RENAME TO post3;
-- 【例13.4】删除角色post3。SQL语句如下：






DROP ROLE post3;




-- 角色的各种权限

-- 【例13.5】创建角色post4，此角色具有登录权限。SQL语句如下：
CREATE ROLE post4 LOGIN;
-- 【例13.6】创建角色post5，此角色具有超级用户权限。SQL语句如下：
CREATE ROLE post5 SUPERUSER;
-- 【例13.7】创建角色post6，此角色具有创建数据库权限。SQL语句如下：
-- CREATE ROLE post6 CREATEDB;
-- 4. CREATEROLE(创建角色)
-- 角色要想创建角色，必须明确给出该权限（除了超级用户以外）。一旦角色具有CREATEROLE权限，即可更改和删除其他角色，还可以给其它角色赋予或者撤销成员关系。当然，如果想对超级用户进行操作，仅有此权限还不够，必须拥有SUPERUSER权限。
-- 创建具有创建角色权限的角色，SQL语法如下：
CREATE ROLE name CREATEROLE;
-- 【例13.8】创建角色post7，此角色具有创建数据库权限。SQL语句如下：
CREATE ROLE post7 CREATEROLE;
-- 5. 口令
-- 在客户认证方法要求与数据库建立连接时，需要口令权限。常见的认证方法包括password、md5和crypt。
-- 创建具有口令权限的角色，SQL语法如下：
-- CREATE ROLE name 口令认证方法  具体口令
-- 【例13.9】创建角色post8，此角色具有口令权限。SQL语句如下：
CREATE ROLE post8 PASSWORD '123456';






-- 账户管理



-- 【例13.10】创建用户名称为postgre02，并具有创建数据库和创建角色的权限，同时登陆密码为“123456789”。SQL语句如下：
CREATE USER postgre02 PASSWORD '123456789'
  CREATEDB CREATEROLE  ;
-- 【例13.11】使用DROP USER删除账户“postgre02”，SQL语句如下：
DROP USER postgre02;
-- 【例13.12】将账户“postgre01”的密码修改为“123123”，SQL语句如下：
ALTER USER postgre01 PASSWORD '123123';
-- 【例13.13】给“post1”角色添加创建数据表和创建角色的权限，SQL语句如下：
ALTER ROLE post1  CREATEDB CREATEROLE;
-- 【例13.14】给“postgre01”用户添加创建数据表和创建角色的权限，SQL语句如下：
ALTER USER postgre01  CREATEDB CREATEROLE;
-- 【例13.15】将“post1”角色的创建数据表和创建角色权限收回，SQL语句如下：
ALTER ROLE post1  NOCREATEDB NOCREATEROLE;
-- 【例13.16】将“postgre01”用户的创建数据表和创建角色权限收回，SQL语句如下：
ALTER USER postgre01 NOCREATEDB NOCREATEROLE;


-- 数据库权限管理


-- 【例13.17】将“mytest”数据库的所有者修改为post1。SQL语句如下：
ALTER DATABASE mytest OWNER TO post2;
-- 【例13.18】其中ppo1是一个现有的数据表，postgres是一个现有的用户，允许postgres更新ppo1数据表，用下面的命令更新表的权限：
GRANT UPDATE ON ppo1 TO postgres;
-- 如果将上面的语句修改为：
GRANT UPDATE ON ppo1 TO PUBLIC;
-- 则表示将数据表ppo1的更新权限赋予系统中的所有角色。
-- 如果将上面的语句修改为：
GRANT ALL ON ppo1 TO postgres;
-- 则表示把适用于该对象的所有权限都赋予用户postgres。
