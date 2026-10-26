mysql> use subquery;
Database changed
mysql> select * from employees;
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+--------+-----------+
| first_name | last_name | salary | department  | job_id      | location | job_grade | emp_id | dep_id | hire_date |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+--------+-----------+
| rebeca     | adams     |  11000 | IT          | programmer  | US       | grade 4   |  19244 |     30 |      2011 |
| becky      | ellish    |   4500 | IT          | programmer  | US       | grade 4   |  19245 |     30 |      2011 |
| ethan      | blackwood | 900000 | IT          | manager     | US       | grade 3   |  19246 |     30 |      1997 |
| sofie      | stewart   |  90000 | IT          | team leader | US       | grade 2   |  19247 |     30 |      1987 |
| alex       | carpanter |   7000 | IT          | intern      | US       | grade 1   |  19248 |     30 |      2018 |
| aouki      | nakayama  | 500000 | IT          | supervisor  | JA       | grade 2   |  19249 |     30 |      1987 |
| kenta      | yamaguchi | 300000 | finance     | supervisor  | JA       | grade 2   |  23676 |     70 |      1987 |
| min        | heseung   |   6900 | finance     | intern      | KO       | grade 1   |  23677 |     70 |      2018 |
| carl       | bell      | 600000 | finance     | manager     | IN       | grade 3   |  23678 |     70 |      1997 |
| william    | bull      |  80000 | finance     | team leader | IN       | grade 2   |  23679 |     70 |      1987 |
| lily       | isabella  | 340000 | HR          | manager     | US       | grade 3   |  56473 |     85 |      1997 |
| kyle       | williams  |   5000 | HR          | intern      | US       | grade 1   |  56474 |     85 |      2018 |
| park       | sujin     |  60000 | warehousing | supervisor  | KO       | grade 2   |  78965 |    100 |      1987 |
| kim        | sohyun    |   9000 | warehousing | sh_clerk    | KO       | grade 1   |  78966 |    100 |      2018 |
| jasmine    | tata      |   6000 | warehousing | sh_clerk    | IN       | grade 1   |  78967 |    100 |      2018 |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+--------+-----------+
15 rows in set (0.00 sec)
-- 1. Write a query to list the number of jobs available in the employees table.
mysql> select count(distinct job_id) as "available jobs"from employees;
+----------------+
| available jobs |
+----------------+
|              6 |
+----------------+
1 row in set (0.00 sec)
-- 2. Write a query to get the total salaries payable to employees
mysql> select sum(salary) as "salary payble"from employees;
+---------------+
| salary payble |
+---------------+
|       2919400 |
+---------------+
1 row in set (0.00 sec)
-- 3. Write a query to get the minimum salary from employees table.
mysql> select min(salary) as " minimum salary"from employees;
+----------------+
| minimum salary |
+----------------+
|           4500 |
+----------------+
1 row in set, 1 warning (0.00 sec)
-- 4. Write a query to get the maximum salary of an employee working as a Programmer.
mysql> select max(salary) as "maximum salary" from employees where job_id = "programmer";
+----------------+
| maximum salary |
+----------------+
|          11000 |
+----------------+
1 row in set (0.00 sec)

mysql> update employees set dep_id = 90 where dep_id = 100;
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0
-- 5. Write a query to get the average salary and number of employees working the department 90.
mysql> select avg(salary) as "average salary", count(*) from employees where dep_id = 90;
+----------------+----------+
| average salary | count(*) |
+----------------+----------+
|          25000 |        3 |
+----------------+----------+
1 row in set (0.00 sec)
-- 6. Write a query to get the highest, lowest, sum, and average salary of all employees.
mysql> select max(salary), min(salary), avg(salary), sum(salary) from employees;
+-------------+-------------+--------------------+-------------+
| max(salary) | min(salary) | avg(salary)        | sum(salary) |
+-------------+-------------+--------------------+-------------+
|      900000 |        4500 | 194626.66666666666 |     2919400 |
+-------------+-------------+--------------------+-------------+
1 row in set (0.00 sec)
-- 7. Write a query to get the number of employees with the same job.
mysql> select job_id, count(*) from employees group by job_id;
+-------------+----------+
| job_id      | count(*) |
+-------------+----------+
| programmer  |        2 |
| manager     |        3 |
| team leader |        2 |
| intern      |        3 |
| supervisor  |        3 |
| sh_clerk    |        2 |
+-------------+----------+
6 rows in set (0.00 sec)
