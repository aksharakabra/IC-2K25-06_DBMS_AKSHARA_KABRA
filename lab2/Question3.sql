mysql> use dblab1;
Database changed
mysql> show tables;
+--------------------+
| Tables_in_dbms_lab |
+--------------------+
| countries          |
+--------------------+
1 row in set (0.01 sec)

mysql> desc countries;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| count_id   | int         | NO   | PRI | NULL    |       |
| count_name | char(30)    | YES  |     | NULL    |       |
| region_id  | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> create table dup_countries like countries;
Query OK, 0 rows affected (0.07 sec)

mysql> show tables;
+--------------------+
| Tables_in_dbms_lab |
+--------------------+
| countries          |
| dup_countries      |
+--------------------+
2 rows in set (0.01 sec)

mysql> desc dup_countries;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| count_id   | int         | NO   | PRI | NULL    |       |
| count_name | char(30)    | YES  |     | NULL    |       |
| region_id  | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> select * from dup_countries;
Empty set (0.01 sec)

mysql>
