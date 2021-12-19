use cdac;
select * from employees;

DELIMITER $$
CREATE  PROCEDURE createEmailList1 (
	INOUT emailList varchar(4000)
)
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE emailAddress varchar(100) DEFAULT "";

	-- declare cursor for employee email
	DEClARE curEmail 
		CURSOR FOR 
			SELECT email FROM employees;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

	OPEN curEmail;

	getEmail: LOOP
		FETCH curEmail INTO emailAddress;
		IF finished = 1 THEN 
			LEAVE getEmail;
		END IF;
		-- build email list
		SET emailList = CONCAT(emailAddress,"; \n",emailList);
	END LOOP getEmail;
	CLOSE curEmail;

END$$

drop procedure p23;
delimiter $$
create procedure p23(IN v_dep int)
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

call p23(9);

delimiter $$
create  procedure getann1(IN v_job int,OUT v_sal int,OUT annsal int,OUT v_empid int)
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


delimiter $$
create procedure p30()
begin
declare v_dept ,v_num int;
declare finished int default 0;
declare cur3 cursor for select department_id,count(employee_id) from employees group by department_id;
declare continue handler for NOT FOUND set finished=1; 
open cur3;
loop2:LOOP
fetch cur3 into v_dept,v_num;
if finished=1 then
leave loop2;
end if;
select v_dept,v_num;
end loop loop2;
close cur3;
end$$

call p30();

delimiter $$
create procedure p31(IN v_job int,OUT v_name varchar(40),OUT v_dname varchar(40))
begin
declare finished int;
declare cur4 cursor for select e.last_name,e.job_id,d.department_name from employees e inner join departments d on(e.department_id=d.department_id) where job_id in(6,7,8);
declare continue handler for NOT FOUND set finished=1; 
open cur4;
getcu:loop
fetch cur4 into v_name,v_job,v_dname;
if finished =1 then
leave getcu;
end if;
select v_name,v_job,v_dname;
end loop getcu;
close cur4;
end$$

call p31(6,@v_name,@v_dname);

create table employee_audit1(id int auto_increment primary key,employee_name varchar(50) not null,changedat date,action varchar(30));
drop trigger trig11;
delimiter &&
create trigger trig11 before update on employees
for each row
begin
insert into employee_audit1
(action,employee_name,changedat) values('update',
old.last_name,now());
end&&
select * from employee_audit;
update employees set last_name='sdcty' where employee_id=200;
select * from employee_audit1;
select * from employees;

create table dep_audit1(id int primary key auto_increment,action varchar(50),dep_id int,dname varchar(50),loc int,insertdat datetime);
desc dep_audit1;
select * from dep_audit1;

DELIMITER $$
create  trigger trig12 after insert on departments
for each row
begin
insert into dep_audit1(action,dep_id,dname,loc,insertdat) values('insert',new.department_id,new.department_name,new.location_id,now());
end$$

insert into departments values(21,'AR',1800);

show triggers;
select * from information_schema.triggers;