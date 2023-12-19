create table tbl_Country
(
country_id int identity,
country_name varchar(50)
)

create table tbl_State
(
state_id int identity,
state_name varchar(50),
country_id int
)

create table tbl_City
(
city_id int identity,
city_name varchar(50),
state_id int
)

insert into tbl_Country(country_name) values('India');
insert into tbl_Country(country_name) values('USA');

select * from tbl_Country;
select * from tbl_State;
select * from tbl_City;

insert into tbl_State(state_name,country_id) values('Karnataka',1);

insert into tbl_City(city_name,state_id) values('Bangalore',1);
insert into tbl_City(city_name,state_id) values('Mangalore',1);
insert into tbl_City(city_name,state_id) values('Tumkur',1);
insert into tbl_City(city_name,state_id) values('Mandya',1);
insert into tbl_City(city_name,state_id) values('Hassan',1);

insert into tbl_State(state_name,country_id) values('Maharashtra',1);

insert into tbl_City(city_name,state_id) values('Pune',2);
insert into tbl_City(city_name,state_id) values('Nashik',2);
insert into tbl_City(city_name,state_id) values('Nagpur',2);
insert into tbl_City(city_name,state_id) values('Thane',2);
insert into tbl_City(city_name,state_id) values('Mumbai',2);

--USA

insert into tbl_State(state_name,country_id) values('New York',2);

insert into tbl_City(city_name,state_id) values('Middletown',3);
insert into tbl_City(city_name,state_id) values('Watertown',3);
insert into tbl_City(city_name,state_id) values('Rye',3);
insert into tbl_City(city_name,state_id) values('Olean',3);

insert into tbl_State(state_name,country_id) values('California',2);

insert into tbl_City(city_name,state_id) values('Los Angeles',4);
insert into tbl_City(city_name,state_id) values('San Fransisco',4);
insert into tbl_City(city_name,state_id) values('San Diego',4);
insert into tbl_City(city_name,state_id) values('San Jose',4);

