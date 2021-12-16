
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
