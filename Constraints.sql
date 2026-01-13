-- Constraints in sql:-  SQL constraints are rules used to limit the type of data that can go into a table, ensuring
--                       the accuracy, reliability, and integrity of the information stored in a database

-- Sturcture [Data defintion language]
-- create,alter,drop,truncate
use college;
create table test1(sno int);

-- DML (create, alter,delete,merge)
insert into test1 values(10);
insert into test1(sno) values(20);
insert into test1(sno) values(null),(30);

select * from test1;
select count(sno),count(*) from test1;

-- Not Null
create table test2(sno int not null,salary int);
insert into test2(sno,salary) values(20,10000);
insert into test2(sno,salary) values(21,null);
insert into test2(sno,salary) values(null,10000); -- error
insert into test2(salary) values(30000); -- error
select * from test2;

-- Default
create table test3(sno int not null default 80,salary int);
insert into test3(salary) values(40000);
insert into test3(sno) values(1000);
select * from test3;

-- Unique
create table test4(sno int not null, salary int unique default 100);
insert into test4(sno,salary) values(1000,40000);
insert into test4(sno,salary) values(1001,40000); -- error duplicate values
insert into test4(sno) values(1002);
insert into test4(sno) values(1003);  -- erro default 100 already in table
insert into test4(sno,salary) values(1004,null);
insert into test4(sno,salary) values(1005,null);
select * from test4;

-- Check
create table test5 (sno int, salary int, check(sno between 1 and 100), check (salary in (1000,2000)));

insert into test5(sno,salary) values(4,1000);
insert into test5(sno,salary) values(150,1000); -- error
insert into test5(sno,salary) values(10,1500); -- error

-- Check with the name
create table test6 (sno int, salary int,
constraint college_test6_sno_check check(sno between 1 and 100), 
constraint college_test6_salary_check check (salary in (1000,2000)));

insert into test6(sno,salary) values(4,1000);
insert into test6(sno,salary) values(150,1000); -- error
insert into test6(sno,salary) values(10,1500); -- error

-- Primary Key
create table test7(sno int primary key,salary int);
insert into test7(sno,salary) values(4,1000); 
insert into test7(sno,salary) values(null,1000); -- error

-- Foriegn key
drop table customer1;
create table customer1(cid int primary key, cname varchar(20));
insert into customer1 values(10,'Aman'),(11,'Abhishek');
select * from customer1;

create table order1(order_no int primary key,city varchar(20),cid int);
insert into order1 values(1000,'jaipur',10),(1001,'abc',11),(1003,'jaipur',10);
insert into order1 values(1005,'mumbai',14);
select * from order1;

drop table order1;
create table order1(order_no int primary key,city varchar(20),cid int,
foreign key(cid) references customer1(cid));
insert into order1 values(1000,'jaipur',10),(1001,'abc',11),(1003,'jaipur',10);
insert into order1 values(1005,'mumbai',14);
select * from order1;
desc order1;
