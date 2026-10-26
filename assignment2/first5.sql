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
-- 1. Write a query to display the names (first_name, last_name) using alias name "First Name", "Last Name"
mysql> select first_name as "FIRST NAME", last_name as "LAST NAME" from employees;
+------------+-----------+
| FIRST NAME | LAST NAME |
+------------+-----------+
| rebeca     | adams     |
| becky      | ellish    |
| ethan      | blackwood |
| sofie      | stewart   |
| alex       | carpanter |
| aouki      | nakayama  |
| kenta      | yamaguchi |
| min        | heseung   |
| carl       | bell      |
| william    | bull      |
| lily       | isabella  |
| kyle       | williams  |
| park       | sujin     |
| kim        | sohyun    |
| jasmine    | tata      |
+------------+-----------+
15 rows in set (0.00 sec)
-- 2. Write a query to get unique department ID from employee table.
mysql> select distinct dep_id from employees;
+--------+
| dep_id |
+--------+
|     30 |
|     70 |
|     85 |
|    100 |
+--------+
4 rows in set (0.00 sec)
-- 3. Write a query to get all employee details from the employee table order by first name, descending.
mysql> select * from employees order by first_name desc;
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+--------+-----------+
| first_name | last_name | salary | department  | job_id      | location | job_grade | emp_id | dep_id | hire_date |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+--------+-----------+
| william    | bull      |  80000 | finance     | team leader | IN       | grade 2   |  23679 |     70 |      1987 |
| sofie      | stewart   |  90000 | IT          | team leader | US       | grade 2   |  19247 |     30 |      1987 |
| rebeca     | adams     |  11000 | IT          | programmer  | US       | grade 4   |  19244 |     30 |      2011 |
| park       | sujin     |  60000 | warehousing | supervisor  | KO       | grade 2   |  78965 |    100 |      1987 |
| min        | heseung   |   6900 | finance     | intern      | KO       | grade 1   |  23677 |     70 |      2018 |
| lily       | isabella  | 340000 | HR          | manager     | US       | grade 3   |  56473 |     85 |      1997 |
| kyle       | williams  |   5000 | HR          | intern      | US       | grade 1   |  56474 |     85 |      2018 |
| kim        | sohyun    |   9000 | warehousing | sh_clerk    | KO       | grade 1   |  78966 |    100 |      2018 |
| kenta      | yamaguchi | 300000 | finance     | supervisor  | JA       | grade 2   |  23676 |     70 |      1987 |
| jasmine    | tata      |   6000 | warehousing | sh_clerk    | IN       | grade 1   |  78967 |    100 |      2018 |
| ethan      | blackwood | 900000 | IT          | manager     | US       | grade 3   |  19246 |     30 |      1997 |
| carl       | bell      | 600000 | finance     | manager     | IN       | grade 3   |  23678 |     70 |      1997 |
| becky      | ellish    |   4500 | IT          | programmer  | US       | grade 4   |  19245 |     30 |      2011 |
| aouki      | nakayama  | 500000 | IT          | supervisor  | JA       | grade 2   |  19249 |     30 |      1987 |
| alex       | carpanter |   7000 | IT          | intern      | US       | grade 1   |  19248 |     30 |      2018 |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+--------+-----------+
15 rows in set (0.03 sec)
-- 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
mysql> select emp_id, first_name, last_name, salary from employees order by salary asc;
+--------+------------+-----------+--------+
| emp_id | first_name | last_name | salary |
+--------+------------+-----------+--------+
|  19245 | becky      | ellish    |   4500 |
|  56474 | kyle       | williams  |   5000 |
|  78967 | jasmine    | tata      |   6000 |
|  23677 | min        | heseung   |   6900 |
|  19248 | alex       | carpanter |   7000 |
|  78966 | kim        | sohyun    |   9000 |
|  19244 | rebeca     | adams     |  11000 |
|  78965 | park       | sujin     |  60000 |
|  23679 | william    | bull      |  80000 |
|  19247 | sofie      | stewart   |  90000 |
|  23676 | kenta      | yamaguchi | 300000 |
|  56473 | lily       | isabella  | 340000 |
|  19249 | aouki      | nakayama  | 500000 |
|  23678 | carl       | bell      | 600000 |
|  19246 | ethan      | blackwood | 900000 |
+--------+------------+-----------+--------+
15 rows in set (0.00 sec)
