-- 16. Write a query to find the 5th maximum salary in the employees table.
mysql> SELECT salary FROM ( SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk FROM employees) AS ranked_salaries WHERE rnk = 5;
+--------+
| salary |
+--------+
| 300000 |
+--------+
1 row in set (0.03 sec)
