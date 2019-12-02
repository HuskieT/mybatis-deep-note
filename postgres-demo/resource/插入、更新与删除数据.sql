-- 【例7.1】在person表中，插入一条新记录，id值为1，name值为Green，age值为21，info值为lawyer，SQL语句如下：
-- 执行插入操作之前，使用SELECT语句查看表中的数据：
SELECT * FROM person;
-- 结果显示当前表为空，没有数据，接下来执行插入操作：
INSERT INTO person (id ,name, age , info)
     VALUES (1,'Green', 21, 'Lawyer');
-- 语句执行完毕，查看执行结果：
SELECT * FROM person;
-- 【例7.2】在person表中，插入一条新记录，id值为2，name值为Suse，age值为22，info值为dancer，SQL语句如下：
INSERT INTO person (age ,name, id , info)
      VALUES (22, 'Suse', 2, 'dancer');
-- 语句执行完毕，查看执行结果：
SELECT * FROM person;
-- 【例7.3】在person表中，插入一条新记录，SQL语句如下：
INSERT INTO person
     VALUES (3,'Mary', 24, 'Musician');
-- 语句执行完毕，查看执行结果：
SELECT * FROM person;
-- 【例7.4】在person表中，插入一条新记录，id值为4，name值为laura，age值为25，SQL语句如下：
INSERT INTO person (id,name, age ) VALUES (4,'Laura', 25);
-- 语句执行完毕，查看执行结果，
SELECT * FROM person;
-- 【例7.5】在person表中，在id、name、age和info字段指定插入值，同时插入3条新记录，SQL语句如下：
INSERT INTO person(id,name, age, info)
VALUES (5,'Evans',27, 'secretary'),
(6,'Dale',22, 'cook'),
(7,'Edison',28, 'singer');
-- 语句执行完毕，查看执行结果：
SELECT * FROM person;
-- 【例7.6】在person表中，不指定插入列表，同时插入2条新记录，SQL语句如下：
INSERT INTO person
VALUES (8,'Harry',21, 'magician'),
(9,'Harriet',19, 'pianist');
-- 语句执行完毕，查看执行结果，
SELECT * FROM person;
-- 【例7.7】从person_old表中查询所有的记录，并将其插入到person表中。
-- 首先，创建一个名为person_old的数据表，其表结构与person结构相同，SQL语句如下：
CREATE TABLE person_old
(
id     INT  NOT NULL,
name   CHAR(40) NOT NULL DEFAULT '',
age    INT NOT NULL DEFAULT 0,
info   CHAR(50) NULL,
PRIMARY KEY (id)
);
-- 向person_old表中添加两条记录：
INSERT INTO person_old
VALUES (10,'Harry',20, 'student'),
(11,'Beckham',31, 'police');
-- 查询插入的记录：
SELECT * FROM person_old;
INSERT INTO person(id, name, age, info)
SELECT id, name, age, info FROM person_old;
-- 语句执行完毕，查看执行结果：
SELECT * FROM person;
-- 更新数据



-- 【例7.8】在person表中，更新id值为10的记录，将age字段值改为15，将name字段值改为LiMing。
-- 更新操作执行前可以使用SELECT语句查看当前的数据：
SELECT * FROM person WHERE id=10;
-- 由结果可以看到更新之前，id等于10的记录的name字段值为harry，age字段值为20，下面使用UPDATE语句更新数据，语句执行结果如下：
UPDATE person SET age = 15, name='LiMing' WHERE id = 10;
-- 语句执行完毕，查看执行结果：
SELECT * FROM person WHERE id=10;
-- 【例7.9】在person表中，更新age值为19到22的记录，将info字段值都改为student。
-- 更新操作执行前可以使用SELECT语句查看当前的数据：
SELECT * FROM person WHERE age BETWEEN 19 AND 22;
-- 可以看到，这些age字段值在19到22之间的记录的info字段值各不相同。下面使用UPDATE语句更新数据，语句执行结果如下：
UPDATE person SET info='student' WHERE age BETWEEN 19 AND 22;
-- 语句执行完毕，查看执行结果：
SELECT * FROM person WHERE age BETWEEN 19 AND 22;


-- 删除数据/

-- 【例7.10】在person表中，删除id等于10的记录，SQL语句如下：
-- 执行删除操作前使用SELECT语句查看当前id=10的记录：
SELECT * FROM person WHERE id=10;
-- 可以看到，现在表中有id=10的记录，下面使用DELETE语句删除记录，语句执行结果如下：
DELETE FROM person WHERE id = 10;
-- 语句执行完毕，查看执行结果：
SELECT * FROM person WHERE id=10;
-- 【例7.11】在person表中，使用DELETE语句同时删除多条记录，在前面UPDATE语句中将age字段值在19到22之间的记录的info字段值修改为student，在这里删除这些记录。
-- 执行删除操作前使用SELECT语句查看当前的数据：
SELECT * FROM person WHERE age BETWEEN 19 AND 22;
-- 可以看到，这些age字段值在19到22之间的记录存在表中。下面使用DELETE删除这些记录：
DELETE FROM person WHERE age BETWEEN 19 AND 22;
-- 语句执行完毕，查看执行结果：
SELECT * FROM person WHERE age BETWEEN 19 AND 22;
-- 查询结果为空，删除多条记录成功。/
-- 【例7.12】删除person表中所有记录。
-- 执行删除操作前使用SELECT语句查看当前的数据：
SELECT * FROM person;
-- 结果显示person表中还有5条记录，执行DELETE语句删除这5条记录：
DELETE FROM person;
-- 语句执行完毕，查看执行结果：
SELECT * FROM person;
