show databases;
use cdac;
show tables;
describe employees;
select * from employees;
select * from employees where manager_id between 101 and 110 order by manager_id desc ;
select * from employees where last_name like '%j%' or '%k%' or '%l%';
select * from employees where job_id in (9,10,13,19) and manager_id in (101,102,103);
select * from employees where phone_number is not null and employee_id in (105,106,107);
select * from employees where hire_date between 1991-01-01 and 1995-12-31;
select * from employees where email is null;
select  first_name,last_name,salary*0.02 "commission" from employees where salary > 15000 