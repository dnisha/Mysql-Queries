show databases;
use cdac;
show tables;
select * from employees;
desc employees;

select first_name "First Name",last_name "Last Name" from employees;
select distinct(department_id) from employees;
select * from employees order by first_name desc;

select first_name,last_name,salary,salary*0.12 PF from employees;
select employee_id,first_name,last_name,salary from employees order by(salary) asc;

select * from employees where salary between 10000 and 20000 order by(salary) desc;

select * from employees where department_id in(3,4,5);

select sum(salary) PyableSalary from employees;