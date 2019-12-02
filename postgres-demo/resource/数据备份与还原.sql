-- 【例14.1】备份test数据库中的tb_emp表和tb_emp2表，输入语句如下：
pg_dump -U postgres -t tb_emp -t tb_emp2 -f C:\abc\test_backup2 test
-- 【例14.2】使用pg_dumpall备份所有的数据库，其操作和pg_dump类似，这里不再重述，输入语句如下：
pg_dumpall -U postgres -f C:\abc\dball_backup
-- 【例14.3】将www.abc.com主机上的PostgreSQL数据库全部迁移到www.bcd.com主机上。在www.abc.com主机上执行的命令如下：
pg_dump -U postgres –h www.bac.com -f C:\abc\test1_backup