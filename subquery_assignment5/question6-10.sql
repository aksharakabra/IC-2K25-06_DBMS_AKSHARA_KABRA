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
1 row in set (0.00 sec)

mysql> desc employees;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| first_name | varchar(20) | YES  |     | NULL    |       |
| last_name  | varchar(20) | YES  |     | NULL    |       |
| salary     | float       | YES  |     | NULL    |       |
| department | varchar(20) | YES  |     | NULL    |       |
| post       | varchar(20) | YES  |     | NULL    |       |
| location   | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> alter table employees add job_grade varchar(7);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update employees set job_grade= 'grade 1' where post= "intern";
Query OK, 3 rows affected (0.03 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> update employees set job_grade= 'grade 2' where post= "manager";
Query OK, 3 rows affected (0.03 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> update employees set job_grade= 'grade 2' where post= "team leader";
Query OK, 2 rows affected (0.03 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> update employees set job_grade= 'grade 3' where post= "manager";
Query OK, 3 rows affected (0.03 sec)
Rows matched: 3  Changed: 3  Warnings: 0

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
-- without alias the answer is wrong
mysql> select first_name, last_name, salary from employees where salary= (select min(salary) from employees where post= employees.post);
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| kyle       | williams  |   5000 |
+------------+-----------+--------+
1 row in set (0.00 sec)
-- 6.  employees whose salary is equal to the minimum salary for their job grade.
mysql> select first_name, last_name, salary from employees e where salary= (select min(salary) from employees where job_grade= e.job_grade);
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| william    | bull      |  80000 |
| lily       | isabella  | 340000 |
| kyle       | williams  |   5000 |
+------------+-----------+--------+
3 rows in set (0.00 sec)
-- 7. employees who earns more than the average salary and works in any of the IT departments.
mysql> SELECT first_name, last_name, salary from employees where department= "IT" and salary >(select avg(salary) from employees);
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| ethan      | blackwood | 900000 |
+------------+-----------+--------+
1 row in set (0.00 sec)
-- 8. employees who earns more than the earning of Mr. Bell.
mysql> SELECT first_name, last_name, salary from employees where salary >(select salary from employees where last_name= "bell");
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| ethan      | blackwood | 900000 |
+------------+-----------+--------+
1 row in set (0.00 sec)
-- employees who earn the same salary as the minimum salary of all departments.
mysql> SELECT first_name, last_name, salary from employees where salary=(select min(salary) from employees );
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| kyle       | williams  |   5000 |
+------------+-----------+--------+
1 row in set (0.00 sec)
-- 9.employees who earn the same salary as the minimum salary for all departments.
mysql> SELECT first_name, last_name, salary from employees e where salary=(select min(salary) from employees where department= e.department );
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| alex       | carpanter |   7000 |
| min        | heseung   |   6900 |
| kyle       | williams  |   5000 |
+------------+-----------+--------+
3 rows in set (0.00 sec)
-- 10. employees whose salary is greater than the average salary of all departments.
mysql> SELECT first_name, last_name, salary from employees where salary>(select avg(salary) from employees );
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| ethan      | blackwood | 900000 |
| carl       | bell      | 600000 |
| lily       | isabella  | 340000 |
+------------+-----------+--------+
3 rows in set (0.00 sec)
