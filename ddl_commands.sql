
show databases;
use cdac;
show tables;
create database cdac;
use cdac;

create table emp(empno int(10),ename varchar(50),empsalaray int,deptno int);
describe emp;
alter table emp add job_id varchar (40);
alter table emp modify empsalaray float(10,2);
alter table emp modify ename varchar(30);
alter table emp drop column job_id;
alter table emp change empsalaray e_salary float(10,2);
alter table emp add commission int after ename;
rename table emp to emp1;
