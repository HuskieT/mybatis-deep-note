-- 基本查询语句
-- 首先定义数据表，
CREATE TABLE fruits
(
f_id    char(10)      NOT NULL,
s_id    INT            NOT NULL,
f_name  char(255)     NOT NULL,
f_price decimal(8,2)  NOT NULL,
PRIMARY KEY(f_id)
);
-- 为了演示如何使用SELECT语句，需要插入数据，请读者插入如下数据：
INSERT INTO fruits (f_id, s_id, f_name, f_price)
    VALUES('a1', 101,'apple',5.2),
    ('b1',101,'blackberry', 10.2),
    ('bs1',102,'orange', 11.2),
    ('bs2',105,'melon',8.2),
    ('t1',102,'banana', 10.3),
    ('t2',102,'grape', 5.3),
    ('o2',103,'coconut', 9.2),
    ('c0',101,'cherry', 3.2),
    ('a2',103, 'apricot',2.2),
    ('l2',104,'lemon', 6.4),
    ('b2',104,'berry', 8.6),
    ('m1',106,'mango', 15.6),
    ('m2',105,'xbabay', 2.6),
    ('t4',107,'xbababa', 3.6),
    ('m3',105,'xxtt', 11.6),
    ('b5',107,'xxxx', 3.6);
-- 使用SELECT语句查询f_id和f_name字段的数据。SQL语句如下：
SELECT f_id, f_name FROM fruits;


-- 【例8.8】查询所有s_id不等于101也不等于102的记录，SQL语句如下：
SELECT s_id,f_name, f_price
FROM fruits
WHERE s_id NOT IN (101,102)
ORDER BY f_name;

-- 【例8.10】查询价格在2.00元到10.5元之外的水果名称和价格，SQL语句如下：
SELECT f_name, f_price
FROM fruits
WHERE f_price NOT BETWEEN 2.00 AND 10.20;
-- 【例8.11】查找所有以‘b’字母开头的水果，SQL语句如下：
SELECT f_id, f_name
FROM fruits
WHERE f_name LIKE 'b%';
-- 【例8.12】在fruits表中，查询f_name中包含字母‘g’的记录，SQL语句如下：
SELECT f_id, f_name
FROM fruits
WHERE f_name LIKE '%g%';

-- 【例8.19】查询fruits表中s_id字段的值，并返回s_id字段值不得重复，SQL语句如下：
SELECT DISTINCT s_id FROM fruits;

-- 【例8.24】根据s_id对fruits表中的数据进行分组，SQL语句如下：
SELECT s_id, COUNT(*) AS Total FROM fruits GROUP BY s_id;
-- 【例8.25】根据s_id对fruits表中的数据进行分组，并显示水果种类大于1的分组信息，SQL语句如下：
SELECT s_id,COUNT(f_name)
FROM fruits
GROUP BY s_id HAVING COUNT(f_name)>1;
-- 【例8.26】根据s_id对fruits表中的数据进行分组，显示水果种类大于1的分组信息，并按照水果的种类排序，SQL语句如下：
SELECT s_id,COUNT(f_name)
FROM fruits
GROUP BY s_id HAVING COUNT(f_name)>1
ORDER BY COUNT(f_name);
-- 【例8.28】在fruits表中，使用LIMIT子句，返回从第5个记录开始的，行数长度为3的记录，SQL语句如下：
SELECT * From fruits LIMIT 3 OFFSET 4;

-- 连接查询


-- 在做外连接查询的案例之前，在数据库中创建数据表orders，SQL语句如下：
CREATE TABLE orders
(
o_num    INT   NULL,
o_date   DATE   NOT NULL,
c_id   varchar(50)    NOT NULL);
-- 为了演示需要插入数据，请读者执行以下语句：
INSERT INTO orders (o_num, o_date, c_id)
VALUES
(30001,'2008-09-01 00:00:00', '10001'),
(30002,'2008-09-12 00:00:00', '10003'),
(30003,'2008-09-30 00:00:00', '10004'),
(NULL,'2008-10-03 00:00:00', '10002'),
(30004,'2008-10-03 00:00:00', 'NULL'),
(30005,'2008-10-08 00:00:00', '10001');
-- 【例8.44】在customers表和orders表中，查询所有客户，包括没有订单的客户，SQL语句如下：
SELECT customers.c_id, orders.o_num
       FROM customers LEFT OUTER JOIN orders
       ON customers.c_id = orders.c_id;
