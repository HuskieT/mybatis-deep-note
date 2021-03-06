# postgresSQL 记录

## 参考

## 简介
[1] 从应用场景来说，PG更加适合严格的企业应用场景（比如金融、电信、ERP、CRM），而MySQL更加适合业务逻辑相对简单、数据可靠性要求较低的互联网场景（比如google、facebook、alibaba）

[2]  一个用户一般对应一个schema，该用户的schema名等于用户名，并作为该用户缺省schema。这也就是我们在企业管理器的方案下看到schema名都为数据库用户名的原因
    一个用户有一个缺省的schema，其schema名就等于用户名，当然一个用户还可以使用其他的schema。如果我们访问一个表时，没有指明该表属于哪一个schema中的，系统就会自动给我们在表上加上缺省的sheman名。
    比如我们在访问数据库时，访问freeoa用户下的emp表，通过select * from emp; 其实，这sql语句的完整写法为select * from freeoa.emp。在数据库中一个对象的完整名称为schema.object，而不属user.object
[3]  
    [3.1]为什么schema有存在的必要？
    为了区分各个集合，我们需要给这个集合起个名字，其实这个名字就是schema。
    举例说明：访问freeoa用户下的emp表，通过select from emp 其实这条sql语句的完整写法为select from freeoa.emp。对于数据库来说，不同的用户，有不同schema。有不同的表。实际在使用上，schema和user完全一样，没有什么区别，在出现schema名的地方也可以出现user名。
    [3.2] 什么是模式？
    数据库中的模式指的就是schema。可以在不同模式下创建相同表名，访问表对象时使用模式名.表对象，对于不指明模式的表对象以当前登录用户模式作为隐含模式访问。
    [3.3]什么是表空间？
    表空间是实际的数据存储的地方。一个数据库schema可能存在于多个表空间，相似地，一个表空间也可以为多个schema服务。
    [3.4]表空间的作用：
    通过使用表空间，管理员可以控制磁盘的布局。表空间的最常用的作用是优化性能，例如，一个最常用的索引可以建立在非常快的硬盘上，而不太常用的表可以建立在便宜的硬盘上，比如用来存储用于进行归档文件的表。

## 