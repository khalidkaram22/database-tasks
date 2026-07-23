create database hr 

use hr 

go 

create table regions (
region_id int primary key not null ,
region_name varchar(25)
);

create table jobs (
job_id varchar(10) primary key not null ,
job_title varchar(35) , 
min_salary int ,
max_salary int
);

create table countries (
country_id char(2) primary key not null,
country_name varchar(40),
region_id int ,
foreign key (region_id) references regions (region_id)
);

create table locations(
location_id int primary key not null ,
street_address varchar(25),
postal_code varchar(12),
city varchar(30),
state_province varchar(12),
country_id char(2),
foreign key (country_id) references countries (country_id)
);

create table departments (
department_id int primary key not null, 
department_name varchar(30) ,
manager_id int,
location_id int,
foreign key (location_id) references locations (location_id) 
);

create table employees (
employee_id int primary key not null ,
f_name varchar(20),
l_name varchar(25),
email varchar(25),
phone_number varchar(20),
hire_date date default getdate(),
job_id varchar(10),
salary int ,
commission_pct int,
manager_id int ,
department_id int ,
    FOREIGN KEY (job_id)
        REFERENCES jobs(job_id),

    FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id),

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
go

ALTER TABLE departments
ADD CONSTRAINT FK_Departments_Manager
FOREIGN KEY (manager_id)
REFERENCES employees(employee_id);

create table job_grades (
grade_level varchar(2),
lowest_sal int, 
higest_sal int 
);

create table job_history (
employee_id int ,
start_day date,
end_date date,
job_id varchar(10),
department_id int, 
foreign key (employee_id) references employees (employee_id),
foreign key (job_id) references jobs (job_id),
foreign key (department_id)references departments(department_id)
)