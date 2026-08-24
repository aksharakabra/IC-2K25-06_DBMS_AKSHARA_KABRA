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
6 rows in set (0.00 sec)

mysql> create database mydb;
Query OK, 1 row affected (0.04 sec)

mysql> select database();
+------------+
| database() |
+------------+
| NULL       |
+------------+
1 row in set (0.00 sec)

mysql> create table students(roll int, name varchar(30), class varchar(20), marks float, primary key(roll));
ERROR 1046 (3D000): No database selected
mysql> use mydb;
Database changed
mysql> create table students(roll int, name varchar(30), class varchar(20), marks float, primary key(roll));
Query OK, 0 rows affected (0.06 sec)

mysql> insert into students(roll, name, class, marks) value(06, "akshara", "mca III", 98);
Query OK, 1 row affected (0.01 sec)

mysql> insert into students value(11, "anjali", "mca III", 88);
Query OK, 1 row affected (0.03 sec)

mysql> select * from students;
+------+---------+---------+-------+
| roll | name    | class   | marks |
+------+---------+---------+-------+
|    6 | akshara | mca III |    98 |
|   11 | anjali  | mca III |    88 |
+------+---------+---------+-------+
2 rows in set (0.00 sec)
