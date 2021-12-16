show tables;
desc employees;
select * from employees;



delimiter $$
create  function func1(v_empid int)
returns char
deterministic
begin
declare grade char(20);
declare v_sal int;
select salary into v_sal from employees where employee_id=v_empid;
If v_sal<5000 then
set grade='C';
elseif v_sal between 5001 and 10000 then
set grade='B';
elseif v_sal>10000 then
set grade='A';
ELSE
set grade='No grade';
end if;
return grade;
end $$


select employee_id,salary,func1(employee_id) from employees;

#number of employees in dpt
delimiter $$
create  function func2(dpt_no int)
returns int
deterministic
begin

declare c_emp int;
select count(employee_id)into  c_emp  from employees where department_id  = dpt_no ;
return c_emp;
end $$


select department_id, func2(department_id) from employees group by department_id ;
