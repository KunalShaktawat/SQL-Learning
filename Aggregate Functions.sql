-- Aggregate functions(to perform the calculation on set of rows)

-- count
use world;
select * from country;
select count(indepyear) from country;
select count(*),count(indepyear) from country;  --
-- distinct
select count(distinct continent) from country;
select distinct continent ,region from country;
select count(population),sum(population),avg(population) from country;
select * from country;
select governmentform from country; 
select count(distinct governmentform) from country;
select count(governmentform),count(distinct governmentform) from country where continent ='asia';

select count(name),sum(population),count(distinct indepyear) from country where continent='africa';

-- Q.1 get the total countries the avg surface ,total poulation for
-- the countries which has got their independence from the year 1947 to 1998 year not included
select count(name),avg(surfacearea),sum(population) from country where indepyear>1947 and indepyear<1998;

--    Q.2 Get the total number of countries, and number of unique continents along with the avg population and 
--        the total number of capitals for the countries whose name starting with a or d.
select count(name),count(distinct continent),avg(population),sum(capital) 
from country 
where name like 'a%' or name like'd%'; 