-- 【例8.45】在customers表和orders表中，查询所有订单，包括没有客户的订单，SQL语句如下：
SELECT customers.c_id, orders.o_num
       FROM customers RIGHT OUTER JOIN orders
       ON customers.c_id = orders.c_id;
-- 【例8.46】在customers表和orders表中，使用INNER JOIN语法查询customers表中ID为10001的客户的订单信息，SQL语句如下：
SELECT customers.c_id, orders.o_num
       FROM customers INNER JOIN orders
       ON customers.c_id = orders.c_id AND customers.c_id ='10001';
-- 【例8.47】在fruits表和suppliers表之间使用INNER JOIN语法进行内连接查询，并对查询结果排序，SQL语句如下：
SELECT suppliers.s_id, s_name,f_name, f_price
       FROM fruits INNER JOIN suppliers
       ON fruits.s_id = suppliers.s_id
       ORDER BY fruits.s_id;

-- 子查询
-- 下面定义两个表tb1和tb2
CREATE table tbl1 ( num1 INT NOT NULL);
CREATE table tbl2 ( num2 INT NOT NULL);
-- 分别向两个表中插入数据，
INSERT INTO tbl1 values(1), (5), (13), (27);
INSERT INTO tbl2 values(6), (14), (11), (20);
-- ANY关键字接在一个比较操作符的后面，表示与子查询返回的任何值比较为TRUE，则返回TRUE。
-- 【例8.48】返回tbl2表的所有num2列，然后将tbl1中的num1的值与之进行比较，只要大于num2的任何值为符合查询条件的结果。
SELECT num1 FROM tbl1 WHERE num1 > ANY (SELECT num2 FROM tbl2);
-- 【例8.49】返回tbl1表的中比tbl2表num2 列所有值都大的值，SQL语句如下：
SELECT num1 FROM tbl1 WHERE num1 > ALL (SELECT num2 FROM tbl2);
-- 【例8.50】查询表suppliers表中是否存在s_id=107的供应商，如果存在则查询fruits表中的记录，SQL语句如下：
SELECT * FROM fruits
       WHERE EXISTS
       (SELECT s_name FROM suppliers WHERE s_id = 107);
-- 【例8.51】查询表suppliers表中是否存在s_id=107的供应商，如果存在则查询fruits表中的f_price大于10.20的记录，SQL语句如下：
SELECT * FROM fruits
       WHERE f_price>10.20 AND EXISTS
       (SELECT s_name FROM suppliers WHERE s_id = 107);
-- 【例8.52】查询表suppliers表中是否存在s_id=107的供应商，如果不存在则查询fruits表中的记录，SQL语句如下：
SELECT * FROM fruits
       WHERE NOT EXISTS
       (SELECT s_name FROM suppliers WHERE s_id = 107);
-- 【例8.53】在customers表中查询c_name=“RedHook”的客户ID(c_id)，并根据c_id查询订单号o_num，SQL语句如下：
SELECT o_num FROM orders WHERE c_id IN
       (SELECT c_id  FROM customers WHERE c_name='RedHook');
-- 【例8.54】与前一个例子语句类似，但是在SELECT语句中使用NOT IN操作符，SQL语句如下：
SELECT o_num FROM orders WHERE c_id NOT IN
       (SELECT c_id  FROM customers WHERE c_name='RedHook');
