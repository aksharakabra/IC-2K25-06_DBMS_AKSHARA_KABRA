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
--6. Write a query to display the last name, job, and salary for all employees whose job is that of 
  --a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.
--wrong way
  --mysql> select last_name,job_id, salary from employees where salary not in (4500,10000,15000) and (job_id= "programmer" or "sh_clerk");
--+-----------+------------+--------+
--| last_name | job_id     | salary |
--+-----------+------------+--------+
--| adams     | programmer |  11000 |
-- +-----------+------------+--------+
-- 1 row in set, 1 warning (0.00 sec)

mysql> select last_name,job_id, salary from employees where salary not in (4500,10000,15000) and job_id in ("programmer", "sh_clerk");
+-----------+------------+--------+
| last_name | job_id     | salary |
+-----------+------------+--------+
| adams     | programmer |  11000 |
| sohyun    | sh_clerk   |   9000 |
| tata      | sh_clerk   |   6000 |
+-----------+------------+--------+
3 rows in set (0.00 sec)
--7. Write a query to display the last name of employees whose names have exactly 6 characters.
  --wrong way
-- mysql> select last_name from employees where first_name % 6 = 0;
-- +-----------+
-- | last_name |
-- +-----------+
-- | adams     |
-- | ellish    |
-- | blackwood |
-- | stewart   |
-- | carpanter |
-- | nakayama  |
-- | yamaguchi |
-- | heseung   |
-- | bell      |
-- | bull      |
-- | isabella  |
-- | williams  |
-- | sujin     |
-- | sohyun    |
-- | tata      |
-- +-----------+
-- 15 rows in set, 15 warnings (0.00 sec)

mysql> select last_name from employees WHERE LENGTH(last_name) = 6;
+-----------+
| last_name |
+-----------+
| ellish    |
| sohyun    |
+-----------+
2 rows in set (0.03 sec)
--8. Write a query to display the last name of employees having 'e' as the third character.
mysql> select last_name from employees where last_name like "__e%";
+-----------+
| last_name |
+-----------+
| stewart   |
+-----------+
1 row in set (0.03 sec)
--10. Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees.
mysql> select first_name, last_name, salary , salary* 15/100 as pf from employees;
+------------+-----------+--------+--------+
| first_name | last_name | salary | pf     |
+------------+-----------+--------+--------+
| rebeca     | adams     |  11000 |   1650 |
| becky      | ellish    |   4500 |    675 |
| ethan      | blackwood | 900000 | 135000 |
| sofie      | stewart   |  90000 |  13500 |
| alex       | carpanter |   7000 |   1050 |
| aouki      | nakayama  | 500000 |  75000 |
| kenta      | yamaguchi | 300000 |  45000 |
| min        | heseung   |   6900 |   1035 |
| carl       | bell      | 600000 |  90000 |
| william    | bull      |  80000 |  12000 |
| lily       | isabella  | 340000 |  51000 |
| kyle       | williams  |   5000 |    750 |
| park       | sujin     |  60000 |   9000 |
| kim        | sohyun    |   9000 |   1350 |
| jasmine    | tata      |   6000 |    900 |
+------------+-----------+--------+--------+
15 rows in set (0.03 sec)
--11. Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
mysql> select * from employees where last_name in ('BLAKE', 'SCOTT', 'KING', 'FORD');
Empty set (0.00 sec)
