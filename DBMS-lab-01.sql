show databases;
-- here the word "databases" is imp and cant be written database 
-- and this command will show all the databases present in the MySQL server.

create database mydb;
-- This command creates a new database named 'mydb'

use mydb;
-- This command selects the 'mydb' database for use

select database();
-- it checks what database is selected

-- now we will create a table names anything we want, here we will create a table named 'students'
create table students(roll int, name varchar(30), class varchar(20), marks float, primary key(roll));
-- here varchar(30) is right and it can never be written as varchar[30]
-- primary key(roll) means that the roll number will be unique for each student and cant be null

show tables;
-- This command will show all the tables present in the selected database
-- here the word "tables" can not be written as table

desc students;
-- This will show the structure of the 'students' table, including column names, data types, and constraints.
-- desc is short for describe and can also be written as describe students;

insert into students(roll, name, class, marks) value(06, "akshara", "mca III", 98);
-- This command inserts a new record into the 'students' table with the specified values for roll, name, class, and marks.
-- Note that the roll number must be unique due to the primary key constraint.

-- it can also be written as
insert into students value(11, "anjali", "mca III", 88);
-- the professional way is to write "values" instead of "value" but both are correct and will work fine.

select * from students;
-- This command will show all records from the 'students' table and displays them.

update students set marks=100 where roll=06;
-- This command updates the marks of the student with roll number 06 to 100.
-- but if we didnt specify the roll number, it would update the marks for all students in the table.

delete from students where roll=11;
-- This command deletes the record of the student with roll number 11 from the table

create table dup_students like students;
-- makes a duplicate of a table as it is

