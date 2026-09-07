mysql> use dblab1;
Database changed
mysql> CREATE TABLE job_histry (
    ->     employee_id INT,
    ->     start_date DATE,
    ->     end_date DATE,
    ->     job_id VARCHAR(10),
    ->     department_id INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO job_histry
    -> (employee_id, start_date, end_date, job_id, department_id)
    -> VALUES
    -> (101,
    ->  STR_TO_DATE('01/01/2024', '%d/%m/%Y'),
    ->  STR_TO_DATE('31/12/2024', '%d/%m/%Y'),
    ->  'IT_PROG',
    ->  10);
Query OK, 1 row affected (0.02 sec)

mysql> select * from job_histry;
+-------------+------------+------------+---------+---------------+
| employee_id | start_date | end_date   | job_id  | department_id |
+-------------+------------+------------+---------+---------------+
|         101 | 2024-01-01 | 2024-12-31 | IT_PROG |            10 |
+-------------+------------+------------+---------+---------------+
1 row in set (0.01 sec)
