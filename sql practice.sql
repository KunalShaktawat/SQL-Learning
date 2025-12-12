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



