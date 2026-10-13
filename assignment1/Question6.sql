-- Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and 
-- check whether the max_salary amount exceeding theupper limit 25000.

mysql> use dblab1;
Database changed
mysql> create table countries_null(country_id INT,
    ->     country_name VARCHAR(50) NULL,
    ->     region_id INT
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> DESC countries_null;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| country_id   | int         | YES  |     | NULL    |       |
| country_name | varchar(50) | YES  |     | NULL    |       |
| region_id    | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> INSERT INTO countries_null (country_id, country_name, region_id)
    -> VALUES (1, NULL, 1);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM countries_null;
+------------+--------------+-----------+
| country_id | country_name | region_id |
+------------+--------------+-----------+
|          1 | NULL         |         1 |
+------------+--------------+-----------+
1 row in set (0.00 sec)

mysql> CREATE TABLE jobs (
    ->     job_id INT,
    ->     job_title VARCHAR(50),
    ->     min_salary DECIMAL(10,2),
    ->     max_salary DECIMAL(10,2),
    ->     CHECK (max_salary <= 25000)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> desc jobs;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| job_id     | int           | YES  |     | NULL    |       |
| job_title  | varchar(50)   | YES  |     | NULL    |       |
| min_salary | decimal(10,2) | YES  |     | NULL    |       |
| max_salary | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> show create table jobs;
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                                                                  |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| jobs  | CREATE TABLE `jobs` (
  `job_id` int DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `min_salary` decimal(10,2) DEFAULT NULL,
  `max_salary` decimal(10,2) DEFAULT NULL,
  CONSTRAINT `jobs_chk_1` CHECK ((`max_salary` <= 25000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> INSERT INTO jobs
    -> (job_id, job_title, min_salary, max_salary)
    -> VALUES
    -> (1, 'Software Developer', 10000, 25000);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO jobs
    -> (job_id, job_title, min_salary, max_salary)
    -> VALUES
    -> (2, 'Senior Developer', 20000, 30000);
ERROR 3819 (HY000): Check constraint 'jobs_chk_1' is violated.
mysql>
