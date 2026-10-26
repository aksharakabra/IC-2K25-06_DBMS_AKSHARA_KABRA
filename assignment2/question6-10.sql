-- 6. Write a query to get the total salaries payable to employees.
mysql> select sum(salary) as "total salary" from employees;
+--------------+
| total salary |
+--------------+
|      2919400 |
+--------------+
1 row in set (0.01 sec)
-- 7. Write a query to get the maximum and minimum salary from employees table.
mysql> select max(salary), min(salary) from employees;
+-------------+-------------+
| max(salary) | min(salary) |
+-------------+-------------+
|      900000 |        4500 |
+-------------+-------------+
1 row in set (0.03 sec)
-- 8. Write a query to get the average salary and number of employees in the employees table.
mysql> select avg(salary), count(*) from employees;
+--------------------+----------+
| avg(salary)        | count(*) |
+--------------------+----------+
| 194626.66666666666 |       15 |
+--------------------+----------+
1 row in set (0.03 sec)
-- 9. Write a query to get the number of employees working with the company.
mysql> select count(*) as "working in the company" from employees;
+------------------------+
| working in the company |
+------------------------+
|                     15 |
+------------------------+
1 row in set (0.04 sec)
-- 10. Write a query to get the number of jobs available in the employees table.
mysql> select count(distinct job_id) as "jobs available" from employees;
+----------------+
| jobs available |
+----------------+
|              6 |
+----------------+
1 row in set (0.03 sec)
