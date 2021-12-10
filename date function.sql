
show databases;
use cdac;
show tables;
desc employees;

select sysdate(),now(),current_date(),current_time(),current_timestamp();

select datediff(curdate(),'2021-09-21');

select date_format('2012-12-4',"%D %M %Y");