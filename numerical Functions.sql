show databases;
use cdac;
show tables;
desc employees;

select abs(-22);
select ceil(124.1) , floor(124.9);

select * from employees;
select greatest(1,5,12,78,100) , least(1,5,12,78,100);
select greatest(department_id,salary) , least(department_id,salary) from  employees;

select mod(1500,3);

select salary, mod(salary,3) from employees;

select pow(2,2) ,pi();

select round(123.1345,1), truncate(123.1645,1);
select round(159.1345,-2), truncate(126.1645,-1);


