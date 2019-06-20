# json函数
#参考
https://www.cnblogs.com/pfdltutu/p/9019444.html  MySql5.7 json查询
https://www.cnblogs.com/waterystone/p/5626098.html  MySQL常用Json函数
https://dev.mysql.com/doc/refman/8.0/en/json-functions.html   mysql8 json官方文档
#简介
JSON_APPEND()	Append data to JSON document
JSON_ARRAY()	Create JSON array
JSON_ARRAY_APPEND()	Append data to JSON document
JSON_ARRAY_INSERT()	Insert into JSON array
->	Return value from JSON column after evaluating path; equivalent to JSON_EXTRACT().
JSON_CONTAINS()	Whether JSON document contains specific object at path
JSON_CONTAINS_PATH()	Whether JSON document contains any data at path
JSON_DEPTH()	Maximum depth of JSON document
JSON_EXTRACT()	Return data from JSON document
->>	Return value from JSON column after evaluating path and unquoting the result; equivalent to JSON_UNQUOTE(JSON_EXTRACT()).
JSON_INSERT()	Insert data into JSON document
JSON_KEYS()	Array of keys from JSON document
JSON_LENGTH()	Number of elements in JSON document
JSON_MERGE()	Merge JSON documents
JSON_OBJECT()	Create JSON object
JSON_QUOTE()	Quote JSON document
JSON_REMOVE()	Remove data from JSON document
JSON_REPLACE()	Replace values in JSON document
JSON_SEARCH()	Path to value within JSON document
JSON_SET()	Insert data into JSON document
JSON_TYPE()	Type of JSON value
JSON_UNQUOTE()	Unquote JSON value
JSON_VALID()	Whether JSON value is valid

#详解
## 





## 使用示例
create table t1(name json); 
insert into t1 values(’ {
“hello”: “song”,
“num”: 111,
“obj”: { “who”: “me”, “arr”: [ 1, 2, “three” ], “more”:“hey” },
“bool”: true,
“can”: false,
“learning”: null,
“chiness”: “中文”
}' );

mysql> select json_depth(name) from t1; 
返回json文本的深度 输出结果----4； 


mysql> select json_length(name) from t1; 
返回json文本的长度 输出结果----9


mysql> select json_type(name) from t1; 
返回json值得类型 输出结果----OBJECT 


mysql> SELECT JSON_VALID(‘hello’) a, JSON_VALID(‘“hello”’) b; 
判读是否是合法的json类型 返回结果：a:0 b:1


mysql> select json_keys(name) as a from t1; 
查看存储的json有哪些key 返回结果：array[
'a'=> [“hello”, “link”, “can”, “num”, “bool”, “learning”, “notLink”, “obj”, “chiness”],
]

mysql> select json_keys(name,’obj’) as a from t1; 
查看obj有哪些key 返回结果：array['a' =>[“more”,“who”,“arr”]]

mysql>select jsonsearch(name,′one′,′me′) as a from t1;
查看第一次出现的位置 返回结果：array['“.obj.who”']

mysql> select json_search(name,’all’,’%aaaaa%’) as a from t1; 
查看所有包含aaaaa的位置 返回结果：aaaaa所在的key json_search(name,’all’,’%json%’) 

mysql> select json_extract(name,’link[0]’) as a from t1; 
抽取值 返回结果：查找的key所对应的value 如：“http://jsonview.com

mysql> select json_extract(name,’obj[0].more[0]’) from t1; 
抽取值 返回结果同上

或者使用下面的方式

mysql> select name,name->’key2’ from t1; 
{“key1”: “value1”, “key2”: “value2”} | “value2” |

mysql> select JSON_ARRAY_APPEND(name,’name’,’xxx’) from t1; 
追加记录 在指定的json字段追加key-value 参数（字段名,key,value）

mysql> select JSON_REMOVE(name,’name’) from t1; 
删除json数据 参数（字段名,key）

mysql> select JSON_set(name,’name’,’ooo’) from t1; 
有就替换，没有就insert

mysql> SELECT JSON_UNQUOTE(JSON_EXTRACT(name, ‘name’)) AS name from t1; 
查询结果去掉双引号 返回字段name中的key为name的集合,没有“”
因为 JSON 不同于字符串，所以如果用字符串和 JSON 字段比较，是不会相等的可以通过
where key->'$.value'的形式去查询 ->和->>结果等效









