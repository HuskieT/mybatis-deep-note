# mysql连接查询

## 1 参考


## 2 join详解
JOIN: 如果表中有至少一个匹配，则返回行
INNER JOIN: 在表中存在至少一个匹配时，INNER JOIN 关键字返回行
LEFT JOIN: 即使右表中没有匹配，也从左表返回所有的行
RIGHT JOIN: 即使左表中没有匹配，也从右表返回所有的行
FULL JOIN: 只要其中一个表中存在匹配，就返回行




例：

原始的表 (用在例子中的)：
"Persons" 表：

Id_P	LastName	FirstName	Address	City
1	Adams	John	Oxford Street	London
2	Bush	George	Fifth Avenue	New York
3	Carter	Thomas	Changan Street	Beijing
"Orders" 表：

Id_O	OrderNo	Id_P
1	77895	3
2	44678	3
3	22456	1
4	24562	1
5	34764	65


【1】inner join (INNER JOIN 关键字在表中存在至少一个匹配时返回行。如果 "Persons" 中的行在 "Orders" 中没有匹配，就不会列出这些行。)
        
        SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo
        FROM Persons
        INNER JOIN Orders
        ON Persons.Id_P=Orders.Id_P
        ORDER BY Persons.LastName
        
        结果：
        LastName	FirstName	OrderNo
        Adams	    John	    22456
        Adams	    John	    24562
        Carter	    Thomas  	77895
        Carter	    Thomas	    44678
        
【2】LEFT JOIN   （LEFT JOIN 关键字会从左表 (Persons) 那里返回所有的行，即使在右表 (Orders) 中没有匹配的行。）
    
      SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo
      FROM Persons
      LEFT JOIN Orders
      ON Persons.Id_P=Orders.Id_P
      ORDER BY Persons.LastName
        
      结果：  
      LastName	FirstName	OrderNo
      Adams	    John	    22456
      Adams	    John	    24562
      Carter	Thomas	    77895
      Carter	Thomas	    44678
      Bush	    George	    
    
    
【3】RIGHT JOIN: (RIGHT JOIN 关键字会从右表 (Orders) 那里返回所有的行，即使在左表 (Persons) 中没有匹配的行)
    
    SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo
    FROM Persons
    RIGHT JOIN Orders
    ON Persons.Id_P=Orders.Id_P
    ORDER BY Persons.LastName
    
    结果;
    LastName	FirstName	OrderNo
    Adams	    John	    22456
    Adams	    John	    24562
    Carter	    Thomas	    77895
    Carter	    Thomas	    44678
     	 	                34764
    
【4】FULL JOIN （FULL JOIN 关键字会从左表 (Persons) 和右表 (Orders) 那里返回所有的行。如果 "Persons" 中的行在表 "Orders" 中没有匹配，
                或者如果 "Orders" 中的行在表 "Persons" 中没有匹配，这些行同样会列出）
    
    SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo
    FROM Persons
    FULL JOIN Orders
    ON Persons.Id_P=Orders.Id_P
    ORDER BY Persons.LastName
    
    结果：
    LastName	FirstName	OrderNo
    Adams	    John	    22456
    Adams	    John	    24562
    Carter	    Thomas	    77895
    Carter	    Thomas	    44678
    Bush	    George	 
     	 	                34764


## 3 Union 详解

UNION 操作符用于合并两个或多个 SELECT 语句的结果集

**UNION 内部的 SELECT 语句必须拥有相同数量的列。列也必须拥有相似的数据类型。同时，每条 SELECT 语句中的列的顺序必须相同**
**UNION 操作符选取不同的值。如果允许重复的值，请使用 UNION ALL**















