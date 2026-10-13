mysql> use dblab1;
Database changed
mysql> select database();
+------------+
| database() |
+------------+
| dbms_lab   |
+------------+
1 row in set (0.00 sec)

mysql> show tables;
+--------------------+
| Tables_in_dbms_lab |
+--------------------+
| countries          |
+--------------------+
1 row in set (0.01 sec)

mysql> create table if not exists
    -> countries(
    -> count_id int,
    -> count_name char(30),
    -> region_id varchar(30);
Query OK, 0 rows affected, 1 warning (0.03 sec)

mysql> desc countries;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| count_id   | int         | NO   | PRI | NULL    |       |
| count_name | char(30)    | YES  |     | NULL    |       |
| region_id  | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)
