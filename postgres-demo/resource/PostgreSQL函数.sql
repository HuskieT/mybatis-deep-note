-- 数学函数
-- 【例6.1】求2，-3.3和-33的绝对值，输入语句如下：
SELECT ABS(2), ABS(-3.3), ABS(-33);
-- 【例6.2】返回圆周率值，输入语句如下：
SELECT pi();
-- 【例6.3】求9，40和-49的二次平方根，输入语句如下：
SELECT SQRT(9), SQRT(40);
-- 【例6.4】对MOD(31,8)，MOD(234, 10)，MOD(45.5,6)进行求余运算，输入语句如下：
SELECT MOD(31,8),MOD(234, 10),MOD(45.5,6);
-- 【例6.5】使用CEIL和CEILING函数返回最小整数，输入语句如下：
SELECT  CEIL(-3.35),CEILING(3.35);
-- FLOOR(x)返回不大于x的最大整数值，返回值转化为一个BIGINT。
-- 【例6.6】使用FLOOR函数返回最大整数，输入语句如下：
SELECT FLOOR(-3.35), FLOOR(3.35);
-- 【例6.7】使用ROUND(x)函数对操作数进行四舍五入操作，输入语句如下：
SELECT ROUND(-1.14),ROUND(-1.67), ROUND(1.14),ROUND(1.66);
-- 【例6.8】使用ROUND(x,y)函数对操作数进行四舍五入操作，结果保留小数点后面指定y位，输入语句如下：
SELECT ROUND(1.38, 1), ROUND(1.38, 0), ROUND(232.38, -1), ROUND (232.38,-2);
-- 【例6.9】使用SIGN函数返回参数的符号，输入语句如下：
 SELECT SIGN(-21),SIGN(0), SIGN(21);
-- 【例6.10】使用POW和POWER函数进行乘方运算，输入语句如下：
 SELECT POW(2,2), POWER(2,2),POW(2,-2), POWER(2,-2);
-- 【例6.11】使用EXP函数计算e的乘方，输入语句如下：
SELECT EXP(3),EXP(-3),EXP(0);
-- 【例6.12】使用LOG(x)函数计算自然对数，输入语句如下：
SELECT LOG(3);
-- 【例6.13】使用RADIANS将角度转换为弧度，输入语句如下：
SELECT RADIANS(90),RADIANS(180);
-- 【例6.14】使用DEGREES将弧度转换为角度，输入语句如下：
SELECT DEGREES(PI()), DEGREES(PI() / 2);
-- 【例6.15】使用SIN函数计算正弦值，输入语句如下：
SELECT SIN(1), ROUND(SIN(PI()));
-- 【例6.16】使用ASIN函数计算反正弦值，输入语句如下：
SELECT ASIN(0.8414709848078965);
-- 【例6.17】使用COS函数计算余弦值，输入语句如下：
SELECT COS(0),COS(PI()),COS(1);
-- 【例6.18】使用ACOS计算反余弦值，输入语句如下：
SELECT ACOS(1),ACOS(0), ROUND(ACOS(0.5403023058681398));
-- 【例6.19】使用TAN函数计算正切值，输入语句如下：
SELECT TAN(0.3), ROUND(TAN(PI()/4));
-- 【例6.20】使用ATAN函数计算反正切值，输入语句如下：
SELECT ATAN(0.30933624960962325), ATAN(1);
-- 【例6.21】使用COT()函数计算正切值，输入语句如下，
SELECT COT(0.3), 1/TAN(0.3),COT(PI() / 4);

-- 字符串函数
-- 【例6.21】使用CHAR_LENGTH函数计算字符串字符个数，输入语句如下：
SELECT CHAR_LENGTH('date'), CHAR_LENGTH('egg');
-- 【例6.23】使用LENGTH函数计算字符串长度，输入语句如下：
SELECT LENGTH('date'), LENGTH('egg');
-- 语句执行后结果如图6-23所示。
-- 【例6.24】使用CONCAT函数连接字符串，输入语句如下
SELECT CONCAT('PostgreSQL', '9.15'),CONCAT('Postgre',NULL, 'SQL');
-- 【例6.25】使用CONCAT_WS函数连接带分隔符的字符串，输入语句如下：
SELECT CONCAT_WS('-', '1st','2nd', '3rd'), CONCAT_WS('*', '1st', NULL, '3rd');
-- 【例6.26】使用LEFT函数返回字符串中左边的字符，输入语句如下：
SELECT LEFT('football', 5);
-- 【例6.27】使用RIGHT函数返回字符串中右边的字符，输入语句如下：
SELECT RIGHT('football', 4);
-- 【例6.28】使用LPAD函数对字符串进行填充操作，输入语句如下：
-- 对字符串左边进行某类字符自动填充直至达到指定长度
SELECT LPAD('hello',4,'??'), LPAD('hello',10,'??');
-- 【例6.29】使用LPAD函数对字符串进行填充操作，输入语句如下：
SELECT RPAD('hello',4,'?'), RPAD('hello',10,'?');
-- 【例6.30】使用LTRIM函数删除字符串左边的空格，输入语句如下：
SELECT '(  book  )',CONCAT('(',LTRIM('  book  '),')');
-- 【例6.31】使用RTRIM函数删除字符串右边的空格，输入语句如下：
SELECT '(  book  )',CONCAT('(', RTRIM ('  book  '),')');
-- 【例6.32】使用TRIM函数删除指定字符串两端的空格，输入语句如下：
SELECT '(  book  )',CONCAT('(', TRIM('  book  '),')');
-- 【例6.33】使用TRIM(s1 FROM s)函数删除字符串中两端指定的字符，输入语句如下：
SELECT TRIM('xy' FROM 'xyboxyokxyxy') ;
-- 【例6.34】使用REPEAT函数重复生成相同的字符串，输入语句如下：
SELECT REPEAT('PostgreSQL', 3);
-- 【例6.35】使用REPLACE函数进行字符串替代操作，输入语句如下：
-- 将x替换为w
SELECT REPLACE('xxx.PostgreSQL.com', 'x', 'w');
-- 【例6.36】使用SUBSTRING函数获取指定位置处的子字符串，输入语句如下：
SELECT SUBSTRING('breakfast',5) AS col1,
SUBSTRING('breakfast',5,3) AS col2,
 SUBSTRING('lunch', -3) AS col3;
