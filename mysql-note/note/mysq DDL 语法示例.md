## 创建数据库
create database  alt
show databases
use alt 

alter table  sus_user  add  role_id varchar(32) default 0
alter table  sus_user  modify  role_id varchar(32)

truncate  table //删除表中的所有数据  释放表的存储空间
//truncate 语句不能回滚   delete 语句可以回滚

mysql数据库有以下六种约束
– NOT NULL 非空约束，规定某个字段不能为空
– UNIQUE 唯一约束，规定某个字段在整个表中是唯一的
– PRIMARY KEY 主键(非空且唯一)
– FOREIGN KEY 外键
– CHECK 检查约束
– DEFAULT 默认值

### 使用表级约束语法
CONSTRAINT uk name pwd UNIQUE（NAME，PASSWORD）
###  添加列约束

ALTER TABLE USER  ADD CONSTRAINT uk name pwd UNIQUE(NAME,PASSWORD);
或
ALTER TABLE USER  ADD UNIQUE(NAME,PASSWORD); 

### 删除列约束
ALTER TABLE USER DROP INDEX uk name pwd;

## 参考