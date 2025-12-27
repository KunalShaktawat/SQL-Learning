-- Self Join

use regex;
select * from employee;

select emp.emp_id,emp.emp_name,emp.manager_id from employee as emp;
select mngr.emp_id,mngr.emp_name from employee as mngr;

select emp.emp_id,emp.emp_name,emp.manager_id,mngr.emp_id,mngr.emp_name 
from employee as emp
join employee as mngr
on emp.manager_id=mngr.emp_id;

-- total number of employees for each manager;
select mngr.emp_name,count(emp.emp_id) 
from employee as emp
join employee as mngr
on emp.manager_id=mngr.emp_id
group by mngr.emp_name;