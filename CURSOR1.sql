delimiter $$
create procedure p22(IN v_dep int)
begin
declare v_empid,v_sal int;
declare v_name varchar(40);
declare finished int;
declare curdep cursor for select employee_id,last_name,salary,department_id from employees where department_id=v_dep;
declare continue handler for NOT FOUND SET finished = 1;
open curdep;
getdep:LOOP
fetch curdep into v_empid,v_name,v_sal,v_dep;
If finished =1 then
leave getdep;
end if;
select v_empid,v_name,v_sal,v_dep;
end loop getdep;
close curdep;
end$$


#NO OF EMPLOYEE ACCORDING TO DPT ID
delimiter $$
create procedure p24(INOUT v_dep int,INOUT v_emp int)
begin
declare finished int;
declare cur_dep cursor for select count(employee_id),department_id from employees group by department_id;
declare continue handler for NOT FOUND SET finished = 1;
open cur_dep;
no_dep:LOOP
fetch cur_dep into v_emp,v_dep;
If finished =1 then
leave no_dep;
end if;
select v_emp,v_dep;
end loop no_dep;
close cur_dep;
end$$

call p24(@v_dep,@v_emp);

#ANUAL SALARY WITH SALARY GRT 10000
delimiter $$
create procedure getann1(IN v_job int,OUT v_sal int,OUT annsal int,OUT v_empid int)
begin
declare finished int default 0;
declare cur2 cursor for select employee_id,salary,salary*12,job_id from employees where job_id=5 and salary > 10000;
declare continue handler for NOT FOUND set finished=1;
open cur2;
loop1:LOOP
fetch cur2 into v_empid,v_sal,annsal,v_job;
if finished=1 then
leave loop1;
end if;
select v_empid,v_sal,annsal,v_job;
end loop loop1;
close cur2;
end$$

call getann1(5,@v_sal,@annsal,@v_empid);