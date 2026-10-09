mysql> create database subquery;
Query OK, 1 row affected (0.01 sec)

mysql> use subquery;
Database changed
mysql> create table employees(first_name varchar(20), last_name varchar(20), salary float, department varchar(20),post varchar(20));
Query OK, 0 rows affected (0.06 sec)

mysql> insert into employees value("ethan", "blackwood", 900000, "IT", "manager");
Query OK, 1 row affected (0.04 sec)

mysql> insert into employees value("carl", "bell", 600000, "finance", "manager");
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees value("william", "bull", 80000, "finance", "team leader");
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees value("sofie", "stewart", 90000, "IT", "team leader");
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees value("alex", "carpanter", 7000, "IT", "intern");
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees value("min", "heseung", 6900, "finance", "intern");
Query OK, 1 row affected (0.04 sec)

mysql> insert into employees value("lily", "isabella", 340000, "HR", "manager");
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees value("kyle", "williams", 5000, "HR", "intern");
Query OK, 1 row affected (0.03 sec)

mysql> select * from employees;
+------------+-----------+--------+------------+-------------+
| first_name | last_name | salary | department | post        |
+------------+-----------+--------+------------+-------------+
| ethan      | blackwood | 900000 | IT         | manager     |
| carl       | bell      | 600000 | finance    | manager     |
| william    | bull      |  80000 | finance    | team leader |
| sofie      | stewart   |  90000 | IT         | team leader |
| alex       | carpanter |   7000 | IT         | intern      |
| min        | heseung   |   6900 | finance    | intern      |
| lily       | isabella  | 340000 | HR         | manager     |
| kyle       | williams  |   5000 | HR         | intern      |
+------------+-----------+--------+------------+-------------+
8 rows in set (0.00 sec)
-- find the employees who have higher salary than bull
mysql> select from employees where salary>( select salary from employees where last_name ="bull");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from employees where salary>( select salary from employees where last_name ="bul' at line 1
mysql> select * from employees where salary>( select salary from employees where last_name ="bull");
+------------+-----------+--------+------------+-------------+
| first_name | last_name | salary | department | post        |
+------------+-----------+--------+------------+-------------+
| ethan      | blackwood | 900000 | IT         | manager     |
| carl       | bell      | 600000 | finance    | manager     |
| sofie      | stewart   |  90000 | IT         | team leader |
| lily       | isabella  | 340000 | HR         | manager     |
+------------+-----------+--------+------------+-------------+
4 rows in set (0.03 sec)
-- find employees from IT
mysql> select first_name, last_name from employees where department="IT";
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| ethan      | blackwood |
| sofie      | stewart   |
| alex       | carpanter |
+------------+-----------+
3 rows in set (0.00 sec)

mysql> alter table employees add location varchar(10);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update employees set location ="US" where department ="IT";
Query OK, 3 rows affected (0.04 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> update employees set location ="KO" where first_name = "min";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set location ="US" where first_name = "kyle";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set location ="IN" where last_name = "bell";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set location ="IN" where last_name = "bull";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employees set location ="US" where first_name = "lily";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM EMPLOYEES;
+------------+-----------+--------+------------+-------------+----------+
| first_name | last_name | salary | department | post        | location |
+------------+-----------+--------+------------+-------------+----------+
| ethan      | blackwood | 900000 | IT         | manager     | US       |
| carl       | bell      | 600000 | finance    | manager     | IN       |
| william    | bull      |  80000 | finance    | team leader | IN       |
| sofie      | stewart   |  90000 | IT         | team leader | US       |
| alex       | carpanter |   7000 | IT         | intern      | US       |
| min        | heseung   |   6900 | finance    | intern      | KO       |
| lily       | isabella  | 340000 | HR         | manager     | US       |
| kyle       | williams  |   5000 | HR         | intern      | US       |
+------------+-----------+--------+------------+-------------+----------+
8 rows in set (0.00 sec)
-- find names of employees who have a manager and is in US
mysql> SELECT first_name, last_name FROM EMPLOYEES where post != "manager" and location = "US";
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| sofie      | stewart   |
| alex       | carpanter |
| kyle       | williams  |
+------------+-----------+
3 rows in set (0.00 sec)
-- or
mysql> SELECT first_name, last_name FROM EMPLOYEES where post != "manager" and department in (select department from employees where location= "US");
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| sofie      | stewart   |
| alex       | carpanter |
| kyle       | williams  |
+------------+-----------+
3 rows in set (0.03 sec)
-- find managers
mysql> SELECT first_name, last_name FROM EMPLOYEES where post = "manager" ;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| ethan      | blackwood |
| carl       | bell      |
| lily       | isabella  |
+------------+-----------+
3 rows in set (0.00 sec)
-- find employees whose salary is greater than avg salary
mysql> SELECT first_name, last_name FROM EMPLOYEES where salary>( select avg(salary) from employees); 
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| ethan      | blackwood |
| carl       | bell      |
| lily       | isabella  |
+------------+-----------+
3 rows in set (0.03 sec)
-- or
mysql>
mysql> SELECT first_name, last_name, salary FROM EMPLOYEES where salary>( select avg(salary) from employees); 
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| ethan      | blackwood | 900000 |
| carl       | bell      | 600000 |
| lily       | isabella  | 340000 |
+------------+-----------+--------+
3 rows in set (0.00 sec)
