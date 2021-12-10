show databases;
use cdac;
show tables;
use emp1;
desc emp1;
select * from emp1;
select ename , commission from emp1;
insert into emp1(empno,ename,commission,empsalaray,deptno) values(4,'mohit',24,51000,1040),(4,'ankit',25,51000,1050);
rollback;
commit;
alter table emp1  change empsalaray salary int;
update emp1 set salary=salary+1000 where commission=23 ;
update emp1 set salary=salary+100 where salary=51000;

insert into emp1(empno,ename,commission,salary) value(5,"devika",26,60000);
insert into emp1(empno,ename,commission,salary,deptno) value(6,"robin",27,55000,null);

update emp1 set ename='reshmi' where ename='devika';