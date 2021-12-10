show databases;
use cdac;
show tables;
create table DEPT(Deptno int,Deptname varchar(20),Loc int); 

use dept;
describe dept;
alter table dept add  location varchar(40);
alter table dept add  city char;
alter table dept add  salary int;
alter table dept modify salary float(10);
alter table dept modify city char(10);


create table SALGRADE (HISAL int,LOSAL int,GRADE char); 


insert into dept(Deptno,Deptname,location,salary,city) value(101,"science","noida",5000,"bhilai");
 select * from dept;
 truncate dept;
