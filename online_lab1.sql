--different types of select * from table 
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

mysql> use dblab1;
Database changed
mysql> show tables;
+------------------+
| Tables_in_dblab1 |
+------------------+
| countries        |
| countries_null   |
| dup_countries    |
| jobs             |
+------------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM countries;
+----------+------------+--------------------+
| count_id | count_name | region_id          |
+----------+------------+--------------------+
|       91 | india      | ISO 3166-1 alpha-2 |
+----------+------------+--------------------+
1 row in set (0.00 sec)

mysql> SELECT country_id, country_name FROM countries;
ERROR 1054 (42S22): Unknown column 'country_id' in 'field list'
mysql> SELECT count_id, count_name FROM countries;
+----------+------------+
| count_id | count_name |
+----------+------------+
|       91 | india      |
+----------+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM countries where count_id=91;
+----------+------------+--------------------+
| count_id | count_name | region_id          |
+----------+------------+--------------------+
|       91 | india      | ISO 3166-1 alpha-2 |
+----------+------------+--------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM countries where count_id=92;
Empty set (0.03 sec)

mysql> SELECT * FROM jobs WHERE max_salary <= 25000;
+--------+--------------------+------------+------------+
| job_id | job_title          | min_salary | max_salary |
+--------+--------------------+------------+------------+
|      1 | Software Developer |   10000.00 |   25000.00 |
+--------+--------------------+------------+------------+
1 row in set (0.00 sec)

mysql> insert into countries values(81, "usa", "us-ca");
Query OK, 1 row affected (0.04 sec)

mysql> insert into countries values(61, "canada", "ca-on");
Query OK, 1 row affected (0.03 sec)

mysql> insert into countries values(51, "australia", "au_nsw");
Query OK, 1 row affected (0.03 sec)

mysql> select * from countries;
+----------+------------+--------------------+
| count_id | count_name | region_id          |
+----------+------------+--------------------+
|       51 | australia  | au_nsw             |
|       61 | canada     | ca-on              |
|       81 | usa        | us-ca              |
|       91 | india      | ISO 3166-1 alpha-2 |
+----------+------------+--------------------+
4 rows in set (0.00 sec)

mysql> SELECT MIN(count_id) FROM countries;
+---------------+
| MIN(count_id) |
+---------------+
|            51 |
+---------------+
1 row in set (0.03 sec)

mysql> SELECT Max(count_id) FROM countries;
+---------------+
| Max(count_id) |
+---------------+
|            91 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT avg(count_id) FROM countries;
+---------------+
| avg(count_id) |
+---------------+
|       71.0000 |
+---------------+
1 row in set (0.03 sec)

mysql> select * from countries where count_name like '%i';
Empty set (0.03 sec)
