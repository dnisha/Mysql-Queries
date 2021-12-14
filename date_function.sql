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


#20
desc employees;
desc jobs;
select avg(salary),count(employee_id) "number of employee" from employees group by department_id having count(employee_id) >5 ;

#19
select max_salary from jobs;
select job_id,max_salary from jobs where max_salary >40000;

#18
select * from jobs;
select * from employees;
select avg(e.salary),j.job_id,j.job_title from employees e inner join jobs j on(e.job_id = j.job_id) where job_title <> 'Programmer' group by j.job_id;

#14
select max_salary ,job_title from jobs where job_title='Programmer';

#11
select employee_id,last_name, last_day(hire_date) salary_date from employees;

#10
desc departments;
desc employees;
select * from departments;
select d.department_name,concat(m.first_name," ",m.last_name), m.salary,datediff(curdate(),m.hire_date)/365 experience from departments d inner join employees m on (d.department_id = m.department_id) where datediff(curdate(),m.hire_date)/365 >5 group by d.department_name ;

#9
select year(hire_date),count(employee_id) from employees group by year(hire_date) having count(employee_id) =10 ;

#8
select first_name,last_name,monthname(hire_date) joining_month from employees where monthname(hire_date) = 'june';

 #7
 select from_days(730677);
 
 #6
 select date_format(curdate(),'%M %d, %Y');
 
 #5
 select round(datediff( curdate(),'2000-07-11' )/365) age;
 
 #3
 select employee_id,hire_date,dayname(hire_date) from employees where dayname(hire_date)='monday';
