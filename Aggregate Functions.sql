-- Aggregate functions(to perform the calculation on set of rows)(multiline functions)

-- Count
use world;
select * from country;
select count(name) from country;
select count(indepyear) from country; -- not count null values
select count(*) from country;   -- count null values also
select count(*),count(indepyear) from country;  

-- DISTINCT is used to remove duplicate values from the result set.
select continent,region from country;
select distinct continent,region from country;
select count(distinct continent) from country;

select count(population),sum(population),avg(population) from country;
select * from country;
select governmentform from country; 
select count(distinct governmentform) from country;
select count(governmentform),count(distinct governmentform) from country where continent ='asia';

-- we cannot use sum() on string columns
select count(name),sum(population),count(distinct indepyear) from country where continent='africa';

-- Q.1 get the total countries the avg surface ,total poulation for
-- the countries which has got their independence from the year 1947 to 1998 year not included
select count(name),avg(surfacearea),sum(population) from country where indepyear>1947 and indepyear<1998;

-- Q.2 Get the total number of countries, and number of unique continents along with the avg population and 
-- the total number of capitals for the countries whose name starting with a or d.
select count(name),count(distinct continent),avg(population),sum(capital) 
from country 
where name like 'a%' or name like'd%'; 

-- Q.3 Find total poulation the africa continent
select sum(population) from country where continent='africa';
select continent,sum(population) from country where continent='africa' group by continent;

-- Q.4 Total countries, total population, toal indep year (unique) in contntinent africa
select count(name),sum(population),count(distinct indepyear) from country where continent='africa';

-- Standard SQL rule:
-- When aggregate functions and normal columns are used together, GROUP BY is required.
select continent, count(name) from country where continent='asia';  -- it runs but only beacuse of MySQl

-- Problem: Total number of countries present in each continent.
select count(name) from country where continent='asia'; -- toatal countries in asia
select count(name) from country where continent='africa'; -- total countries in africa
select count(name) from country where continent='europe'; -- toatl countries in europe

-- Group By
select continent from country group by continent;
-- or
select distinct continent from country;

select continent,count(*),count(continent) from country group by continent;

select indepyear,count(*),count(indepyear) from country group by indepyear;

select continent,count(name),sum(population),avg(population),max(population),min(population),max(indepyear),min(indepyear) from country group by continent;

select * from city;
-- Q.5 from the city table find the total cities,total district,unique district,total poulation
select countrycode,count(*),count(district),count(distinct district),sum(population) from city group by countrycode;
