-- Window Functions 

use world;
select code,name,population from country;
select sum(population) from country;  -- 6078749450
select code,name,population,6078749450 from country;
select code,name,population,(select sum(population) from country) from country;

-- over()
select code,name,sum(population) over() from country;
select code,name,population,sum(population) over(),avg(population) over() from country;

-- partition by
select continent,sum(population) from country group by continent;
-- -- asia/3705025700
select code,name,population,continent,sum(population) over(),sum(population) over(partition by continent) from country;
select code,name,population,continent,sum(population) over(partition by continent),min(population) over(partition by continent) from country;
select code,name,continent,region,population,sum(population) over(partition by continent),sum(population) over(partition by continent,region) from country;

-- running sum or cummulative sum
select code,name,population,sum(population) over(order by population) from country;

-- using small tables
use window_fn_practice;

select * from employees;
select *,sum(salary) over() from employees;
select *,sum(salary) over(),sum(salary) over(partition by department),sum(salary) over(partition by department,city) from employees;

-- order by
-- running sum
select *,sum(salary) over(order by salary) from employees;
select *,sum(salary) over(order by full_name) from employees;
select *,sum(salary) over(order by city) from employees;
-- running sum on each department
select *,sum(salary) over(partition by department),sum(salary) over(partition by department order by salary) from employees;
select *,sum(salary) over(partition by department),sum(salary) over(partition by department order by salary) from employees;

-- row_number() => to define a unique values
select *,row_number() over() from employees;
select *,row_number() over(partition by department order by hire_date) from employees;

-- rank()
select *,rank() over(order by salary) from employees;
select *,rank() over(order by hire_date) from employees;
select *,rank() over(order by city) from employees;

-- What is the differnce between rank(), dense_rank(), row_number
-- dense_rank()
select *, dense_rank() over(order by city) from employees;
select *, dense_rank() over(partition by department order by salary desc) from employees;
