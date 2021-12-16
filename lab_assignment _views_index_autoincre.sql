show databases;
use cdac;
show tables;

#1
create view date as select date_format(adddate( last_day( adddate(curdate() , interval -4 month)), interval 1 day),'%d/%m/%y %r');
select * from date;

#2
desc employees;
create view emp3 as select year(hire_date),count(employee_id) from employees group by year(hire_date) having count(employee_id) = 10  ;
select * from emp3;

#3
desc departments;
create view emp_dep as select e.last_name,e.salary,d.department_id,e.job_id,e.phone_number from employees e inner join departments d on 
(e.department_id = d.department_id) where d.department_id = 6 ;
select * from emp_dep;

#4
desc employees;
desc jobs;
select * from jobs;
create view progam_maxsala as select e.first_name,e.salary,j.job_title  from employees e inner join jobs j on (e.job_id = j.job_id) group by (job_title) 
having  job_title = 'Programmer' and salary = max(salary);

select * from progam_maxsala;


#5
create view avg_salary as select employee_id,concat(first_name," ",last_name),salary from employees 
having salary > avg(salary);

select * FROM avg_salary;

#9
create table salesman (salesman_id int, s_name varchar(10), city varchar(10),
commission date,primary key(salesman_id) );

desc salesman;

alter table salesman modify city varchar(10) not null;
alter table salesman modify commission date not null;

create table customer (customer_id int ,cust_name varchar(10) not null,
city varchar(10) not null,grade varchar(1) not null, salesman_id int not null,primary key(customer_id) );

desc customer;

create table orders (order_id int ,purch_amt int not null ,ord_date date not null,
customer_id int not null,salesman_id int not null,primary key(order_id));

desc orders;

#10
create index sal_index on salesman(s_name);
show indexes from salesman;

create index cust_index on customer(customer_id);
show indexes from customer;

create index odr_index on orders(purch_amt);
show indexes from orders;

#8
create table courses(c_id int auto_increment , c_name int not null
,dptid int not null,primary key(c_id), foreign key(dptid) references dept3(dept_id));
desc courses;

create table dept3 (dept_id int auto_increment,d_name varchar(7),primary 
key(dept_id) );
desc dept3;

create table enrollment(e_id int auto_increment,count int ,primary key(e_id));
desc enrollment;

create index c_index on  courses(c_name);
show indexes from courses;

create index dpt_index on dept3(d_name);
show indexes from dept3;

insert into courses(c_name,dptid) values (111,1),(112,1),(250,1),(231,1),(111,2),(250,3),(111,4);
select * from courses;

insert into dept3(d_name) values("cse"),("mth"),("egr"),("chm");
select * from dept3;

desc enrollment;
insert enrollment(count) values (40),(15),(10),(12),(60),(14),(200);
select * from enrollment;

#7
create table customer2(c_id int auto_increment,f_name varchar (10) not null,l_name varchar(10) not null,email varchar(15) not null
, phone int(10) not null,contact varchar(20) not null, primary key(c_id));
desc customer2;