

delimiter $$
create procedure proc7()
begin
declare v_name varchar(40);
declare v_sal,v_dept int;
select last_name,salary,department_id into v_name,v_sal,v_dept from employees where employee_id=105;
select v_name,v_sal,v_dept;
end$$

call proc7();


delimiter $$
create procedure proc8()
begin
declare v_epid,v_mid,v_jobid int;
select employee_id,manager_id,job_id into v_epid,v_mid,v_jobid from employees where last_name = 'King';
select  v_epid,v_mid,v_jobid;
end$$

call proc8();
drop procedure proc8();




delimiter &&
create procedure proc9()
begin
declare v_sal int;
declare grade varchar(2);
select salary into v_sal from employees where employee_id=204;
IF v_sal<=5000 THEN
set grade='C';
elseif v_sal between 5001 and 10000 THEN
set grade='B';
elseif v_sal>10000 then
set grade='A';
ELSE
set grade='No grade';
end if;
select grade;
end&&

call proc9;
delimiter &&
create procedure proc10()
begin
declare V_sal int;
select salary into v_sal from employees where last_name='Hunold';
IF v_sal<=5000 THEN
set v_sal = v_sal+v_sal*0.15;
elseif v_sal between 5001 and 10000 THEN
set v_sal= v_sal+v_sal*0.1;
elseif v_sal between 10001 and 20000 then
set v_sal= v_sal+v_sal*0.05;
ELSE
set v_sal=v_sal;
end if;
select v_sal;
end &&

call proc10();
#select * from employees where last_name='Hunold';

show procedure status;
