
#1

delimiter $$
create procedure even(IN x int)
begin
declare a int;
declare str varchar(20);
set a=12;
set str="";
while x<=a do
if x%2=0 then
set str=concat(str,x,",");
set x=x+1;
else
set x=x+1;
end if;
end while;
select str;
end $$


call even(2);

#2
delimiter $$
create procedure sal_hike(IN emp_id int )
begin
declare emp_sal int;
declare expe int;

select round(datediff(curdate(),hire_date)/365),salary into expe,emp_sal from employees where employee_id=emp_id;
if(expe >10) then
set emp_sal = emp_sal+emp_sal*0.2;
else if (expe >5) then
set emp_sal =emp_sal+ emp_sal*0.1;
else 
set emp_sal =emp_sal+ emp_sal*0.05;
end if;

end if;
select emp_sal;
end $$

call sal_hike(115);

#3


delimiter $$
create procedure avg_dsal()
begin
declare finished int default 0;
declare v_dpt int;
declare v_salary decimal(8,2);
declare avg_dcur cursor for select department_id,avg(salary) from employees group by department_id;
declare continue handler for NOT FOUND SET finished = 1;
open avg_dcur;
avg_loop:loop
fetch avg_dcur into v_dpt,v_salary;
If finished =1 then
leave avg_loop;
end if;
select v_dpt department,v_salary average_salary;
end loop avg_loop;
close avg_dcur;
end$$

call avg_dsal()

 delimiter $$
select * from employees;
desc employees;


#4
delimiter $$
create procedure mgr_info(IN emp_id int)
begin
declare v_name varchar(20);
declare v_dpt varchar(20);
 select e.first_name,d.department_name into v_name,v_dpt from employees e inner join departments d on (e.department_id = d.department_id) 
where e.employee_id=(select manager_id from employees where employee_id=emp_id);

select v_name manager_name,v_dpt department;

end$$

call mgr_info(103);


#6
create table square (side int , area int);
desc square;
select * from square;
delimiter $$
create procedure area_square(IN min_s int,IN max_s int)
begin
declare x int ;
set x = min_s;
while x <= max_s do
insert into square value (x,x*x);
set x = x+1;
end while;
end$$

call area_square(10,15);
select * from square;

#12
delimiter $$
create procedure reward()
begin
declare v_sal varchar(20) default "";
declare finished int default 0;
declare cur_reward cursor for select round(salary) from employees;
declare continue handler for NOT FOUND set finished=1;
open cur_reward;
reward_loop:LOOP
if(round(salary)%1000= 0) then
set v_sal= concat(round(salary),"*");
fetch cur_reward into v_sal;
end if;

if finished=1 then
leave reward_loop;
end if;
select v_sal;
end loop reward_loop;
close cur_reward;
end$$

call reward();


#11
delimiter $$
create function circumference( radius int)
returns decimal
deterministic
begin
declare result  decimal(10,2);
set result = 2*3.14*radius;

return result;
end $$


select circumference(2) circumference;

#8
create table message(number int)
select * from message;

delimiter $$
create procedure message(IN num int)
begin 
while num<=10 do
insert into message value(num);
set num = num+1;
end while;
end $$

call message(1);

#9
desc employees;
select * from employees;
delimiter $$
create procedure new_emp(v_employee_id int,v_first_name varchar(20),v_last_name varchar(20),v_email varchar(100),v_phone_number
 varchar(20),v_hire_date date,v_job_id int,v_salary decimal(8,2),v_manager_id int,v_department_id int)
begin

if (select valid_dpt(v_department_id) = v_department_id ) then
insert into employees values(v_employee_id,v_first_name,v_last_name,v_email,v_phone_number,v_hire_date,v_job_id,v_salary,v_manager_id,v_department_id );
 
 end if;

end $$

call new_emp(207,"deepak","nishad","dnisha158@gmail.com","834.922.9274",curdate(),4,8000,206,11);
insert into employees values(207,"deepak","nishad","dnisha158@gmail.com","834.922.9274",curdate(),4,8000,206,11);
delete from employees where employee_id=207;

delimiter $$
create function valid_dpt(v_department_id int)
returns int
deterministic
begin
declare dep int;
select department_id into dep from employees where department_id=v_department_id group by department_id;

return dep;
end $$

select valid_dpt(9);


#10a
delimiter $$
create function valid_dpt10(v_department_id int)
returns int
deterministic
begin
declare dep int;
select department_id into dep from employees where department_id=v_department_id group by department_id;

if(v_department_id = dep) then
return 1;
else 
return 0;
end if;
end $$

select valid_dpt10(15);

#10b
delimiter $$
create procedure new_emp(v_employee_id int,v_first_name varchar(20),v_last_name varchar(20),v_email varchar(100),v_phone_number
 varchar(20),v_hire_date date,v_job_id int,v_salary decimal(8,2),v_manager_id int,v_department_id int)
begin

if (select valid_dpt10(v_department_id)) then
insert into employees values(v_employee_id,v_first_name,v_last_name,v_email,v_phone_number,v_hire_date,v_job_id,v_salary,v_manager_id,v_department_id );
 else
 select 
 end if;

end $$
