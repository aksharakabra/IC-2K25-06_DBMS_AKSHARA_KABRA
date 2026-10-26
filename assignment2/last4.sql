--16. Write a query to get the length of the employee names (first_name, last_name) from employees table.
mysql> SELECT first_name, last_name, LENGTH(CONCAT(first_name, ' ', last_name)) AS Name_Length FROM employees;
+------------+-----------+-------------+
| first_name | last_name | Name_Length |
+------------+-----------+-------------+
| rebeca     | adams     |          12 |
| becky      | ellish    |          12 |
| ethan      | blackwood |          15 |
| sofie      | stewart   |          13 |
| alex       | carpanter |          14 |
| aouki      | nakayama  |          14 |
| kenta      | yamaguchi |          15 |
| min        | heseung   |          11 |
| carl       | bell      |           9 |
| william    | bull      |          12 |
| lily       | isabella  |          13 |
| kyle       | williams  |          13 |
| park       | sujin     |          10 |
| kim        | sohyun    |          10 |
| jasmine    | tata      |          12 |
+------------+-----------+-------------+
15 rows in set (0.00 sec)
--18. Write a query to select first 10 records from a table.
mysql> SELECT first_name FROM employees WHERE first_name REGEXP '[0-9]';
Empty set (0.04 sec)
--18. Write a query to select first 10 records from a table.
mysql> select * from employees limit 10;
+------------+-----------+--------+------------+-------------+----------+-----------+--------+--------+-----------+
| first_name | last_name | salary | department | job_id      | location | job_grade | emp_id | dep_id | hire_date |
+------------+-----------+--------+------------+-------------+----------+-----------+--------+--------+-----------+
| rebeca     | adams     |  11000 | IT         | programmer  | US       | grade 4   |  19244 |     30 |      2011 |
| becky      | ellish    |   4500 | IT         | programmer  | US       | grade 4   |  19245 |     30 |      2011 |
| ethan      | blackwood | 900000 | IT         | manager     | US       | grade 3   |  19246 |     30 |      1997 |
| sofie      | stewart   |  90000 | IT         | team leader | US       | grade 2   |  19247 |     30 |      1987 |
| alex       | carpanter |   7000 | IT         | intern      | US       | grade 1   |  19248 |     30 |      2018 |
| aouki      | nakayama  | 500000 | IT         | supervisor  | JA       | grade 2   |  19249 |     30 |      1987 |
| kenta      | yamaguchi | 300000 | finance    | supervisor  | JA       | grade 2   |  23676 |     70 |      1987 |
| min        | heseung   |   6900 | finance    | intern      | KO       | grade 1   |  23677 |     70 |      2018 |
| carl       | bell      | 600000 | finance    | manager     | IN       | grade 3   |  23678 |     70 |      1997 |
| william    | bull      |  80000 | finance    | team leader | IN       | grade 2   |  23679 |     70 |      1987 |
+------------+-----------+--------+------------+-------------+----------+-----------+--------+--------+-----------+
10 rows in set (0.00 sec)

mysql> select salary/12 as "monthly salary" from employees;
+--------------------+
| monthly salary     |
+--------------------+
|  916.6666666666666 |
|                375 |
|              75000 |
|               7500 |
|  583.3333333333334 |
| 41666.666666666664 |
|              25000 |
|                575 |
|              50000 |
|  6666.666666666667 |
| 28333.333333333332 |
|  416.6666666666667 |
|               5000 |
|                750 |
|                500 |
+--------------------+
15 rows in set (0.00 sec)
--19. Write a query to get monthly salary (round 2 decimal places) of each and every employee
--Note : Assume the salary field provides the 'annual salary' information.
mysql> select round(salary/12,2) as "monthly salary" from employees;
+----------------+
| monthly salary |
+----------------+
|         916.67 |
|            375 |
|          75000 |
|           7500 |
|         583.33 |
|       41666.67 |
|          25000 |
|            575 |
|          50000 |
|        6666.67 |
|       28333.33 |
|         416.67 |
|           5000 |
|            750 |
|            500 |
+----------------+
15 rows in set (0.04 sec)
