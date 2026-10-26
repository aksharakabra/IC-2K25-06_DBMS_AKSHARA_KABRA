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
| park       | sujin     |  60000 | warehousing | supervisor  | KO       | grade 2   |  78965 |     90 |      1987 |
| kim        | sohyun    |   9000 | warehousing | sh_clerk    | KO       | grade 1   |  78966 |     90 |      2018 |
| jasmine    | tata      |   6000 | warehousing | sh_clerk    | IN       | grade 1   |  78967 |     90 |      2018 |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+--------+-----------+
15 rows in set (0.00 sec)
--8. Write a query to get the difference between the highest and lowest salaries.
mysql> select max(salary)-min(salary) from employees;
+-------------------------+
| max(salary)-min(salary) |
+-------------------------+
|                  895500 |
+-------------------------+
1 row in set (0.03 sec)
-- 8. Write a query to get the difference between the highest and lowest salaries.
mysql> select dep_id, sum(salary) from employees group by dep_id;
+--------+-------------+
| dep_id | sum(salary) |
+--------+-------------+
|     30 |     1512500 |
|     70 |      986900 |
|     85 |      345000 |
|     90 |       75000 |
+--------+-------------+
4 rows in set (0.00 sec)

mysql> select avg(salary) from employees group by job_id where job_id <> "programmer";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where job_id <> "programmer"' at line 1
-- 11. Write a query to get the average salary for each job ID excluding programmer.
mysql> select avg(salary) from employees where job_id <> "programmer" group by job_id;
+-------------------+
| avg(salary)       |
+-------------------+
| 613333.3333333334 |
|             85000 |
|              6300 |
| 286666.6666666667 |
|              7500 |
+-------------------+
5 rows in set (0.03 sec)
-- 12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
mysql> select min(salary),max(SALAry), avg(salary), sum(salary) from employees where dep_id = 90 group by job_id;
+-------------+-------------+-------------+-------------+
| min(salary) | max(SALAry) | avg(salary) | sum(salary) |
+-------------+-------------+-------------+-------------+
|       60000 |       60000 |       60000 |       60000 |
|        6000 |        9000 |        7500 |       15000 |
+-------------+-------------+-------------+-------------+
2 rows in set (0.03 sec)
-- 13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
mysql> select job_id, max(salary) from employees group by job_id having max(salary) >= 4000;
+-------------+-------------+
| job_id      | max(salary) |
+-------------+-------------+
| programmer  |       11000 |
| manager     |      900000 |
| team leader |       90000 |
| intern      |        7000 |
| supervisor  |      500000 |
| sh_clerk    |        9000 |
+-------------+-------------+
6 rows in set (0.03 sec)
