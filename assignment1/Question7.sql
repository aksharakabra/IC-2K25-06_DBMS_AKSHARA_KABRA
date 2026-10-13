-- Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and
-- make sure that no countries except Italy, India and China will be entered in the table.

mysql> use dblab1;
Database changed
mysql> DROP TABLE countries;
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE countries ( country_id INT, country_name VARCHAR(50), region_id INT,CHECK (country_name IN ('Italy', 'India', 'China')) );
Query OK, 0 rows affected (0.09 sec)

mysql> DESC countries;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| country_id   | int         | YES  |     | NULL    |       |
| country_name | varchar(50) | YES  |     | NULL    |       |
| region_id    | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.04 sec)

mysql> INSERT INTO countries VALUES (1, 'India', 1);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO countries VALUES (2, 'China', 2);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO countries VALUES (3, 'Japan', 2);
ERROR 3819 (HY000): Check constraint 'countries_chk_1' is violated.
mysql> SELECT * FROM countries;
+------------+--------------+-----------+
| country_id | country_name | region_id |
+------------+--------------+-----------+
|          1 | India        |         1 |
|          2 | China        |         2 |
+------------+--------------+-----------+
2 rows in set (0.00 sec)

mysql> INSERT INTO countries VALUES (3, 'Italy', 3);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM countries;
+------------+--------------+-----------+
| country_id | country_name | region_id |
+------------+--------------+-----------+
|          1 | India        |         1 |
|          2 | China        |         2 |
|          3 | Italy        |         3 |
+------------+--------------+-----------+
3 rows in set (0.00 sec)
