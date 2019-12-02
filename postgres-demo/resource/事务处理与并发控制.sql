-- 【例12.1】向person表插入3条学生记录，此时发现是不应该插入的，进行回滚操作。
-- 首先，查看stu_info表中当前的记录，查询语句如下。
SELECT * FROM person;
-- 可以看到当前表中有2条记录，接下来输入下面的事务语句。
BEGIN;
INSERT INTO person VALUES(1003,'路飞',80,'10456354');
INSERT INTO person VALUES(1004,'张露',85,'56423424');
INSERT INTO person VALUES(1005,'魏波',70, '41242774');
ROLLBACK TRANSACTION;
COMMIT;
-- 【例12.2】有一个现成的表person，判断此表，如果有外键，则在插入数据时使用SHARE（共享锁），事务如下：
BEGIN;
LOCK TABLE person IN SHARE MODE;
SELECT id FROM person
    WHERE name = 'Star Wars: Episode I - The Phantom Menace';
-- 如果记录没有返回则ROLLBACK
INSERT INTO person_user_comments VALUES
    (_id_, 'GREAT! I was waiting for it for so long!');
COMMIT;
-- 【例12.3】如果一个表含有主键，则在删除时，进行SHARE ROW EXCLUSIVE（共享行排他锁）操作。事务如下：
BEGIN;
LOCK TABLE person IN SHARE ROW EXCLUSIVE MODE;
DELETE FROM person_user_comments WHERE id IN
    (SELECT id FROM films WHERE rating < 5);
DELETE FROM person WHERE rating < 5;
COMMIT
