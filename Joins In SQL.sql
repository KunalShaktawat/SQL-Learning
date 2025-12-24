-- Day: 01 Joins in SQL
-- Joins are used to combine rows from two or more tables based on a related column between them. 

use world;
-- Joins=>  extract data from two tables
select * from city; 
-- id,population
-- id can be p.k

desc city;
select count(id),count(distinct id),count(population),count(distinct population) from city;
select *from country;
desc country;
-- city=> id(pk) , countrycode(foriegn key)
-- country code=>(pk) , code(primary key)
-- common between them is countrycode,code
select ct.name,ct.countrycode from city as ct;
select cnty.code,cnty.name from country as cnty;

select ct.name,ct.countrycode,cnty.code,cnty.name from city as ct 
join country as cnty where ct.countrycode=cnty.code;

-- Q.1 Find the cityname,citypopulation along with the 
-- governmnent form in that city with the population from highest to lowest?
select ct.name,ct.population,cnty.governmentform from city as ct join country as cnty where ct.countrycode=cnty.code
order by ct.population desc;

-- Q.2 Find countryname,popualtion and all the language spoken for each country? 
-- two tables country and country language
select * from countrylanguage;
desc countrylanguage;
select * from country;
select cnty.name,cnty.population,cl.language from country as cnty 
join countrylanguage as cl
where cnty.code=cl.countrycode;

use sakila;
select * from film_actor;
select count(*),count(distinct film_id) from film_actor;
desc film_actor;

-- Q.3 Get the actor id and the first name along with its film id;
select ac.actor_id,ac.first_name,fa.film_id from actor as ac
join film_actor as fa
where ac.actor_id=fa.actor_id;

-- actor table,film_actor table,film table
-- Q.4 What is the actor name,movie name join on three tables:
select * from film;
select ac.first_name,f.title from actor as ac join film_actor as fa join film as f
where ac.actor_id=fa.actor_id and fa.film_id=f.film_id;

-- note that:- best practice is that use on after join not where and 
select ac.first_name,f.title from actor as ac 
join film_actor fa 
on ac.actor_id=fa.actor_id
join film f
on fa.film_id=f.film_id;