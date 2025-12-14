use world;
show tables;
select * from city;
-- == Where Clause ==
-- where clause is used to filters the rows data
select * from city where district='Zuid-Holland';
select * from city where countrycode='ARG';

-- population more than 6 lakh
select * from city where population>600000;

-- != <> can also used as not equal
select * from city where countrycode != 'ARG'; 
  
-- in operator
desc country;
select * from country where continent='North America';
select * from country where continent='Europe';
select * from country where continent in ('North America','Europe');

-- indepyear
select name,continent from country where IndepYear in(1901,1960);
select name,continent from country where IndepYear not in(1901,1960);
-- range of values 
select name,Continent,indepyear from country where IndepYear between 1901 and 1960;
select name,Continent,indepyear from country where IndepYear not between 1901 and 1960;

-- Q.1 Get the name, indepyear, and population with a expected 10% increment of population
select name,indepyear,population,population+population*0.1 as 'newpopulation' from country;

-- Q.2 Get the code, name and region where the region is not the middle east.
select name, code, region from country where region !='middleeast';

-- Q.3 Get nmae from the country where lifeexpectancy = 38.3 or 66.4
select name from country where LifeExpectancy in (38.3,66.4);

-- Q.4 Get the name,continent,population,gnp column from the table where the population is not from 5000 to 200000
select name,continent,population,gnp from country where Population not between 5000 and 200000;

-- like operator:- to search for a pattern in text (string) values.
select name,continent from country where continent like 'asia';
select name,continent from country where continent not like 'asia';

-- Wildcards are special characters used with the LIKE operator to match patterns in text.
-- % [zero or more characters]
select name,continent from country where name like 'A%';
select name,continent from country where name like '%a%';
-- _ [Underscore only one character]
select name,continent from country where name like '_c';

-- Logical operators AND,OR,NOT
select name,continent from country where continent='Asia' or continent='Africa';
 -- select name,continent from country where continent='Asia' and continent='Africa';
 -- we cannot use AND operator in one column because One row cannot have continent = 'Asia' 
 -- and at the same time continent = 'Africa'.
 
 select * from country where continent='Africa' and Region='middle east';
select * from country where continent='Africa' or Region='middle east';