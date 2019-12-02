-- 创建触发器

-- 【例11.1】创建一个触发器，使得每次该表有新数据insert时，其中的一个时间字段uptime自动变更为当前时间。
-- 首先创建一个用于测试的数据表，SQL语句如下：
CREATE TABLE timedb (uid INTEGER,gid INTEGER,uptime timestamp with time zone);
-- 创建一个自定义触发器函数，此函数的主要是为了更新当前时间。创建的SQL语句如下：
CREATE  FUNCTION func_timedb() RETURNS trigger AS $func_timedb$
    BEGIN
        If (TG_OP = 'UPDATE') THEN
            If NEW.uptime = OLD.uptime Then
                return null;
            END IF;
        END IF;
        update timedb set uptime = NOW() where uid = NEW.uid and gid = NEW.gid;
        return null;
    END;
$func_timedb$ LANGUAGE plpgsql;
-- 创建触发器，SQL语句如下：
CREATE TRIGGER timedb _updateTime AFTER INSERT ON timedb
    FOR EACH ROW EXECUTE PROCEDURE func_timedb ();
-- 下面开始检验触发器是否创建成功，插入数据，SQL语句如下：
INSERT INTO timedb VALUES(1,3);
-- 查询表中的数据，SQL语句如下：
SELECT * FROM timedb;

-- 触发器的使用

-- 【例11.2】创建一个account表，然后创建一个触发器，用于检测表account的列name的插入数据是否为空。如果为空，将弹出错误提示。
-- 首先创建用于测试的数据库，包含两个字段id和name，SQL语句如下：
CREATE TABLE account
(
id int,
name char(20)
) ;
-- 创建触发器函数，主要为了检测插入的name字段的数据是否为空，SQL语句如下：
CREATE FUNCTION account_stam() RETURNS trigger AS $account_stam$
    BEGIN
        IF NEW.name IS NULL THEN
            RAISE EXCEPTION 'name 字段不能为空值';
        END IF;
     END;
$account_stam$ LANGUAGE plpgsql;
-- 创建一个BEFORE触发器，SQL语句如下：
CREATE TRIGGER account_stamp BEFORE INSERT ON account
    FOR EACH ROW EXECUTE PROCEDURE account_stam();
-- 触发器创建后，检测是否成功。插入数据，name字段为空数据，SQL语句如下。
INSERT INTO account VALUES(10);

-- 删除触发器

-- 【例11.3】删除一个触发器，代码如下：
DROP TRIGGER timedb_updateTime ON timedb;
