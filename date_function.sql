show databases;
use cdac;
show tables;
SELECT * FROM dept;

desc employees;

#1
select makedate( extract(year from curdate()) ,extract(month from subdate(curdate(),interval 3 month)));

select extract(year from curdate());
select extract(month from subdate(curdate(),interval 3 month)) ;

#2
select subdate( curdate(), interval 3 month) ;
SELECT LAST_DAY(subdate( curdate(), interval 3 month));

#4
select subdate( curdate(), interval 1 month);
select curdate();

#8
SELECT first_name,last_name FROM EMPLOYEES WHERE month(hire_date)=6;

#9
SELECT YEAR(CURDATE());
SELECT YEAR(hire_date),COUNT(employee_id) FROM EMPLOYEES  GROUP BY year(hire_date) HAVING COUNT(employee_id) >=10;

#17
SELECT manager_id,salary FROM EMPLOYEES WHERE SALARY IN (SELECT SALARY FROM EMPLOYEES GROUP BY manager_id HAVING min(SALARY) )  ;
SELECT * FROM EMPLOYEES;

#16
SELECT count(employee_id) FROM EMPLOYEES WHERE job_id IN (SELECT job_id FROM EMPLOYEES group by job_id);

#15
SELECT AVG(SALARY) , COUNT(employee_id) FROM EMPLOYEES WHERE department_id=9;

#13
SELECT COUNT( distinct(job_id)) FROM EMPLOYEES;

#12
SELECT DATEDIFF(YY, '2017/08/25', '2011/08/25') AS DateDiff;
SELECT first_name,hire_date, datediff(CURDATE(),hire_date)/365 AS EXPERIENCE FROM EMPLOYEES;