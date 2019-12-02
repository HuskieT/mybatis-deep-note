-- 表student设计的SQL语句如下：
CREATE TABLE student
(
  s_id  INT,
  name  VARCHAR(40)
);
-- 表stu_info设计的SQL语句如下：
CREATE TABLE stu_info
(
  s_id   INT,
  glass  VARCHAR(40),
  addr   VARCHAR(90)
);


-- 创建视图
-- 【例10.1】在数据t上创建一个名为view_t的视图，代码如下：
-- 首先创建基本表并插入数据，语句如下：
CREATE TABLE t (quantity INT, price INT);
INSERT INTO t VALUES(3, 50);
-- 创建视图语句为：
CREATE VIEW view_t AS SELECT quantity, price, quantity *price FROM t;
-- 查看视图语句如下：
SELECT * FROM view_t;
-- 默认情况下创建的视图和基本表的字段是一样，也可以通过指定视图字段的名称来创建视图。
-- 【例10.2】在t表格上创建一个名为view_t2的视图，代码如下：
CREATE VIEW view_t2(qty, price, total ) AS SELECT quantity, price, quantity *price FROM t;
-- 查看view_t2视图中的数据代码如下：
SELECT * FROM view_t2;
-- 【例10.3】在表student和表stu_info上创建视图stu_glass，代码如下：
-- 首先向两个表中插入数据，输入语句如下：
INSERT INTO student VALUES(1,'wanglin1'),(2,'gaoli'),(3,'zhanghai');
INSERT INTO stu_info VALUES(1, 'wuban','henan'),(2,'liuban','hebei'),(3,'qiban','shandong');
-- 创建视图stu_glass，SQL语句如下：
CREATE VIEW stu_glass (id,name, glass) AS SELECT student.s_id,student.name ,stu_info.glass
FROM student ,stu_info WHERE student.s_id=stu_info.s_id;
-- 查看stu_glass视图中的数据代码如下：
SELECT * FROM stu_glass;


-- 查看视图
-- 【例10.4】在views表中查看视图的详细定义，代码如下：
SELECT * FROM information_schema.views;

-- 删除视图
-- 【例10.5】删除stu_glass视图，代码如下：
DROP VIEW IF EXISTS stu_glass;
