DROP TABLE IF EXISTS t_user;
DROP TABLE IF EXISTS t_role;

CREATE TABLE t_user
(
  id      BIGINT (20) NOT NULL COMMENT '主键ID',
  name    VARCHAR(30) NOT NULL COMMENT '姓名',
  age     INT (11) NOT NULL COMMENT '年龄',
  email   VARCHAR(50) NOT NULL COMMENT '邮箱',
  role_id BIGINT (20) NOT NULL COMMENT '角色ID',
  password VARCHAR(500) NOT NULL  COMMENT '密码',
  PRIMARY KEY (id)
);

CREATE TABLE t_role
(
  id            BIGINT (20) NOT NULL COMMENT '主键ID',
  role_name     VARCHAR(30) NOT NULL COMMENT '角色名',
  role_describe VARCHAR(30) NOT NULL COMMENT '角色描述',
  create_time   datetime  NOT NULL  COMMENT '创建时间',
  PRIMARY KEY (id)
);

DELETE FROM t_user;
DELETE FROM t_role;

INSERT INTO t_role (id, role_name, role_describe,create_time)
VALUES (1, '管理员', 'boos 级别','2018-04-16 11-33-00'),
       (2, '用户', '就是个普通人','2018-03-12 11-33-00'),
       (3, '程序猿', '偶尔需要用来祭天','2019-03-16 11-33-00');

INSERT INTO t_user (id, name, age, email, role_id,password)
VALUES (1, 'Jone', 18, 'test1@baomidou.com', 1,"54s1d5fa1"),
       (2, 'Jack', 20, 'test2@baomidou.com', 2,"54swefw5fa1"),
       (3, 'Tom', 28, 'test3@baomidou.com', 2,"54s1d5fa1"),
       (4, 'Sandy', 21, 'test4@baomidou.com', 3,"54s1d5fa1"),
       (5, 'Billie', 24, 'test5@baomidou.com', 3,"54s1d5fa1"),
       (6, 'Jack', 20, 'test2@baomidou.com', 3,"54s1ddffa1"),
       (7, 'Jack', 20, 'test2@baomidou.com', 3,"54s1d5fa1"),
       (8, 'Jack', 20, 'test2@baomidou.com', 3,"54s1d5df1"),
       (9, 'Jack', 20, 'test2@baomidou.com', 3,"54s1d5fa1"),
       (10, 'Jack', 20, 'test2@baomidou.com', 3,"54s1d5fa1"),
       (11, 'Jack', 20, 'test2@baomidou.com', 3,"54s1d5fa1"),
       (12, 'Jack', 20, 'test2@baomidou.com', 3,"54s1d5fa1"),
       (13, 'Jack', 20, 'test2@baomidou.com', 3,"54s1d5fa1"),
       (14, 'Jack', 20, 'test2@baomidou.com', 3,"54sasdg5fa1"),
       (15, 'Tom', 28, 'test3@baomidou.com', 3,"54s1d5fa1"),
       (16, 'Sandy', 21, 'test4@baomidou.com', 3,"54seeefa1"),
       (17, 'Billie', 24, 'test5@baomidou.com', 3,"54s1d5fa1");