-- 【例6.37】使用POSITION函数查找字符串中指定子字符串的开始位置，输入语句如下：
SELECT POSITION('ball'IN 'football');
-- 【例6.38】使用REVERSE函数反转字符串，输入语句如下：
SELECT REVERSE('abc');

-- 日期和时间函数

-- 【例6.39】使用日期函数获取系统当期日期，输入语句如下：
SELECT CURRENT_DATE;
-- 【例6.40】使用时间函数获取系统当期日期，输入语句如下：
SELECT CURRENT_TIME;
-- 【例6.41】使用时间函数获取系统当期日期，输入语句如下：
SELECT LOCALTIME;
-- 【例6.42】使用日期时间函数获取当前系统日期和时间，输入语句如下：
SELECT CURRENT_TIMESTAMP,LOCALTIMESTAMP,NOW();
-- 【例6.43】使用EXTRACT函数从月份中提取日期，输入语句如下：
SELECT EXTRACT(DAY FROM TIMESTAMP '2012-09-10 10:18:40');
-- 【例6.44】使用EXTRACT函数从月份中提取月份，输入语句如下：
SELECT EXTRACT(MONTH FROM TIMESTAMP '2012-09-10 10:18:40');
-- 【例6.45】使用EXTRACT函数从月份中提取年份，输入语句如下：
SELECT EXTRACT(YEAR FROM TIMESTAMP '2012-09-10 10:18:40');
-- 【例6.46】使用EXTRACT函数查询指定日期是一年中的第几天，输入语句如下：
SELECT EXTRACT(DOY FROM TIMESTAMP '2012-09-10 10:18:40');
-- 【例6.47】使用EXTRACT函数查询指定日期是一周中的星期几，输入语句如下：
SELECT EXTRACT(DOW FROM TIMESTAMP '2012-09-10 10:18:40');
-- 【例6.48】使用EXTRACT函数查询指定日期是该年的第几季度(1-4)，输入语句如下：
SELECT EXTRACT(QUARTER FROM TIMESTAMP '2012-09-10 10:18:40');
-- 【例6.50】 计算指定日期加上间隔小时后的结果，输入语句如下：、
SELECT DATE '2012-09-28' + interval '3 hour';
-- 【例6.51】 计算指定日期加上指定时间后的结果，输入语句如下：、
SELECT DATE '2012-09-28' + time '06:00';
-- 【例6.52】 计算指定日期和时间加上间隔时间后的结果，输入语句如下：
SELECT TIMESTAMP '2012-09-28 02:00:00' + interval '10 hours';
-- 【例6.53】 计算指定日期之间的间隔天数，输入语句如下：、
SELECT date '2012-11-01' - date '2012-09-10';
-- 【例6.54】 计算指定日期减去间隔天数后的结果，输入语句如下：
SELECT DATE '2012-09-28' - integer '10';
-- 【例6.55】 计算整数与天数相乘的结果，输入语句如下：
SELECT 15 * interval '2 day';
-- 【例6.56】 计算整数与秒数相乘的结果，输入语句如下：
SELECT 50 * interval '2 second';
-- 【例6.57】 计算小时数与整数相乘的结果，输入语句如下：
SELECT interval '1 hour' / integer  '2';


-- 条件判断函数

-- 【例6.58】使用CASE value WHEN语句执行分支操作，输入语句如下：
SELECT CASE 2 WHEN 1 THEN 'one' WHEN 2 THEN 'two' ELSE 'more' END;
-- 【例6.59】使用CASE WHEN语句执行分支操作，输入语句如下：
SELECT CASE WHEN 1<0 THEN 'true' ELSE 'false' END;


-- 系统信息函数

-- 【例6.60】查看当前PostgreSQL版本号，输入语句如下：
SELECT VERSION();
-- 【例6.61】获取当前登陆用户名称，输入语句如下：
SELECT USER, CURRENT_USER;

-- 加密函数
-- 【例6.62】使用MD5函数加密字符串，输入语句如下：
SELECT MD5 ('mypwd');
-- 【例6.63】使用ENCODE加密字符串，输入语句如下：
SELECT ENCODE('secret','hex'), LENGTH(ENCODE('secret','hex'));
-- 【例6.64】使用DECODE函数解密被ENCODE加密的字符串，输入语句如下：
SELECT DECODE(ENCODE('secret','hex'),'hex');

-- 改变数据类型的函数
-- 【例6.65】使用CAST函数进行数据类型的转换，SQL语句如下：
SELECT CAST(100 AS CHAR(2));
