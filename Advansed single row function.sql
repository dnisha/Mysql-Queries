show databases;
use cdac;
show tables;
desc employees;
select * from employees;
select isnull(-2);

select  first_name,last_name ,nullif(first_name,last_name ) from employees;
select  first_name,last_name ,nullif(first_name,first_name ) from employees;
select length(first_name),length(last_name),nullif(length(first_name),length(last_name)) FROM EMPLOYEES;

SELECT coalesce(null,null,null,18,22,12,null,13);

select *,coalesce(manager_id,job_id) from employees;

select min(manager_id), max(manager_id) from employees;
select min(salary), max(salary) from employees;

select department_id,avg(salary) from employees;
select department_id,avg(salary) from employees group by department_id;
select department_id,max(salary),sum(salary) from employees group by department_id;

select job_id,avg(salary) from employees where job_id in (6,7) group by job_id;