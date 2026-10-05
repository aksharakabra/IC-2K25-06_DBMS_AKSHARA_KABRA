mysql> create database customer_order;
Query OK, 1 row affected (0.04 sec)

mysql> create table customer;
ERROR 1046 (3D000): No database selected
mysql> use customer_order;
Database changed

mysql> create table customer(customer_id varchar(20), name varchar(20), address varchar(30), contact_no int(10) ,primary key(customer_id));
Query OK, 0 rows affected, 1 warning (0.07 sec)

mysql> show tables;
+--------------------------+
| Tables_in_customer_order |
+--------------------------+
| customer                 |
+--------------------------+
1 row in set (0.04 sec)

mysql> desc customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| customer_id | varchar(20) | NO   | PRI | NULL    |       |
| name        | varchar(20) | YES  |     | NULL    |       |
| address     | varchar(30) | YES  |     | NULL    |       |
| contact_no  | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.04 sec)

mysql> alter table customer modify column contact_no varchar(10);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into customer value("13AC3", "mukesh", "bhawarkua indore, mp", 9876789051);
Query OK, 1 row affected (0.03 sec)

mysql> select * from customer;
+-------------+--------+----------------------+------------+
| customer_id | name   | address              | contact_no |
+-------------+--------+----------------------+------------+
| 13AC3       | mukesh | bhawarkua indore, mp | 9876789051 |
+-------------+--------+----------------------+------------+
1 row in set (0.00 sec)

mysql> insert into customer value("13RM4", "ramesh", "mhow indore, mp", 9876786551);
Query OK, 1 row affected (0.03 sec)

mysql> insert into customer value("13SR5", "suresh", "rajwada indore, mp", 6260786551);
Query OK, 1 row affected (0.03 sec)

mysql> select * from customer;
+-------------+--------+----------------------+------------+
| customer_id | name   | address              | contact_no |
+-------------+--------+----------------------+------------+
| 13AC3       | mukesh | bhawarkua indore, mp | 9876789051 |
| 13RM4       | ramesh | mhow indore, mp      | 9876786551 |
| 13SR5       | suresh | rajwada indore, mp   | 6260786551 |
+-------------+--------+----------------------+------------+
3 rows in set (0.00 sec)

mysql> create table order;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order' at line 1
mysql> use customer_order;
Database changed

mysql> create table orders(order_id int, name varchar(20),rate_per_unit float, quantity int, amount float,customer_id varchar(20), primary key(order_id), FOREIGN KEY(customer_id) REFERENCES customer(customer_id));
Query OK, 0 rows affected (0.07 sec)

mysql> desc orders;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| order_id      | int         | NO   | PRI | NULL    |       |
| name          | varchar(20) | YES  |     | NULL    |       |
| rate_per_unit | float       | YES  |     | NULL    |       |
| quantity      | int         | YES  |     | NULL    |       |
| amount        | float       | YES  |     | NULL    |       |
| customer_id   | varchar(20) | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> insert into orders value(23, "mukesh", 100, 10, 1000, "13AC3");
Query OK, 1 row affected (0.04 sec)

mysql> insert into orders value(24, "ramesh", 10, 13, 130, "13RM4");
Query OK, 1 row affected (0.03 sec)

mysql> insert into orders value(25, "suresh", 100, 17, 1700, "13SR4");
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`customer_order`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`))
mysql> insert into orders value(25, "suresh", 100, 17, 1700, "13SR5");
Query OK, 1 row affected (0.03 sec)

mysql> select * from orders;
+----------+--------+---------------+----------+--------+-------------+
| order_id | name   | rate_per_unit | quantity | amount | customer_id |
+----------+--------+---------------+----------+--------+-------------+
|       23 | mukesh |           100 |       10 |   1000 | 13AC3       |
|       24 | ramesh |            10 |       13 |    130 | 13RM4       |
|       25 | suresh |           100 |       17 |   1700 | 13SR5       |
+----------+--------+---------------+----------+--------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM customer
    -> INNER JOIN orders
    -> ON customer.customer_id = orders.customer_id;
+-------------+--------+----------------------+------------+----------+--------+---------------+----------+--------+-------------+
| customer_id | name   | address              | contact_no | order_id | name   | rate_per_unit | quantity | amount | customer_id |
+-------------+--------+----------------------+------------+----------+--------+---------------+----------+--------+-------------+
| 13AC3       | mukesh | bhawarkua indore, mp | 9876789051 |       23 | mukesh |           100 |       10 |   1000 | 13AC3       |
| 13RM4       | ramesh | mhow indore, mp      | 9876786551 |       24 | ramesh |            10 |       13 |    130 | 13RM4       |
| 13SR5       | suresh | rajwada indore, mp   | 6260786551 |       25 | suresh |           100 |       17 |   1700 | 13SR5       |
+-------------+--------+----------------------+------------+----------+--------+---------------+----------+--------+-------------+
3 rows in set (0.00 sec)
