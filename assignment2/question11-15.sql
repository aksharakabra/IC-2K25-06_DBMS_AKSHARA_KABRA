-- 11. Write a query get all first name from employees table in upper case.
mysql> select upper(first_name) as 'first name' from employees;
+------------+
| first name |
+------------+
| REBECA     |
| BECKY      |
| ETHAN      |
| SOFIE      |
| ALEX       |
| AOUKI      |
| KENTA      |
| MIN        |
| CARL       |
| WILLIAM    |
| LILY       |
| KYLE       |
| PARK       |
| KIM        |
| JASMINE    |
+------------+
15 rows in set (0.03 sec)
--12. Write a query to get the first 3 characters of first name from employees table.
mysql> select substring(first_name,1,3) from employees;
+---------------------------+
| substring(first_name,1,3) |
+---------------------------+
| reb                       |
| bec                       |
| eth                       |
| sof                       |
| ale                       |
| aou                       |
| ken                       |
| min                       |
| car                       |
| wil                       |
| lil                       |
| kyl                       |
| par                       |
| kim                       |
| jas                       |
+---------------------------+
15 rows in set (0.03 sec)
--13. Write a query to calculate 171*214+625.
mysql> select 171*214+625;
+-------------+
| 171*214+625 |
+-------------+
|       37219 |
+-------------+
1 row in set (0.03 sec)
-- mysql> select first_name, last_name from employees;
-- +------------+-----------+
-- | first_name | last_name |
-- +------------+-----------+
-- | rebeca     | adams     |
-- | becky      | ellish    |
-- | ethan      | blackwood |
-- | sofie      | stewart   |
-- | alex       | carpanter |
-- | aouki      | nakayama  |
-- | kenta      | yamaguchi |
-- | min        | heseung   |
-- | carl       | bell      |
-- | william    | bull      |
-- | lily       | isabella  |
-- | kyle       | williams  |
-- | park       | sujin     |
-- | kim        | sohyun    |
-- | jasmine    | tata      |
-- +------------+-----------+
-- 15 rows in set (0.00 sec)

  --14. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.
mysql> select concat(first_name,'', last_name) as names from employees;
+----------------+
| names          |
+----------------+
| rebecaadams    |
| beckyellish    |
| ethanblackwood |
| sofiestewart   |
| alexcarpanter  |
| aoukinakayama  |
| kentayamaguchi |
| minheseung     |
| carlbell       |
| williambull    |
| lilyisabella   |
| kylewilliams   |
| parksujin      |
| kimsohyun      |
| jasminetata    |
+----------------+
15 rows in set (0.03 sec)

mysql> select concat(first_name,' ', last_name) as names from employees;
+-----------------+
| names           |
+-----------------+
| rebeca adams    |
| becky ellish    |
| ethan blackwood |
| sofie stewart   |
| alex carpanter  |
| aouki nakayama  |
| kenta yamaguchi |
| min heseung     |
| carl bell       |
| william bull    |
| lily isabella   |
| kyle williams   |
| park sujin      |
| kim sohyun      |
| jasmine tata    |
+-----------------+
15 rows in set (0.00 sec)
--15. Write a query to get first name from employees table after removing white spaces from both side
mysql> select trim(first_name) as names from employees;
+---------+
| names   |
+---------+
| rebeca  |
| becky   |
| ethan   |
| sofie   |
| alex    |
| aouki   |
| kenta   |
| min     |
| carl    |
| william |
| lily    |
| kyle    |
| park    |
| kim     |
| jasmine |
+---------+
15 rows in set (0.03 sec)
