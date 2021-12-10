show databases;
use cdac;
show tables;

desc departments;
desc locations;
desc employees;
desc countries;
desc jobs;

#1
select l.location_id,l.street_address,l.city,l.state_province,c.country_name,d.department_id from locations l inner join
 countries c on (l.country_id = c.country_id) inner join departments d on (d.location_id = l.location_id);
 
 #2
 select concat(e.first_name," ",e.last_name) name,e.department_id,d.department_name from employees e inner join departments d on (e.department_id = d.department_id);
 
 #3
 
 select * from employees;
 select concat(e.first_name," ",e.last_name) name,j.job_title,e.department_id ,d.department_name from employees e inner join jobs j on (e.job_id = j.job_id) inner join departments d on (e.department_id = d.department_id) inner join locations l on (d.location_id = l.location_id) where city = "london";
 
 #4
 desc employees;
 select e.employee_id,e.last_name,e.manager_id,m.last_name "manager name" from employees e  inner join employees m on (e.employee_id = m.manager_id);

 

 
#5
select concat(first_name," ",last_name) ,hire_date from employees where hire_date > (select hire_date from employees where last_name= "Hunold");
 
 #6
 select d.department_name , count(e.employee_id) "number of employees" from employees e inner join departments d on(d.department_id=e.department_id) group by d.department_name;

#7
select e.employee_id,j.job_title, datediff( max(e.hire_date),min(e.hire_date)) from employees e inner join jobs j on (e.job_id = j.job_id) where e.department_id = 9;
 
 select datediff('1987-06-17','1993-01-13');
 
 #8
 select e.department_id,d.department_name,m.first_name from employees e inner join employees m on (e.manager_id = m.manager_id) inner join departments d on(d.department_id = e.department_id) group by e.department_id;
 
 #9
 select d.department_name,m.first_name,l.city from departments d inner join employees m on (d.department_id = m.department_id) inner join locations l on (l.location_id = d.location_id) group by manager_id;
 
 
 desc departments;
desc locations;
desc employees;
desc countries;
desc jobs;

 #10
 select j.job_title,avg(e.employee_id) average_salary from employees e inner join jobs j on ( j.job_id= e.job_id) group by j.job_title;
 
 #11
 select j.job_title, concat(e.first_name," ",e.last_name), e.salary-min(e.salary) from employees e inner join jobs j on (e.job_id=j.job_id) group by j.job_title;
 
 #12
 insert into jobs values(20,'Developer',50000,150000);
 
 select j.* from jobs j right outer join employees e on (j.job_id = e.job_id) where e.salary >10000;
 
 #13 
 select d.department_name,concat(e.first_name," ",e.last_name),e.hire_date,e.salary, datediff(curdate(),e.hire_date)/365 experience from departments d inner join employees e on (d.department_id = e.department_id) where datediff(curdate(),e.hire_date)/365 >23 group by manager_id;

select not true;