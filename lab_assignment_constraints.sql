show databases;
use cdac;
show tables;

create table emp2(empno int,ename varchar(10) not null, salary int default "10000",
 deptno int ,mgr_id int ,job_id int ,primary key(empno),foreign key (deptno)
 references dept1  (depid), foreign key(mgr_id) references emp2(empno),foreign key(job_id) 
 references jobs2 (job_id)  );
 desc emp2;
 
 
 create table dept1(depid int auto_increment , dept_title varchar(10),primary key(depid));
  desc dept1;
  drop table dept1;
  
 create table jobs2 (job_id int,job_title varchar(15),salary int, primary key(job_id) );
 show tables;
 desc jobs2;
 
 alter table jobs2 modify job_title varchar(15)  not null;
 
 alter table jobs2 modify job_title varchar(15) default "programmer";