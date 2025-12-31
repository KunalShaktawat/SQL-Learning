-- Basic Practice --
show databases;
use db;
show tables;
desc employee;
select * from employee;

use school;
show tables;
select * from student;
select * from student where name like'R%';

use abc;
show tables;
select * from a1;

use a;
show tables;

use regex;
select * from employee;
select * from employee where salary < 50000;
select * from employee where salary > 50000 and emp_name like '%ce';