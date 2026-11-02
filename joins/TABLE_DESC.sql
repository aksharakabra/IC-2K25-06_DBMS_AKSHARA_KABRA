mysql> use dbms;
Database changed
mysql> select * from students;
+------+---------+---------+-------+
| roll | name    | class   | marks |
+------+---------+---------+-------+
|    6 | akshara | mca III |   100 |
+------+---------+---------+-------+
1 row in set (0.04 sec)

mysql> show create table students;
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table                                                                                                                                                                                                                                    |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| students | CREATE TABLE `students` (
  `roll` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `class` varchar(30) DEFAULT NULL,
  `marks` float DEFAULT NULL,
  PRIMARY KEY (`roll`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.03 sec)

mysql> alter table students add teach_id int;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update students set teach_id = 20;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> create table teachers(teach_id int primary key, teach_name varchar(20), teach_sub varchar(10));
Query OK, 0 rows affected (0.06 sec)

mysql> alter table teachers modify teach_sub varchar(20);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into teachers values(20, "subodh", "probability");
Query OK, 1 row affected (0.03 sec)

mysql> insert into teachers values(30, "deepanshu", "chemistry");
Query OK, 1 row affected (0.03 sec)

mysql> insert into teachers values(40, "shaligram", "DSA");
Query OK, 1 row affected (0.01 sec)

mysql> insert into teachers values(50, "rahul", "DBMS");
Query OK, 1 row affected (0.03 sec)

mysql> insert into students values(10, "anjali", "mcaIII", 39, 30);
Query OK, 1 row affected (0.03 sec)

mysql> insert into students values(51, "misba", "mcaIII", 67, 40);
Query OK, 1 row affected (0.03 sec)

-- mysql> alter table students modify class set default 'mac III';
-- ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'default 'mac III'' at line 1
mysql> alter table students alter column class set default 'mac III';
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into students values(25, "darshan", default, 97, 50);
Query OK, 1 row affected (0.03 sec)

-- mysql> alter table students foreign key (teach_id) references teachers(teach_id);
-- ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'foreign key (teach_id) references teachers(teach_id)' at line 1
mysql> alter table students add foreign key (teach_id) references teachers(teach_id);
Query OK, 4 rows affected (0.12 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from students, teachers;
+------+---------+---------+-------+----------+----------+------------+-------------+
| roll | name    | class   | marks | teach_id | teach_id | teach_name | teach_sub   |
+------+---------+---------+-------+----------+----------+------------+-------------+
|   51 | misba   | mcaIII  |    67 |       40 |       20 | subodh     | probability |
|   25 | darshan | mac III |    97 |       50 |       20 | subodh     | probability |
|   10 | anjali  | mcaIII  |    39 |       30 |       20 | subodh     | probability |
|    6 | akshara | mca III |   100 |       20 |       20 | subodh     | probability |
|   51 | misba   | mcaIII  |    67 |       40 |       30 | deepanshu  | chemistry   |
|   25 | darshan | mac III |    97 |       50 |       30 | deepanshu  | chemistry   |
|   10 | anjali  | mcaIII  |    39 |       30 |       30 | deepanshu  | chemistry   |
|    6 | akshara | mca III |   100 |       20 |       30 | deepanshu  | chemistry   |
|   51 | misba   | mcaIII  |    67 |       40 |       40 | shaligram  | DSA         |
|   25 | darshan | mac III |    97 |       50 |       40 | shaligram  | DSA         |
|   10 | anjali  | mcaIII  |    39 |       30 |       40 | shaligram  | DSA         |
|    6 | akshara | mca III |   100 |       20 |       40 | shaligram  | DSA         |
|   51 | misba   | mcaIII  |    67 |       40 |       50 | rahul      | DBMS        |
|   25 | darshan | mac III |    97 |       50 |       50 | rahul      | DBMS        |
|   10 | anjali  | mcaIII  |    39 |       30 |       50 | rahul      | DBMS        |
|    6 | akshara | mca III |   100 |       20 |       50 | rahul      | DBMS        |
+------+---------+---------+-------+----------+----------+------------+-------------+
16 rows in set (0.00 sec)
  -- no need for foreign key in joins
mysql> alter table students drop foreign key students_ibfk_1;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into students values(50, "mayank", default, 69, 90);
Query OK, 1 row affected (0.03 sec)

mysql> insert into teachers values(80, "ragini", "IWP");
Query OK, 1 row affected (0.03 sec)
