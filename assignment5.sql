show databases;
use cdac;
show tables;

desc employees;
select * from employees;
select round(max(salary))  maximum,round(min(salary))  minimum,avg(salary) average from employees;

select job_id,sum(job_id) from employees;

select job_id,round(max(salary)) maximum,round(min(salary)) minimum from employees group by job_id;

select salary,count(employee_id) from employees group by salary;

select count(distinct manager_id) "number of managers" from employees;

select max(salary) , min(salary) from employees;
select max(salary) - min(salary) differance from employees;

select job_id,salary,min(salary) from employees where salary >= 10000 group by job_id;


select avg(salary),count(employee_id),department_id from employees where department_id in(9);
select  avg(salary),count(employee_id) from employees where department_id = 9 group by employee_id;


select employee_id,job_id,max(salary) from employees having max(salary) >= 4000;