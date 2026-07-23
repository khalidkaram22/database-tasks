use test1 ;

go ;
--1
create table Employees (
id int,
emp_name varchar(50) ,
salary decimal 
);
--2
alter table Employees 
add department varchar(50);

--3
alter table Employees 
drop column salary ;

--4
EXEC sp_rename 'Employees.Department', 'DeptName', 'COLUMN';

--or 
--alter table Employees drop department ;
--alter table Employees add DeptName varchar(50);

--5
create table projects (
project_id int primary key ,
project_name varchar(30)
);
--6
alter table Employees 
add constraint PK_employees  primary key (id);
--7
alter table employees 
add constraint unique_name unique (emp_name);
--8
create table customers(
customer_id int ,
first_name varchar(30),
last_name varchar(30),
email  varchar(30),
customer_status  varchar(30)
);
--9
alter table customers add constraint customer_unique_names unique (first_name,last_name);

--10
create table orders (
order_id int ,
customer_id int,
order_date datetime,
total_amount decimal 
);

--11
ALTER TABLE orders
ADD CONSTRAINT constraint_name CHECK (total_amount > 0);

--12
go

create schema sales;
go

alter schema sales
transfer dbo.orders;

go
--13
EXEC sp_rename 'sales.orders', 'SalesOrders';
