-- 15. Write a query to fetch even numbered records from employees table.
mysql> select * from employees where emp_id % 2 = 0;
+------------+-----------+--------+-------------+------------+----------+-----------+--------+
| first_name | last_name | salary | department  | job_id     | location | job_grade | emp_id |
+------------+-----------+--------+-------------+------------+----------+-----------+--------+
| ethan      | blackwood | 900000 | IT          | manager    | US       | grade 3   |  19246 |
| alex       | carpanter |   7000 | IT          | intern     | US       | grade 1   |  19248 |
| kenta      | yamaguchi | 300000 | finance     | supervisor | JA       | grade 2   |  23676 |
| carl       | bell      | 600000 | finance     | manager    | IN       | grade 3   |  23678 |
| kyle       | williams  |   5000 | HR          | intern     | US       | grade 1   |  56474 |
| kim        | sohyun    |   9000 | warehousing | sh_clerk   | KO       | grade 1   |  78966 |
+------------+-----------+--------+-------------+------------+----------+-----------+--------+
6 rows in set (0.03 sec)
--  or 
  -- 15. Write a query to fetch even numbered records from employees table.
mysql> SELECT * FROM ( SELECT employees.*, ROW_NUMBER() OVER (ORDER BY emp_id) AS row_num FROM employees ) AS e WHERE row_num % 2 = 0;
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+---------+
| first_name | last_name | salary | department  | job_id      | location | job_grade | emp_id | row_num |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+---------+
| sofie      | stewart   |  90000 | IT          | team leader | US       | grade 2   |  19247 |       2 |
| aouki      | nakayama  | 500000 | IT          | supervisor  | JA       | grade 2   |  19249 |       4 |
| min        | heseung   |   6900 | finance     | intern      | KO       | grade 1   |  23677 |       6 |
| william    | bull      |  80000 | finance     | team leader | IN       | grade 2   |  23679 |       8 |
| kyle       | williams  |   5000 | HR          | intern      | US       | grade 1   |  56474 |      10 |
| kim        | sohyun    |   9000 | warehousing | sh_clerk    | KO       | grade 1   |  78966 |      12 |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+---------+
6 rows in set (0.03 sec)
-- 16. Write a query to find the 5th maximum salary in the employees table.
mysql> SELECT salary FROM ( SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk FROM employees) AS ranked_salaries WHERE rnk = 5;
+--------+
| salary |
+--------+
| 300000 |
+--------+
1 row in set (0.03 sec)
--17. Write a query to find the 4th minimum salary in the employees table
mysql> SELECT salary FROM ( SELECT salary, DENSE_RANK() OVER (ORDER BY salary asc) AS rnk FROM employees) AS ranked_salaries WHERE rnk = 4;
+--------+
| salary |
+--------+
|   7000 |
+--------+
1 row in set (0.00 sec)

  --18. Write a query to select last 10 records from a table.
mysql> SELECT * FROM ( SELECT * FROM employees order by emp_id desc limit 10) as subquery ORDER BY emp_id ASC;
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+
| first_name | last_name | salary | department  | job_id      | location | job_grade | emp_id |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+
| aouki      | nakayama  | 500000 | IT          | supervisor  | JA       | grade 2   |  19249 |
| kenta      | yamaguchi | 300000 | finance     | supervisor  | JA       | grade 2   |  23676 |
| min        | heseung   |   6900 | finance     | intern      | KO       | grade 1   |  23677 |
| carl       | bell      | 600000 | finance     | manager     | IN       | grade 3   |  23678 |
| william    | bull      |  80000 | finance     | team leader | IN       | grade 2   |  23679 |
| lily       | isabella  | 340000 | HR          | manager     | US       | grade 3   |  56473 |
| kyle       | williams  |   5000 | HR          | intern      | US       | grade 1   |  56474 |
| park       | sujin     |  60000 | warehousing | supervisor  | KO       | grade 2   |  78965 |
| kim        | sohyun    |   9000 | warehousing | sh_clerk    | KO       | grade 1   |  78966 |
| jasmine    | tata      |   6000 | warehousing | sh_clerk    | IN       | grade 1   |  78967 |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+
10 rows in set (0.00 sec)
--20. Write a query to get 3 maximum salaries.
mysql> SELECT salary FROM ( SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk FROM employees) AS ranked_salaries WHERE rnk <4;
+--------+
| salary |
+--------+
| 900000 |
| 600000 |
| 500000 |
+--------+
3 rows in set (0.00 sec)
  --21. Write a query to get 3 minimum salaries.
mysql> SELECT salary FROM ( SELECT salary, DENSE_RANK() OVER (ORDER BY salary asc) AS rnk FROM employees) AS ranked_salaries WHERE rnk < 4;
+--------+
| salary |
+--------+
|   5000 |
|   6000 |
|   6900 |
+--------+
3 rows in set (0.00 sec)
