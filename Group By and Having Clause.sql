-- group by

use world;

select region,count(name),count(continent) from country group by region;
select region,avg(population)from country group by region;

select * from city;
select district, count(name) as TotalCity from city group by district;

-- count cities which have a population of more than 1lakh 
-- where (sabse phle execute) => group by =>count()
select district, count(name) from city where population>100000 group by district;

select * from country;
select count(name) from country where continent='Asia' and indepyear>1950;
select continent,count(name) from country where indepyear>1950 group by continent;

-- get total country which got there independence after 1950 in each continent
select continent,count(name) from country where indepyear>1950 group by continent;

select continent, sum(population) from country group by continent;
select * from country;
-- Difference between where and having clause
-- where clause is used to filter data from the tables
-- having is used to filter data in the aggregate functions
select continent, sum(population) 
from country 
group by continent
having sum(population)>30401150;

select * from country;

select continent,sum(population) from country where lifeexpectancy>35.0 group by continent;
-- find the total countries for each government form where the total number of countries should be greater than 30
select governmentform,count(name) from country group by governmentform having count(name)>30;
select governmentform,count(name) from country group by governmentform having count(name)>30;

-- find the only for the countries having their capital >30 and total population greater than 3lakh
select governmentform,count(name),sum(population) from country where capital>30 group by governmentform having sum(population)>300000;
-- group can also divide in groups
select continent,count(name) from country group by continent;
select continent,region,count(name) from country group by continent,region;