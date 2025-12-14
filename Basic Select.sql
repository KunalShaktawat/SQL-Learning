select database();
show tables;
desc city;
-- to print all city tables data
select * from city;
-- to access columns
select name,population from city;
-- columns can be in any order
select district,name from city;
-- multiple line
SELECT name,population,countrycode,population 
FROM city;
select name,population+10 from city;
-- sql is not case sensitive
select NAME from city;
-- alias is used for nickname
select name,population+10 as 'newpopulation' from city;
