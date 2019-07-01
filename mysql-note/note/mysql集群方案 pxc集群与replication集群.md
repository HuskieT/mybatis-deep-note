# mysql 集群方案

#参考

#简介
[1]
pxc集群  适合数据价值高、强一致性的场景(如：账户 订单 财务)
replication集群： 速度快 弱一致性   （如：日志 新闻 帖子）

[2]
mysql  perconaServer MariaDB
#详解
[1]
pxc集群: 同步复制，事务在所有集群节点要么同时提交 要么同时不提交，强一致性
replication: 采用异步复制，无法保证数据的一直性

**pxc集群 基于mysql的Galera技术**





















