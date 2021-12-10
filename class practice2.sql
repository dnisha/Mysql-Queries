show databases;
use cdac;
show tables;
desc employees;

select * from employees;
select job_id,employee_id from employees;

select phone_number, replace(phone_number,123,999) from employees;

select * from employees where length(first_name) >= 8;
#10 question
desc locations;
select street_address,length(street_address) , right(street_address,1) from locations;

#9 question
select phone_number,right(phone_number,4 ) from employees;

#8 question
select *,upper(first_name) FirstName from employees;

#7 question
select  employee_id,trim(right(employee_id,3) from employee_id  ) , trim( right(email,3) from email   ) from employees;  

#6 question
select employee_id,first_name,hire_date from employees;

#5 question
select email,concat(email,'@example.com') email from employees;

#4 question
select salary,lpad(salary,10,'0'),rpad(salary,10,'0') from employees;
