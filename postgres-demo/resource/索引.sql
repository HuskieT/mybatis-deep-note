-- 【例9.1】在book表中的bookname字段上建立名为bknameidx的普通索引，SQL语句如下：
CREATE INDEX bknameidx ON book(bookname);
-- 语句执行完毕之后，将在book表中创建名称为bknameidx的普通索引。读者可以在对象浏览器中查看book表中的索引。如图9-6所示。
-- 【例9.2】在book表的bookId字段上建立名称为uniqididx 的唯一索引，SQL语句如下：
CREATE UNIQUE INDEX uniqididx  ON book ( bookId );
-- 【例9.3】在book表的comment字段上建立单列索引，SQL语句如下：
CREATE INDEX Bkcmtidx ON book(comment);
-- 语句执行完毕之后，将在book表的comment字段上建立一个名为bkcmtidx的单列索引。如图9-8所示。

-- 【例9.4】在book表的authors和info字段上建立组合索引，SQL语句如下：
CREATE INDEX bkauandinfoidx ON book ( authors,info);
-- 【例9.5】将上面修改的索引名称重新修改过来，SQL语句如下：
ALTER INDEX public.bkauandinfoidxx RENAME TO bkauandinfoidx;
-- 【例9.6】删除book表中名称为bkauandinfoidx的组合索引，SQL语句如下：
DROP INDEX bkauandinfoidx;

