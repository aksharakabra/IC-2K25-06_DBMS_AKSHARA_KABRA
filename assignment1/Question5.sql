-- 5. Write a SQL statement to create a table countries set a constraint NULL
mysql> use dblab1;
Database changed
mysql> create table countries_null(country_id INT,
    ->     country_name VARCHAR(50) NULL,
    ->     region_id INT
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> desc countries_null;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| country_id   | int         | YES  |     | NULL    |       |
| country_name | varchar(50) | YES  |     | NULL    |       |
| region_id    | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into countries_null (country_id, country_name, region_id)
    -> VALUES (1, NULL, 1);
Query OK, 1 row affected (0.03 sec)

mysql> select * from countries_null;
+------------+--------------+-----------+
| country_id | country_name | region_id |
+------------+--------------+-----------+
|          1 | NULL         |         1 |
+------------+--------------+-----------+
1 row in set (0.00 sec)
