--9. Write a SQL statement to create a table named countries including columns country_id,country_name and region_id
-- and make sure that no duplicate data against column country_id will be allowed at the time of insertion.
mysql> use dblab1;
Database changed
mysql> drop ttable countries;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ttable countries' at line 1
mysql> drop table countries;
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE countries (
    ->     country_id INT PRIMARY KEY,
    ->     country_name VARCHAR(50),
    ->     region_id INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO countries VALUES (1, 'India', 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO countries VALUES (1, 'USA', 2);
ERROR 1062 (23000): Duplicate entry '1' for key 'countries.PRIMARY'
mysql>
