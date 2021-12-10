show databases;
use cdac;
show tables;
select * from employees;
describe employees;
select employee_id,salary,job_id from employees;
select distinct manager_id from employees;
select first_name,last_name,employee_id,salary,salary+1000 from employees;
select first_name,last_name,employee_id,salary,salary*12 from employees;
select first_name,last_name,employee_id,salary,salary*12+1000 from employees;
select first_name,last_name,employee_id,salary,(salary+12)+1000 from employees;
select first_name,last_name,employee_id,salary,salary*12 "Anni_sal@" from employees;
select first_name,last_name,employee_id,salary*12,(salary*12*8)/100 tax from employees;

select first_name,last_name,employee_id,salary,manager_id from employees where manager_id=103;
select first_name,salary,job_id from employees where salary<10000 and job_id=9;
select first_name,salary,job_id from employees where salary<10000 or job_id=9;
select first_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id from employees where job_id != 9 and department_id=3 ;
select * from employees where salary between 10000 and 20000;

select * from employees where last_name like 's%';

select * from employees where last_name NOT  like '_a%';

select * from employees where department_id NOT in (2,3,4);

select * from employees where manager_id IS NULL;
select * from employees where phone_number IS NULL;

select * FROM EMPLOYEES WHERE first_name like '___';

DESCRIBE EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE salary between 10000 AND 30000  order by SALARY DESC;