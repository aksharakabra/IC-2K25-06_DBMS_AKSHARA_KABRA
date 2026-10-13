mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| customer_order     |
| dblab1             |
| dbms               |
| information_schema |
| mysql              |
| performance_schema |
| subquery           |
| sys                |
+--------------------+
8 rows in set (0.01 sec)

mysql> use subquery;
Database changed
mysql> show tables;
+--------------------+
| Tables_in_subquery |
+--------------------+
| employees          |
+--------------------+
1 row in set (0.01 sec)

mysql> select * from employees;
+------------+-----------+--------+------------+-------------+----------+-----------+
| first_name | last_name | salary | department | post        | location | job_grade |
+------------+-----------+--------+------------+-------------+----------+-----------+
| ethan      | blackwood | 900000 | IT         | manager     | US       | grade 3   |
| carl       | bell      | 600000 | finance    | manager     | IN       | grade 3   |
| william    | bull      |  80000 | finance    | team leader | IN       | grade 2   |
| sofie      | stewart   |  90000 | IT         | team leader | US       | grade 2   |
| alex       | carpanter |   7000 | IT         | intern      | US       | grade 1   |
| min        | heseung   |   6900 | finance    | intern      | KO       | grade 1   |
| lily       | isabella  | 340000 | HR         | manager     | US       | grade 3   |
| kyle       | williams  |   5000 | HR         | intern      | US       | grade 1   |
+------------+-----------+--------+------------+-------------+----------+-----------+
8 rows in set (0.00 sec)

mysql> alter table employees rename column post to job_id;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into employees values("jasmine", "tata", 6000, "warehousing", "sh_clerk", "IN", "grade 1");
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees values("kim", "sohyun", 6000, "warehousing", "sh_clerk", "KO", "grade 1");
Query OK, 1 row affected (0.04 sec)

mysql> insert into employees values("kim", "sohyun", 9000, "warehousing", "sh_clerk", "KO", "grade 1");
Query OK, 1 row affected (0.03 sec)

mysql> delete from employees where first_name ="kim";
Query OK, 2 rows affected (0.03 sec)

mysql> insert into employees values("kim", "sohyun", 9000, "warehousing", "sh_clerk", "KO", "grade 1");
Query OK, 1 row affected (0.03 sec)
  
--11. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of 
--all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest.
mysql> select first_name, last_name, salary  from employees where salary> all (select salary from employees WHERE job_id = 'SH_CLERK') order by salary asc;
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| william    | bull      |  80000 |
| sofie      | stewart   |  90000 |
| lily       | isabella  | 340000 |
| carl       | bell      | 600000 |
| ethan      | blackwood | 900000 |
+------------+-----------+--------+
5 rows in set (0.03 sec)

mysql> insert into employees values("park", "sujin", 60000, "warehousing", "supervisor", "KO", "grade 2");
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees values("aouki", "nakayama", 500000, "IT", "supervisor", "JA", "grade 2");
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees values("kenta", "yamaguchi", 300000, "finance", "supervisor", "JA", "grade 2");
Query OK, 1 row affected (0.03 sec)

  -- 12. Write a query to find the name (first_name, last_name) of the employees who are not supervisors
mysql> SELECT first_name, last_name FROM employees WHERE job_id <> 'supervisor';
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| ethan      | blackwood |
| carl       | bell      |
| william    | bull      |
| sofie      | stewart   |
| alex       | carpanter |
| min        | heseung   |
| lily       | isabella  |
| kyle       | williams  |
| jasmine    | tata      |
| kim        | sohyun    |
+------------+-----------+
10 rows in set (0.00 sec)

mysql> ALTER TABLE employees ADD emp_id INT AUTO_INCREMENT PRIMARY KEY;
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employees drop column emp_id;
Query OK, 13 rows affected (0.09 sec)
Records: 13  Duplicates: 0  Warnings: 0

