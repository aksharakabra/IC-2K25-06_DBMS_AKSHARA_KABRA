mysql> create table dblab1;
ERROR 1046 (3D000): No database selected
mysql> create database dblab1;
Query OK, 1 row affected (0.07 sec)

mysql> use dblab1;
Database changed
mysql> create table countries(count_id int, count_name char(30), region_id varchar(30), primary key(count_id));
Query OK, 0 rows affected (0.09 sec)

mysql> show tables;
+------------------+
| Tables_in_dblab1 |
+------------------+
| countries        |
+------------------+
1 row in set (0.05 sec)

mysql> desc countries;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| count_id   | int         | NO   | PRI | NULL    |       |
| count_name | char(30)    | YES  |     | NULL    |       |
| region_id  | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.04 sec)

mysql> insert into countries(count_id,count_name,region_id) value(91, "india", "ISO 3166-1 alpha-2");
Query OK, 1 row affected (0.04 sec)

mysql> select * from countries;
+----------+------------+--------------------+
| count_id | count_name | region_id          |
+----------+------------+--------------------+
|       91 | india      | ISO 3166-1 alpha-2 |
+----------+------------+--------------------+
1 row in set (0.00 sec)
