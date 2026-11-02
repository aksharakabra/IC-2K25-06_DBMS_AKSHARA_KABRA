-- inner join- returns only rows that are common in both tables
-- syntex-
-- select alias.column, alias2.column from child_table alias inner join parent_table alias2 on alias.common_column = alias2.common_column;
mysql> select s.roll, s.name, t.teach_name from students s inner join teachers t on s.teach_id = t.teach_id;
+------+---------+------------+
| roll | name    | teach_name |
+------+---------+------------+
|    6 | akshara | subodh     |
|   10 | anjali  | deepanshu  |
|   25 | darshan | rahul      |
|   51 | misba   | shaligram  |
+------+---------+------------+
4 rows in set (0.00 sec)
