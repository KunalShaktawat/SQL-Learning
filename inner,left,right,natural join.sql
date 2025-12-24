CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

select * from orders;
select * from customers;

-- Inner Join:-(INNER JOIN is used to combine rows from two or more tables based on a 
--   common column, and it returns only the matching records from both tables.)

select c.customer_id,c.customer_name,o.customer_id,o.order_id,o.amount
from customers as c
inner join orders o       -- INNER JOIN can also be written as just JOIN (they mean the same).
on c.customer_id=o.customer_id;

select c.customer_id,c.customer_name,o.customer_id,o.order_id,o.amount
from orders as o
inner join customers c       -- INNER JOIN can also be written as just JOIN (they mean the same).
on c.customer_id=o.customer_id;

select c.customer_id,c.customer_name,o.customer_id,o.order_id,o.amount
from customers as c
inner join orders o       -- USING() is a shortcut for JOIN when both tables have the same column name.
using (customer_id);

-- Left Join:- “LEFT JOIN returns all records from the left table 
--    and matching records from the right table; unmatched rows contain NULL.”
select c.customer_id,c.customer_name,o.customer_id,o.order_id,o.amount
from customers as c
left join orders o       
on c.customer_id=o.customer_id;

-- Right Join:- “RIGHT JOIN returns all records from the right table 
--  and matching records from the left table; unmatched left rows contain NULL.”
select c.customer_id,c.customer_name,o.customer_id,o.order_id,o.amount
from customers as c
right join orders o      
on c.customer_id=o.customer_id;

-- Natural Join:- “NATURAL JOIN automatically joins tables using columns
-- with the same name, but it is risky and rarely used in real projects.”
select c.customer_id,c.customer_name,o.customer_id,o.order_id,o.amount
from customers as c
natural join orders o;
alter table customers rename column cid to customer_id;
select c.customer_name,sum(o.amount) 
from customers as c
join orders o
on c.customer_id=o.customer_id
group by c.customer_name;




































