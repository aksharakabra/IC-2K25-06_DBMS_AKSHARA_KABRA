
mysql> use subquery;
Database changed
mysql> select * from employees;
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+
| first_name | last_name | salary | department  | job_id      | location | job_grade | emp_id |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+
| ethan      | blackwood | 900000 | IT          | manager     | US       | grade 3   |  19246 |
| sofie      | stewart   |  90000 | IT          | team leader | US       | grade 2   |  19247 |
| alex       | carpanter |   7000 | IT          | intern      | US       | grade 1   |  19248 |
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
13 rows in set (0.00 sec)

mysql> alter table employees add dep_id int;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0
mysql> update employees set dep_id = 30 where department = "IT";
Query OK, 4 rows affected (0.03 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> update employees set dep_id = 70 where department = "finance";
Query OK, 4 rows affected (0.03 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> update employees set dep_id = 100 where department = "warehousing";
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> update employees set dep_id = 85 where department = "HR";
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0
--1. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.
mysql> select first_name, last_name, salary from employees where salary not between 10000 and 15000;
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| ethan      | blackwood | 900000 |
| sofie      | stewart   |  90000 |
| alex       | carpanter |   7000 |
| aouki      | nakayama  | 500000 |
| kenta      | yamaguchi | 300000 |
| min        | heseung   |   6900 |
| carl       | bell      | 600000 |
| william    | bull      |  80000 |
| lily       | isabella  | 340000 |
| kyle       | williams  |   5000 |
| park       | sujin     |  60000 |
| kim        | sohyun    |   9000 |
| jasmine    | tata      |   6000 |
+------------+-----------+--------+
13 rows in set (0.00 sec)
--2. Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.
mysql> SELECT first_name, last_name, dep_id FROM employees WHERE dep_id IN (30, 100) ORDER BY dep_id ASC;
+------------+-----------+--------+
| first_name | last_name | dep_id |
+------------+-----------+--------+
| ethan      | blackwood |     30 |
| sofie      | stewart   |     30 |
| alex       | carpanter |     30 |
| aouki      | nakayama  |     30 |
| park       | sujin     |    100 |
| kim        | sohyun    |    100 |
| jasmine    | tata      |    100 |
+------------+-----------+--------+
7 rows in set (0.00 sec)
--3. Write a query to display the name (first_name, last_name) and salary for all employees whose salary
  --is not in the range $10,000 through $15,000 and are in department 30 or 100.
mysql> select first_name, last_name, salary from employees where salary not between 10000 and 15000 and dep_id in (30, 100) ;
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| ethan      | blackwood | 900000 |
| sofie      | stewart   |  90000 |
| alex       | carpanter |   7000 |
| aouki      | nakayama  | 500000 |
| park       | sujin     |  60000 |
| kim        | sohyun    |   9000 |
| jasmine    | tata      |   6000 |
+------------+-----------+--------+
7 rows in set (0.00 sec)

mysql> alter table employees add hire_date int;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update employees set hire_date= 1997 where job_grade ="grade 3";
Query OK, 3 rows affected (0.03 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> update employees set hire_date= 1987 where job_grade ="grade 2";
Query OK, 5 rows affected (0.03 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> update employees set hire_date= 2018 where job_grade ="grade 1";
Query OK, 5 rows affected (0.01 sec)
Rows matched: 5  Changed: 5  Warnings: 0
--4. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
mysql> select first_name, last_name, hire_date from employees where hire_date = 1987 ;
+------------+-----------+-----------+
| first_name | last_name | hire_date |
+------------+-----------+-----------+
| sofie      | stewart   |      1987 |
| aouki      | nakayama  |      1987 |
| kenta      | yamaguchi |      1987 |
| william    | bull      |      1987 |
| park       | sujin     |      1987 |
+------------+-----------+-----------+
5 rows in set (0.00 sec)

mysql> insert into employees value ("becky", "ellish", 4500, "IT", "programmer", "US", "grade 4", 19245, 30, 2011);
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees value ("rebeca", "adams", 11000, "IT", "programmer", "US", "grade 4", 19244, 30, 2011);
Query OK, 1 row affected (0.03 sec)
--5. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
mysql> select first_name from employees where first_name like "%b%" and first_name like "%c%" ;
+------------+
| first_name |
+------------+
| rebeca     |
| becky      |
+------------+
2 rows in set (0.00 sec)
    "> WHERE (job_id = "programmer" OR job_id = "sh_clerk")
    "> AND salary NOT IN (45
