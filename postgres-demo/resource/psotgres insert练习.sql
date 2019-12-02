CREATE TABLE tmp1 (x SMALLINT, y INT, z BIGINT );
CREATE TABLE tmp2 (x FLOAT(5),  y REAL,  z DOUBLE PRECISION );
CREATE TABLE tmp3 ( x NUMERIC (5,1), y NUMERIC (5,2));
INSERT INTO tmp3 VALUES(9.12, 9.15);
CREATE TABLE tmp4( t TIME );
INSERT INTO tmp4 values('10:05:05 '), ('23:23');
INSERT INTO tmp4 values('101112');
ALTER TABLE tmp4 ALTER COLUMN t TYPE time without time zone;
DELETE FROM tmp4;
INSERT INTO tmp4 values (CURRENT_TIME) ,(NOW());
CREATE TABLE tmp5(d DATE);
INSERT INTO tmp5 values('1998-08-08'),('19980808'),('20101010');
DELETE FROM tmp5;
INSERT INTO tmp5 values('99-09-09'),( '990909'), ( '000101') ,( '121212');
INSERT INTO tmp5 values(NOW() );

---TIMESTAMP的日期格式为YYYY-MM-DD HH:MM:SS。在存储时需要8个字节---
CREATE TABLE tmp6( ts TIMESTAMP);
INSERT INTO tmp6 values ('1996-02-02 02:02:02'),( NOW() );

CREATE TABLE tmp7( t TIME with time zone);
INSERT INTO tmp7 values('10:05:05 PST '), ('10:05:05');

CREATE TABLE tmp8(
ch  CHARACTER (4),  
vch CHARACTER VARYING (4)
);
INSERT INTO tmp8 VALUES('ab', 'ab'),
('abcd', 'abcd'),
('ab  ', 'ab  ');

CREATE TABLE tmp11( b BOOLEAN );
INSERT INTO tmp11 VALUES(TRUE),(FALSE),('y'),('no'),('0');

CREATE TABLE tmp12( bt int[]);
INSERT INTO tmp12 VALUES('{{1,1,1},{2,2,2},{3,3,3}}');
INSERT INTO tmp12 VALUES('{1,2,3}');

CREATE TABLE tmp14 ( num INT);
INSERT INTO tmp14 VALUES (64);

-- 【例5.19】使用“=”进行相等判断，SQL语句如下：
SELECT 1=0, '2'=2, 2=2,'b'='b', (1+3) = (2+1),NULL=NULL;
-- 【例5.20】使用‘<>’和‘!=’进行不相等的判断，SQL语句如下：
SELECT 'good'<>'god', 1<>2, 4!=4, 5.5!=5, (1+3)!=(2+1),NULL<>NULL;
-- 【例5.21】使用‘<=’进行比较判断，SQL语句如下：
SELECT 'good'<='god', 1<=2, 4<=4, 5.5<=5, (1+3) <= (2+1),NULL<=NULL;
-- 【例5.22】使用‘<’进行比较判断，SQL语句如下：
SELECT 'good'<'god', 1<2, 4<4, 5.5<5, (1+3) < (2+1),NULL<NULL;
-- 【例5.23】使用‘>=’进行比较判断，SQL语句如下：
SELECT 'good'>='god', 1>=2, 4>=4, 5.5>=5, (1+3) >= (2+1),NULL>=NULL;
-- 【例5.24】使用‘>’进行比较判断，SQL语句如下：
SELECT 'good'>'god', 1>2, 4>4, 5.5>5, (1+3) > (2+1),NULL>NULL;
-- 【例5.25】使用BETWEEN AND 进行值区间判断，输入SQL语句如下：
SELECT 4 BETWEEN 2 AND 5, 4 BETWEEN 4 AND 6,12 BETWEEN 9 AND 10;
-- 【例5.26】使用BETWEEN AND 进行字符串的比较，输入SQL语句如下：
SELECT  'x' BETWEEN 'f' AND 'g', 'b' BETWEEN 'a' AND 'c';
-- 【例5.27】使用LEAST运算符进行大小判断，SQL语句如下：
SELECT least(2,0), least(20.0,3.0,100.5), least('a','c','b'),least(10,NULL);
-- 【例5.28】使用GREATEST运算符进行大小判断，SQL语句如下：
SELECT greatest(2,0), greatest(20.0,3.0,100.5), greatest('a','c','b'),greatest(10,NULL);
-- 【例5.29】使用NOT IN运算符进行判断，SQL语句如下：
SELECT 2 IN (1,3,5,'thks'), 'thks' IN (1,3,5,'thks');
-- 例5.30】使用NOT IN运算符进行判断，SQL语句如下：
SELECT 2 NOT IN (1,3,5,'thks'), 'thks' NOT IN (1,3,5,'thks');
-- 【例5.31】存在NULL值时的IN运算，SQL语句如下：
SELECT NULL IN (1,3,5,'thks'),10 IN (1,3,NULL,'thks');
-- 【例5.32】使用运算符LIKE进行字符串匹配运算，SQL语句如下：
SELECT 'stud' LIKE 'stud', 'stud' LIKE 'stu_','stud' LIKE '%d','stud' LIKE 't___', 's' LIKE NULL;
-- 【例5.33】分别使用非运算符“NOT”进行逻辑判断，SQL语句如下：
SELECT NOT '1', NOT 'y', NOT '0',  NOT NULL, NOT 'n';
-- 【例5.34】分别使用与运算符“AND”进行逻辑判断，SQL语句如下：
SELECT  '1'AND 'y','1'AND '0','1'AND NULL, '0'AND NULL;
-- 【例5.35】使用或运算符“OR”进行逻辑判断，SQL语句如下：
SELECT  '1' OR 't' OR '0', '1'OR 'y','1' OR NULL, '0'OR NULL, NULL OR NULL;
D NULL, '0'AND NULL
---查询---
SELECT * FROM tmp3;
SELECT * FROM tmp4;
SELECT * FROM tmp6;
SELECT * FROM tmp7;
SELECT * FROM tmp8;
SELECT * FROM tmp11;
SELECT * FROM tmp12;
---查询--
SELECT concat('(', ch, ')'), concat('(',vch,')') FROM tmp8;

SELECT num, num+10, num-10, num+5-3, num+36.5 FROM tmp14;
SELECT num, num *2, num /2, num/3, num%3 FROM tmp14;
SELECT num, num / 0, num %0 FROM tmp14;
SELECT 1=0, '2'=2, 2=2,'b'='b', (1+3) = (2+1),NULL=NULL;