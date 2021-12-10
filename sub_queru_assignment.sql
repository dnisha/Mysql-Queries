show databases;
use cdac;
show tables;

select * from jobs;

desc employees;
select * from employees;

select salary from employees where employee_id=202;
select first_name,last_name from employees where salary >any (select salary from employees where employee_id=201);

select department_id from employees where employee_id=203;
select first_name,last_name,salary,department_id,job_id from employees where department_id = (select department_id from employees where employee_id=203);

select salary ,department_id from employees group by department_id;
select concat(first_name," ",last_name),salary,department_id,job_id from employees where salary in (select min(salary) from employees group by department_id);

select employee_id,concat(first_name," ",last_name) from employees where salary > (select avg(salary) from employees);


select * from employees where first_name = 'Pataballa';
select concat(first_name," ",last_name),employee_id,salary from employees where first_name= 'Pataballa';

select job_id,job_title from jobs where job_title='Finance Manager' ;

#18
select concat(first_name," ",last_name),department_id from employees where salary > 3700;

#15
select employee_id,concat(first_name," ",last_name) from employees where salary > (select avg(salary) from employees) and concat(first_name," ",last_name) like '%j%' ;

#14
select employee_id,concat(first_name," ",last_name),department_id from employees where department_id in (select department_id from employees where concat(first_name," ",last_name) like '%j%');

#13
select concat(first_name," ",last_name),hire_date,department_id from employees where department_id = (select department_id from employees where first_name='neena') and first_name not in ('neena');

#12
select * from employees where salary=(select max(salary) from employees where salary < (select max(salary) from employees));

#11
select * from employees where department_id not in (select department_id from employees where manager_id between 100 and 200);

#10

select * from employees where salary between (select min(salary) from employees) and 2500;

#9
select * from employees where salary between 1000 and 3000;

#8
select * from employees where employee_id in(100,159,183);

#7
select * from employees where salary=3000 and manager_id=205;
