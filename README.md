# IC-2K25-06_DBMS_AKSHARA_KABRA
<pre> <h3>show databases;</h3>
-- here the word "databases" is imp and cant be written database 
-- and this command will show all the databases present in the MySQL server.

<h3>create database mydb;</h3>
-- This command creates a new database named 'mydb'

<h3>use mydb;</h3>
-- This command selects the 'mydb' database for use

<h3>select database();</h3>
-- it checks what database is selected

-- now we will create a table names anything we want, here we will create a table named 'students'
<h3>create table students(roll int, name varchar(30), class varchar(20), marks float, primary key(roll));</h3>
-- here varchar(30) is right and it can never be written as varchar[30]
-- primary key(roll) means that the roll number will be unique for each student and cant be null
--apart from int ,varchar and char we can use null and not null if we want the coloumn to be null or not null

<h3>show tables;</h3>
-- This command will show all the tables present in the selected database
-- here the word "tables" can not be written as table

<h3>desc students;</h3>
-- This will show the structure of the 'students' table, including column names, data types, and constraints.
-- desc is short for describe and can also be written as describe students;

<h3>insert into students(roll, name, class, marks) value(06, "akshara", "mca III", 98);</h3>
-- This command inserts a new record into the 'students' table with the specified values for roll, name, class, and marks.
-- Note that the roll number must be unique due to the primary key constraint.

-- it can also be written as
<h3>insert into students value(11, "anjali", "mca III", 88);</h3>
-- the professional way is to write "values" instead of "value" but both are correct and will work fine.

<h3>select * from students;</h3>
-- This command will show all records from the 'students' table and displays them.

<h3>update students set marks=100 where roll=06;</h3>
-- This command updates the marks of the student with roll number 06 to 100.
-- but if we didnt specify the roll number, it would update the marks for all students in the table.

<h3>delete from students where roll=11;</h3>
-- This command deletes the record of the student with roll number 11 from the table

<h3>create table dup_students like students;</h3>
-- makes a duplicate of a table but only the headings

<h3>CREATE TABLE dup_countries AS
SELECT * FROM countries;</h3>
-- makes a duplicate of a table heading+data 

<h3>DROP TABLE dup_countries;</h3>
-- deletes the table

  <h3>drop database mydb;</h3>
--deletes database