mysql> alter table employees add emp_id int;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update employees set emp_id= 19246 where first_name = "ethen";
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> update employees set emp_id= 19246 where first_name = "ethan";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 19247 where first_name = "sofie";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 19248 where first_name = "alex";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 23678 where first_name = "carl";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 23679 where first_name = "willliam";
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> update employees set emp_id= 23677 where first_name = "min";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 56473 where first_name = "lily";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 56474 where first_name = "kyle";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 19249 where first_name = "aouki";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 78965 where first_name = "park";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 78966 where first_name = "kim";
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 78967 where first_name = "jasmine";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set emp_id= 23676 where first_name = "kenta";
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employees;
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+
| first_name | last_name | salary | department  | job_id      | location | job_grade | emp_id |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+
| ethan      | blackwood | 900000 | IT          | manager     | US       | grade 3   |  19246 |
| carl       | bell      | 600000 | finance     | manager     | IN       | grade 3   |  23678 |
| william    | bull      |  80000 | finance     | team leader | IN       | grade 2   |   NULL |
| sofie      | stewart   |  90000 | IT          | team leader | US       | grade 2   |  19247 |
| alex       | carpanter |   7000 | IT          | intern      | US       | grade 1   |  19248 |
| min        | heseung   |   6900 | finance     | intern      | KO       | grade 1   |  23677 |
| lily       | isabella  | 340000 | HR          | manager     | US       | grade 3   |  56473 |
| kyle       | williams  |   5000 | HR          | intern      | US       | grade 1   |  56474 |
| jasmine    | tata      |   6000 | warehousing | sh_clerk    | IN       | grade 1   |  78967 |
| kim        | sohyun    |   9000 | warehousing | sh_clerk    | KO       | grade 1   |  78966 |
| park       | sujin     |  60000 | warehousing | supervisor  | KO       | grade 2   |  78965 |
| aouki      | nakayama  | 500000 | IT          | supervisor  | JA       | grade 2   |  19249 |
| kenta      | yamaguchi | 300000 | finance     | supervisor  | JA       | grade 2   |  23676 |
+------------+-----------+--------+-------------+-------------+----------+-----------+--------+
13 rows in set (0.00 sec)

mysql> update employees set emp_id= 23679 where first_name = "william";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> ALTER TABLE employees modify emp_id INT  PRIMARY KEY;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employees;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| first_name | varchar(20) | YES  |     | NULL    |       |
| last_name  | varchar(20) | YES  |     | NULL    |       |
| salary     | float       | YES  |     | NULL    |       |
| department | varchar(20) | YES  |     | NULL    |       |
| job_id     | varchar(20) | YES  |     | NULL    |       |
| location   | varchar(10) | YES  |     | NULL    |       |
| job_grade  | varchar(7)  | YES  |     | NULL    |       |
| emp_id     | int         | NO   | PRI | NULL    |       |
+------------+-------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

  -- 13. Write a query to display the employee ID, first name, last name, and department names of all employees.
mysql> select emp_id, first_name, last_name, department from employees;
+--------+------------+-----------+-------------+
| emp_id | first_name | last_name | department  |
+--------+------------+-----------+-------------+
|  19246 | ethan      | blackwood | IT          |
|  19247 | sofie      | stewart   | IT          |
|  19248 | alex       | carpanter | IT          |
|  19249 | aouki      | nakayama  | IT          |
|  23676 | kenta      | yamaguchi | finance     |
|  23677 | min        | heseung   | finance     |
|  23678 | carl       | bell      | finance     |
|  23679 | william    | bull      | finance     |
|  56473 | lily       | isabella  | HR          |
|  56474 | kyle       | williams  | HR          |
|  78965 | park       | sujin     | warehousing |
|  78966 | kim        | sohyun    | warehousing |
|  78967 | jasmine    | tata      | warehousing |
+--------+------------+-----------+-------------+
13 rows in set (0.00 sec)
  
-- 14. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments
mysql> select emp_id, first_name, last_name, salary from employees e where salary>(select avg(salary) from employees where department =e.department);
+--------+------------+-----------+--------+
| emp_id | first_name | last_name | salary |
+--------+------------+-----------+--------+
|  19246 | ethan      | blackwood | 900000 |
|  19249 | aouki      | nakayama  | 500000 |
|  23676 | kenta      | yamaguchi | 300000 |
|  23678 | carl       | bell      | 600000 |
|  56473 | lily       | isabella  | 340000 |
|  78965 | park       | sujin     |  60000 |
+--------+------------+-----------+--------+
6 rows in set (0.00 sec)

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
