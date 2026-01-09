-- Subquery:- A query within another query or nested query or inner query

use sakila;
select * from payment;

-- Find payment Id whose amount is equal to id 5 amount
select amount from payment where payment_id=5;
-- result= 9.99
select * from payment where amount=9.99;
-- Dynamic
select * from payment where amount=(select amount from payment where payment_id=5);

-- Find all the payment details where staff who served for the id 7
select staff_id from payment where payment_id=7;
-- id-7 served by staff_id=1
select * from payment where staff_id=1;
-- Dymanic
select * from payment where staff_id=(select staff_id from payment where payment_id=7);

-- Get the payment_id amount and date where the month of payment should be same as of id=20
select extract(month from payment_date) from payment where payment_id=20;
-- month-7
select payment_id,amount,payment_date from payment where extract(month from payment_date)= 7;
--  Dyanamic
Select payment_id,amount,payment_date from payment where extract(month from payment_date)=(select extract(month from payment_date) from payment where payment_id=20);
-- or
Select payment_id,amount,payment_date 
from payment 
where month(payment_date)=(
select month(payment_date) from payment where payment_id=20);

-- Get the amount and the total number of payments done for each amount where the amount should be less than amount of rental id 1725
select amount from payment where rental_id=1725;
-- amount of rental id is - 4.99
select amount,count(payment_id) from payment where amount<(select amount from payment where rental_id=1725) group by amount;

-- get the month and the total amount spent from the payment table where the month is greater than month of customer id 1 with the payment id 3
select month(payment_date) from payment where customer_id=1 and payment_id=3;
select month(payment_date),sum(amount) from payment where month(payment_date)> 6 group by month(payment_date);
-- these all examples are of single row subquery

-- multi row subquery
select amount from payment where payment_id=3 or payment_id=4;
-- in multi row subquery we cannot use <,>,=,!= operators
select * from payment where amount=(select amount from payment where payment_id=3 or payment_id=4);

-- use in, any, all in multi row subquery
select * from payment where amount in (select amount from payment where payment_id=3 or payment_id=4);

-- =any same as in operator
-- >any,<any,<=any,any>=
-- >all, <all, <=all, >=all
