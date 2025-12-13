use world;


select code,name,region from country where region!='middle east';
select Name,IndepYear,Population+Population*0.1 from country;
select *from country where LifeExpectancy in(38.3,66.4);
select name,continent,population,gnp from country where population not between 5000 and 200000;

show databases;

select name,continent,region from country where continent not like 'europe';
select name,continent,region from country where region like '_a%';
select name,continent,region from country where continent like '%i__';
select name,continent,region from country where continent like '_____%';
select name,continent,region from country where continent like '_c%i_';
select name,continent,region from country where continent like '%a_a%';

-- functions
/* set of statements */
-- String functions
-- case conversion --
select name,continent,upper(name), lower(name) from country;
select name,continent, concat(continent,'-',code,'-','regex') from country;
-- concat with separator
select name,continent, concat_ws('-',continent,code,'regex') from country;
-- substr. (substring) => character extract based on the position
select name, substr(name,2), substr(name,2,3) from country;
select name, substring(name,3) from country;


-- ===============================
-- Day 02 : Numeric and Date function
-- Date  : 13-Dec-2025
-- ===============================

-- numeric functions
use world;
select lifeexpectancy,round(lifeexpectancy) from country;
select 83.69,round(83.687,2);
-- hundred place,tenth place,once place
-- round method
select(456.23),round(456.23,-1);
select(46.23),round(555.23,-2);
-- truncate method
select 566.56,truncate(566.56,1);
-- mod
select 43,3,mod(43,3);
-- pow
select pow(2,3);
-- ciel and floor
select ceil(3.000007),floor(3.999999);
-- Date
-- inbuilt date yh data and time print krna
select now(),curdate(),current_timestamp(),current_time();
-- add date
select now(),adddate(now(),2), adddate(now(), interval 3 month);
select now(),addtime(now(),20000);
select now(), subdate(now(),2), subdate(now(), interval 4 month);
select now(),year(now()),extract(WEEK from now());
select now() ,date_format(now(),'Month is %M & year is %y');




