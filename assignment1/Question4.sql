-- 4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries.
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| dblab1             |
| dbms               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.07 sec)

mysql> use dblab1;
Database changed
mysql> show tables;
+------------------+
| Tables_in_dblab1 |
+------------------+
| countries        |
| dup_countries    |
+------------------+
2 rows in set (0.04 sec)

mysql> desc dup_countries;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| count_id   | int         | NO   | PRI | NULL    |       |
| count_name | char(30)    | YES  |     | NULL    |       |
| region_id  | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.04 sec)

mysql> desc countries;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| count_id   | int         | NO   | PRI | NULL    |       |
| count_name | char(30)    | YES  |     | NULL    |       |
| region_id  | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * countries;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'countries' at line 1
mysql> select * from countries;
+----------+------------+--------------------+
| count_id | count_name | region_id          |
+----------+------------+--------------------+
|       91 | india      | ISO 3166-1 alpha-2 |
+----------+------------+--------------------+
1 row in set (0.04 sec)

mysql> drop table dup_countries;
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE dup_countries AS
    -> SELECT * FROM countries;
Query OK, 1 row affected (0.07 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> select * from dup_countries;
+----------+------------+--------------------+
| count_id | count_name | region_id          |
+----------+------------+--------------------+
|       91 | india      | ISO 3166-1 alpha-2 |
+----------+------------+--------------------+
1 row in set (0.00 sec)
