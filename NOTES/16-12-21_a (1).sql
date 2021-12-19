use cdac;
delimiter ##
create procedure p17(INOUT phnumber varchar(20))
begin

select concat('(',substr(phnumber,1,3),')-',substr(phnumber,4,4),'-(',substr(phnumber,-3,3),')') into phnumber; 
select phnumber;

end##

set @phnumber='7890543216';
call p17(@phnumber);

 drop procedure print_val;
delimiter $$
create procedure print_val(IN x int)
begin
declare str varchar(255);
set str=' ';
while x<=5 do
set str=concat(str,x,',');
set x=x+1;
end while;
select str;
end$$


call print_val(1);
drop procedure p18;
create table areas1 (r int,ar decimal(10,2));
desc areas1;
select * from areas1;

delimiter ##
create procedure p18(IN i int,IN n int)
begin
declare r int;
declare ar decimal(10,2);
declare pi decimal(10,2);
set r=i;
set pi=3.14;
while r<=n do
set ar=pi*power(r,2);
insert into areas1 values(r,ar);
set r=r+1;
end while;
end##


call p18(11,20);
drop procedure print_val1;

delimiter ##
create procedure print_val1(IN x int,INOUT str varchar(255))
begin
repeat 
set str=concat(str,x,',');
set x=x+1;
until x > 5
end repeat;
select str;
end##

set @str=' ';
call print_val1(1,@str);


drop procedure print_val2;
delimiter $$
create procedure print_val2(IN x int,INOUT str varchar(255))
begin
print1:loop
if x >5 then
leave print1;
end if;
if x<=5 then 
set str=concat(str,x,',');
set x=x+1;
iterate print1;
end if;
end loop;
select str;
end$$




select * from areas1;
drop procedure p21;
delimiter ##
create procedure p21(IN i int,IN n int)
begin
declare r int;
declare ar decimal(10,2);
declare pi decimal(10,2);
set r=i;
set pi=3.14;
repeat
set ar=pi*power(r,2);
insert into areas1 values(r,ar);
set r=r+1;
until r>n
end repeat;
end##


call p21(20,30);

delimiter $$
create procedure p22(IN i int,IN n int)
begin
declare r int;
declare ar decimal(10,2);
declare pi decimal(10,2);
set r=i;
set pi=3.14;
print2:loop
If r>n then
leave print2;
end if;
if r<=n then
set ar=pi*power(r,2);
insert into areas1 values(r,ar);
set r=r+1;
iterate print2;
end if;
end loop print2;
end$$

call p22(31,40);
drop function func1;

delimiter $$
create function func1(v_empid int)
returns char
deterministic 
begin
declare grade char(2);
declare v_sal int;
select salary into v_sal from employees where employee_id=v_empid;
If v_sal<=5000 then
set grade='C';
elseif v_sal between 5001 and 10000 then
set grade='B';
elseif v_sal>10000 then 
set grade='A';
else
set grade='No grade';
end if;
return grade;
end$$

select employee_id,salary,func1(employee_id) from employees;