-- 语句执行后结果如图8-61所示。
-- 【例8.55】在suppliers表中查询s_city等于“Tianjin”的供应商s_id，然后在fruits表中查询所有该供应商提供的水果的种类，SQL语句如下：
SELECT s_id, f_name FROM fruits
WHERE s_id =
(SELECT s1.s_id FROM suppliers AS s1 WHERE s1.s_city = 'Tianjin');
-- 该嵌套查询首先在suppliers表中查找s_city等于Tianjin的供应商的s_id，单独执行子查询查看s_id的值，执行下面的操作过程：
SELECT s1.s_id FROM suppliers AS s1 WHERE s1.s_city = 'Tianjin';
-- 然后在外层查询时，在fruits表中查找s_id等于101的供应商提供的水果的种类，SQL语句如下：
SELECT s_id, f_name FROM fruits
       WHERE s_id =
       (SELECT s1.s_id FROM suppliers AS s1 WHERE s1.s_city = 'Tianjin');
-- 【例8.56】在suppliers表中查询s_city等于“Tianjin”的供应商s_id，然后在fruits表中查询所有非该供应商提供的水果的种类，SQL语句如下：
SELECT s_id, f_name FROM fruits
       WHERE s_id <>
       (SELECT s1.s_id FROM suppliers AS s1 WHERE s1.s_city = 'Tianjin');
合并查询结果

-- 【例8.57】查询所有价格小于9的水果的信息，查询s_id等于101和103所有的水果的信息，使用UNION连接查询结果，SQL语句如下：
SELECT s_id, f_name, f_price
FROM fruits
WHERE f_price < 9.0
UNION
SELECT s_id, f_name, f_price
FROM fruits
WHERE s_id IN(101,103);
-- 如前所述，UNION将多个SELECT语句的结果组合成一个结果集合。可以分开查看每个SELECT语句的结果。第1个SELECT语句如下：
SELECT s_id, f_name, f_price
       FROM fruits
       WHERE f_price < 9.0;
-- 第2个SELECT语句如下：
SELECT s_id, f_name, f_price
       FROM fruits
       WHERE s_id IN(101,103);
-- 【例8.58】查询所有价格小于9的水果的信息，查询s_id等于101和103所有的水果的信息，使用UNION ALL连接查询结果，SQL语句如下：
SELECT s_id, f_name, f_price
FROM fruits
WHERE f_price < 9.0
UNION ALL
SELECT s_id, f_name, f_price
FROM fruits
WHERE s_id IN(101,103);

-- 为表和字段取别名

-- 使用正则表达式查询

-- 【例8.63】在fruits表中，查询f_name字段以字母‘b’开头的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ '^b';
-- 【例8.64】在fruits表中，查询f_name字段以“be”开头的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ '^be';
-- 【例8.65】在fruits表中，查询f_name字段以字母‘t’结尾的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ 't';
-- fruits表中有3条记录的f_name字段值是以字母‘t’结尾，返回结果有3条记录。
-- 【例8.66】在fruits表中，查询f_name字段以字符串“rry”结尾的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ 'rry';
-- 【例8.67】在fruits表中，查询f_name字段值包含字母‘a’与‘g’且两个字母之间只有一个字母的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ 'a.g';
-- 星号‘*’匹配前面的字符任意多次，包括0次。加号‘+’匹配前面的字符至少一次。
-- 【例8.68】在fruits表中，查询f_name字段值以字母‘b’开头，且‘b’后面出现字母‘a’的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ '^ba*';
-- 【例8.69】在fruits表中，查询f_name字段值以字母‘b’开头，且‘b’后面出现字母‘a’至少一次的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ '^ba+';
-- 【例8.70】在fruits表中，查询f_name字段值包含字符串“on”的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ 'on';
-- 【例8.71】在fruits表中，查询f_name字段值包含字符串“on”或者“ap”的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ 'on|ap';
-- 【例8.72】在fruits表中，使用LIKE运算符查询f_name字段值为“on”的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name LIKE 'on';
-- 【例8.73】在fruits表中，查找f_name字段中包含字母‘o’或者‘t’的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ '[ot]';
-- 【例8.74】在fruits表中，查询f_id字段不包含字母a到e或数字1到2的字符的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_id !~ '[a-e1-2]';
-- 【例8.75】在fruits表中，查询f_name字段值出现字母‘x’至少2次的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ 'x{2,}';
-- 【例8.76】在fruits表中，查询f_name字段值出现字符串“ba”最少1次，最多3次的记录，SQL语句如下：
SELECT * FROM fruits WHERE f_name ~ 'ba{1,3}';
