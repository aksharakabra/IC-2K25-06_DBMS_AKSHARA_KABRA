--  order by clause, group by clause and count
mysql> use dblab1;
Database changed
mysql> INSERT INTO employee VALUES
    -> (1, 'Rahul', 'IT', 60000, 'Indore', 28),
    -> (2, 'Amit', 'HR', 45000, 'Bhopal', 32),
    -> (3, 'Priya', 'IT', 75000, 'Indore', 26),
    -> (4, 'Neha', 'Finance', 55000, 'Ujjain', 30),
    -> (5, 'Raj', 'HR', 50000, 'Indore', 29),
    -> (6, 'Sneha', 'Finance', 70000, 'Bhopal',27),
    ->  (7, 'Vikas', 'IT', 65000, 'Ujjain', 31);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+------+-------+------------+----------+--------+------+
| id   | name  | department | salary   | city   | age  |
+------+-------+------------+----------+--------+------+
|    1 | Rahul | IT         | 60000.00 | Indore |   28 |
|    2 | Amit  | HR         | 45000.00 | Bhopal |   32 |
|    3 | Priya | IT         | 75000.00 | Indore |   26 |
|    4 | Neha  | Finance    | 55000.00 | Ujjain |   30 |
|    5 | Raj   | HR         | 50000.00 | Indore |   29 |
|    6 | Sneha | Finance    | 70000.00 | Bhopal |   27 |
|    7 | Vikas | IT         | 65000.00 | Ujjain |   31 |
+------+-------+------------+----------+--------+------+
7 rows in set (0.00 sec)

mysql> select distinct department from employee;
+------------+
| department |
+------------+
| IT         |
| HR         |
| Finance    |
+------------+
3 rows in set (0.03 sec)

mysql> select department from employee;
+------------+
| department |
+------------+
| IT         |
| HR         |
| IT         |
| Finance    |
| HR         |
| Finance    |
| IT         |
+------------+
7 rows in set (0.00 sec)

mysql> select name, salary from employee order by salary;
+-------+----------+
| name  | salary   |
+-------+----------+
| Amit  | 45000.00 |
| Raj   | 50000.00 |
| Neha  | 55000.00 |
| Rahul | 60000.00 |
| Vikas | 65000.00 |
| Sneha | 70000.00 |
| Priya | 75000.00 |
+-------+----------+
7 rows in set (0.00 sec)

mysql> select name, salary from employee order by salary desc;
+-------+----------+
| name  | salary   |
+-------+----------+
| Priya | 75000.00 |
| Sneha | 70000.00 |
| Vikas | 65000.00 |
| Rahul | 60000.00 |
| Neha  | 55000.00 |
| Raj   | 50000.00 |
| Amit  | 45000.00 |
+-------+----------+
7 rows in set (0.00 sec)

mysql> select * from employee order by name;
+------+-------+------------+----------+--------+------+
| id   | name  | department | salary   | city   | age  |
+------+-------+------------+----------+--------+------+
|    2 | Amit  | HR         | 45000.00 | Bhopal |   32 |
|    4 | Neha  | Finance    | 55000.00 | Ujjain |   30 |
|    3 | Priya | IT         | 75000.00 | Indore |   26 |
|    1 | Rahul | IT         | 60000.00 | Indore |   28 |
|    5 | Raj   | HR         | 50000.00 | Indore |   29 |
|    6 | Sneha | Finance    | 70000.00 | Bhopal |   27 |
|    7 | Vikas | IT         | 65000.00 | Ujjain |   31 |
+------+-------+------------+----------+--------+------+
7 rows in set (0.03 sec)

mysql> select * from employee order by age;
+------+-------+------------+----------+--------+------+
| id   | name  | department | salary   | city   | age  |
+------+-------+------------+----------+--------+------+
|    3 | Priya | IT         | 75000.00 | Indore |   26 |
|    6 | Sneha | Finance    | 70000.00 | Bhopal |   27 |
|    1 | Rahul | IT         | 60000.00 | Indore |   28 |
|    5 | Raj   | HR         | 50000.00 | Indore |   29 |
|    4 | Neha  | Finance    | 55000.00 | Ujjain |   30 |
|    7 | Vikas | IT         | 65000.00 | Ujjain |   31 |
|    2 | Amit  | HR         | 45000.00 | Bhopal |   32 |
+------+-------+------------+----------+--------+------+
7 rows in set (0.00 sec)

mysql> select department, avg(salary) from employee group by department;
+------------+--------------+
| department | avg(salary)  |
+------------+--------------+
| IT         | 66666.666667 |
| HR         | 47500.000000 |
| Finance    | 62500.000000 |
+------------+--------------+
3 rows in set (0.03 sec)

mysql> select department, count(*) as total_employees from employee group by department having count(*)>2;
+------------+-----------------+
| department | total_employees |
+------------+-----------------+
| IT         |               3 |
+------------+-----------------+
1 row in set (0.03 sec)

mysql> select department, count(*) as total_employees from employee group by department having count(*)=2;
+------------+-----------------+
| department | total_employees |
+------------+-----------------+
| HR         |               2 |
| Finance    |               2 |
+------------+-----------------+
2 rows in set (0.00 sec)

mysql> select department, avg(salary) from employee group by department having avg(salary)>60000;
+------------+--------------+
| department | avg(salary)  |
+------------+--------------+
| IT         | 66666.666667 |
| Finance    | 62500.000000 |
+------------+--------------+
2 rows in set (0.00 sec)

mysql> select department, avg(salary) from employee group by department having avg(salary)<60000;
+------------+--------------+
| department | avg(salary)  |
+------------+--------------+
| HR         | 47500.000000 |
+------------+--------------+
1 row in set (0.00 sec)

mysql> select * from employee limit 3 offset 2;
+------+-------+------------+----------+--------+------+
| id   | name  | department | salary   | city   | age  |
+------+-------+------------+----------+--------+------+
|    3 | Priya | IT         | 75000.00 | Indore |   26 |
|    4 | Neha  | Finance    | 55000.00 | Ujjain |   30 |
|    5 | Raj   | HR         | 50000.00 | Indore |   29 |
+------+-------+------------+----------+--------+------+
3 rows in set (0.00 sec)

mysql> select name, salary, age from employee;
+-------+----------+------+
| name  | salary   | age  |
+-------+----------+------+
| Rahul | 60000.00 |   28 |
| Amit  | 45000.00 |   32 |
| Priya | 75000.00 |   26 |
| Neha  | 55000.00 |   30 |
| Raj   | 50000.00 |   29 |
| Sneha | 70000.00 |   27 |
| Vikas | 65000.00 |   31 |
+-------+----------+------+
7 rows in set (0.00 sec)

mysql> select name as emp_name, salary as emp_salary, age from employee;
+----------+------------+------+
| emp_name | emp_salary | age  |
+----------+------------+------+
| Rahul    |   60000.00 |   28 |
| Amit     |   45000.00 |   32 |
| Priya    |   75000.00 |   26 |
| Neha     |   55000.00 |   30 |
| Raj      |   50000.00 |   29 |
| Sneha    |   70000.00 |   27 |
| Vikas    |   65000.00 |   31 |
+----------+------------+------+
7 rows in set (0.00 sec)
