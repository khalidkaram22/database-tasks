create database movie ;
go;
use movie ;

go;

create table actor (
act_id int primary key not null ,
act_fname char(20),
act_lname char(20),
act_gender char(1),
);

create table director (
dir_id int primary key not null ,
dir_fname char(20),
dir_lname char(20)
);

create table movie (
mov_id int primary key not null ,
mov_title char(50),
mov_year int ,
mov_time int ,
mov_lang char(50),
mov_dt_rel date,
mov_rel_country char(5)
);

create table reviewer (
rev_id int primary key not null ,
rev_name char(30)
);

create table movi_direction (
dir_id int ,
mov_id int,
foreign key (dir_id) references director (dir_id),
foreign key (mov_id) references movie (mov_id)
);

create table movie_cast (
act_id int ,
mov_id int ,
act_role char(30) ,
foreign key (mov_id) references movie (mov_id),
foreign key (act_id) references actor (act_id)
);

create table geners(
gen_id int primary key not null ,
gen_title char(20)
);


create table movie_geners(
gen_id int ,
mov_id int,
foreign key (mov_id) references movie (mov_id),
foreign key (gen_id) references geners (gen_id)

);

create table rating (
mov_id int ,
rev_id int,
rev_stars int ,
num_o_rating int ,
foreign key (mov_id) references movie (mov_id),
foreign key (rev_id) references reviewer (rev_id)
);