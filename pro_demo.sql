desc employees;
select * from employees;
select round(datediff(curdate(),hire_date)/365),salary ,employee_id from employees where employee_id=115;
select avg(salary),department_id from employees group by department_id;
desc employees;
desc departments;
select e.first_name,d.department_name from employees e inner join departments d on (e.department_id = d.department_id) 
where e.employee_id=(select manager_id from employees where employee_id=103);

select substring(round(salary),0,-1) from employees ;