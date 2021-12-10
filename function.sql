show databases;
use cdac;
show tables;
desc employees;
select first_name,last_name,upper(last_name) from employees;
select *,lower(last_name) lastname from employees;
select concat('my',' ','name',' ','is',' ',first_name,' ',last_name) fullname from employees;
select substr('helloworld',1,5);
select substr('helloworld',-5,3);
select *,substr(email,1,3) from employees;
select substring_index('www.cdac.com','.',2);
select *,substring_index(email,'@',1) from employees;
select *,substring_index(email,'@',-1) from employees;
select instr('helloworld','l');
select *,instr(last_name,'a') from employees;

select lpad('helloworld',15,'*') , rpad('helloworld',15,'*');
select lpad(phone_number,30,'*'), rpad(phone_number,20,'*') from employees;

select length("Helloworld");
select *,length(first_name) from employees;

select trim('d' from 'helloworld');
select trim('h' from 'helloworld');

select replace('hello deepak','deepak','nishad');