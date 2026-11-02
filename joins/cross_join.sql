mysql> select s.roll, s.name, t.teach_name from students s cross join teachers t;
+------+---------+------------+
| roll | name    | teach_name |
+------+---------+------------+
|   51 | misba   | subodh     |
|   50 | mayank  | subodh     |
|   25 | darshan | subodh     |
|   10 | anjali  | subodh     |
|    6 | akshara | subodh     |
|   51 | misba   | deepanshu  |
|   50 | mayank  | deepanshu  |
|   25 | darshan | deepanshu  |
|   10 | anjali  | deepanshu  |
|    6 | akshara | deepanshu  |
|   51 | misba   | shaligram  |
|   50 | mayank  | shaligram  |
|   25 | darshan | shaligram  |
|   10 | anjali  | shaligram  |
|    6 | akshara | shaligram  |
|   51 | misba   | rahul      |
|   50 | mayank  | rahul      |
|   25 | darshan | rahul      |
|   10 | anjali  | rahul      |
|    6 | akshara | rahul      |
|   51 | misba   | ragini     |
|   50 | mayank  | ragini     |
|   25 | darshan | ragini     |
|   10 | anjali  | ragini     |
|    6 | akshara | ragini     |
+------+---------+------------+
25 rows in set (0.00 sec)
