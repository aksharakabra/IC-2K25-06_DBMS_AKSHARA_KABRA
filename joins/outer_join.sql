-- left join 
-- LEFT JOIN — returns all rows from the left table, plus matching rows from the right. Non-matches become NULL.
mysql> select s.roll, s.name, t.teach_name from students s left join teachers t on s.teach_id = t.teach_id;
+------+---------+------------+
| roll | name    | teach_name |
+------+---------+------------+
|    6 | akshara | subodh     |
|   10 | anjali  | deepanshu  |
|   25 | darshan | rahul      |
|   50 | mayank  | NULL       |
|   51 | misba   | shaligram  |
+------+---------+------------+
5 rows in set (0.00 sec)
-- right join
  -- RIGHT JOIN — returns all rows from the right table, plus matching rows from the left.
mysql> select s.roll, s.name, t.teach_name from students s right join teachers t on s.teach_id = t.teach_id;
+------+---------+------------+
| roll | name    | teach_name |
+------+---------+------------+
|    6 | akshara | subodh     |
|   10 | anjali  | deepanshu  |
|   51 | misba   | shaligram  |
|   25 | darshan | rahul      |
| NULL | NULL    | ragini     |
+------+---------+------------+
5 rows in set (0.00 sec)
-- full outer join
  -- FULL OUTER JOIN — returns all rows from both tables, whether they match or not.
mysql> select s.roll, s.name, t.teach_name from students s full outer join teachers t on s.teach_id = t.teach_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'full outer join teachers t on s.teach_id = t.teach_id' at line 1
-- full outer joinis not supported by mysql
 mysql> select s.roll, s.name, t.teach_name from students s right join teachers t on s.teach_id = t.teach_id union select s.roll, s.name, t.teach_name from students s left join teachers t on s.teach_id = t.teach_id;
+------+---------+------------+
| roll | name    | teach_name |
+------+---------+------------+
|    6 | akshara | subodh     |
|   10 | anjali  | deepanshu  |
|   51 | misba   | shaligram  |
|   25 | darshan | rahul      |
| NULL | NULL    | ragini     |
|   50 | mayank  | NULL       |
+------+---------+------------+
6 rows in set (0.00 sec)
