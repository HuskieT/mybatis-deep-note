
/**distinct 结果去重**/
sql > select  distinct  name from  student

-- ----------------------------
-- top 获取结果的前几个 或 百分比
-- ----------------------------
-- 结果的前两个
SELECT TOP 2 * FROM Persons
-- 结果从上上面开始选取 50%
SELECT TOP 50 PERCENT * FROM Persons

-- ----------------------------
-- SELECT INTO 语句常用于创建表的备份复件或者用于对记录进行存档。
-- ----------------------------

-- 您可以把所有的列插入新表：
SELECT *
INTO new_table_name [IN externaldatabase]
FROM old_tablename

-- 或者只把希望的列插入新表：
SELECT column_name(s)
INTO new_table_name [IN externaldatabase]
FROM old_tablename

-- IN 子句可用于向另一个数据库中拷贝表：
SELECT * INTO Persons IN 'Backup.mdb' FROM Persons WHERE City='Beijing'
--  如果我们希望拷贝某些域，可以在 SELECT 语句后列出这些域：
SELECT LastName,FirstName INTO Persons_backup FROM Persons

-- 下面的例子会创建一个名为 "Persons_Order_Backup" 的新表，其中包含了从 Persons 和 Orders 两个表中取得的信息：
SELECT Persons.LastName,Orders.OrderNo
INTO Persons_Order_Backup
FROM Persons
INNER JOIN Orders
ON Persons.Id_P=Orders.Id_P


-- ----------------------------
-- UNIQUE 约束
-- UNIQUE 约束唯一标识数据库表中的每条记录。
-- UNIQUE 和 PRIMARY KEY 约束均为列或列集合提供了唯一性的保证。
-- PRIMARY KEY 拥有自动定义的 UNIQUE 约束。
-- 请注意，每个表可以有多个 UNIQUE 约束，但是每个表只能有一个 PRIMARY KEY 约束。
-- ----------------------------

-- UNIQUE 约束
CREATE TABLE Persons
(
Id_P int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
UNIQUE (Id_P)
)

-- 如果需要命名 UNIQUE 约束，以及为多个列定义 UNIQUE 约束，请使用下面的 SQL 语法：
CREATE TABLE Persons
(
Id_P int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT uc_PersonID UNIQUE (Id_P,LastName)
)

-- 删除唯一索引
ALTER TABLE Persons
ADD UNIQUE (Id_P)
-- 删除唯一索引
ALTER TABLE Persons
DROP INDEX uc_PersonID


-- ----------------------------
--  FOREIGN 外键约束
-- ----------------------------

CREATE TABLE Orders
(
Id_O int NOT NULL,
OrderNo int NOT NULL,
Id_P int,
PRIMARY KEY (Id_O),
FOREIGN KEY (Id_P) REFERENCES Persons(Id_P)
)

-- ----------------------------
-- CHECK 约束用于限制列中的值的范围。
-- 如果对单个列定义 CHECK 约束，那么该列只允许特定的值。
-- 如果对一个表定义 CHECK 约束，那么此约束会在特定的列中对值进行限制。
-- ----------------------------

CREATE TABLE Persons
(
Id_P int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255) ,
Address varchar(255),
City varchar(255),
AGE int CHECK (Id_P>0),
CHECK (Id_P>0)
)
-- 如果需要命名 CHECK 约束，以及为多个列定义 CHECK 约束
CREATE TABLE Persons
(
Id_P int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT chk_Person CHECK (Id_P>0 AND City='Sandnes')
)

-- ----------------------------
-- ALTER TABLE 语句用于在已有的表中添加、修改或删除列。
-- ----------------------------

--  如需在表中添加列
ALTER TABLE table_name
ADD column_name datatype
--  要删除表中的列
ALTER TABLE table_name
DROP COLUMN column_name
--  要改变表中列的数据类型
ALTER TABLE table_name
ALTER COLUMN column_name datatype


-- 把 "Persons" 表中的 "P_Id" 列定义为 auto-increment 主键：
CREATE TABLE Persons
(
P_Id int NOT NULL AUTO_INCREMENT,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
PRIMARY KEY (P_Id)
)


-- ----------------------------
-- MySQL 使用下列数据类型在数据库中存储日期或日期/时间值：
-- DATE - 格式 YYYY-MM-DD
-- DATETIME - 格式: YYYY-MM-DD HH:MM:SS
-- TIMESTAMP - 格式: YYYY-MM-DD HH:MM:SS
-- YEAR - 格式 YYYY 或 YY
-- ----------------------------

--  [版本需求 mysql8]  将查询结果作为下一个语句的参数 、表使用
--  with xx as (select xxx)






