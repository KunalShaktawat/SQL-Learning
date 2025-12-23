-- Basic Idea
-- Subquery - Query within a query.
use sakila;

select * from payment;
select * from payment where amount>0.99;
--
select amount from payment where payment_id=20;
select * from payment where amount>2.99;
--
select * from payment 
where amount>(
     select amount from payment 
     where payment_id=20
);


select amount from payment where payment_id=25;
select * from payment where amount>4.99;
--    subquery
select * from payment where amount>(select amount from payment where payment_id=25);

select payment_date,month(payment_date)from payment where payment_id=3;
select * from payment where month(payment_date)>6;
--    subquery
select * from payment 
where month(payment_date)>(
	select month(payment_date)
	from payment 
	where payment_id=3
);