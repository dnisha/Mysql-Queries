show databases;
use cdac;
show tables;

select curdate(),sysdate(),now();
select date("2021-12-07 08:30:42");
select month("2021-12-07 08:30:42");
select monthname("2021-12-07 08:30:42");
select year("2021-12-07 08:30:42");

desc employees;
select * from employees;
select year(hire_date) from employees;

select hire_date,day(hire_date) date from employees;
select dayofyear("2021-12-07 08:30:42");
select last_day("2021-12-07 08:30:42");

select extract(month from "2021-12-07 08:30:42");
select extract(second from sysdate());

select curdate();
select adddate(curdate() , interval 10 day);
select adddate(curdate() , interval 1 month);
select adddate(curdate() , interval 24 hour);
