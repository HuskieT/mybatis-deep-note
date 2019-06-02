






# 1  查询部门编号不是在90到110之间，或者工资高于15000的员工信息 
  
 sql> SELECT * FROM employees WHERE NOT(department_id>=90 AND  department_id<=110) OR salary>15000; 

# 2 将员工的姓名按首字母排序，并写出姓名的长度（length）

SELECT LENGTH(last_name) 长度,SUBSTR(last_name,1,1) 首字符,last_name
FROM employees ORDER BY 首字符;

#3、按表达式排序
#案例：查询员工信息 按年薪降序

SELECT *,salary*12*(1+IFNULL(commission_pct,0))
FROM employees
ORDER BY salary*12*(1+IFNULL(commission_pct,0)) DESC;

















