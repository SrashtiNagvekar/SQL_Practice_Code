--2nd connection
create table #PersonDetails(
Id int,
name varchar(20))

insert into #PersonDetails values (1,'Kate'),(2,'John'),(3,'Alice');

select * from #PersonDetails;

--global temp table
create table ##EmployeeDetails(
Id int,
name varchar(20))

insert into ##EmployeeDetails values (1,'Ramesh'),(2,'Suresh'),(3,'Mahesh');
select * from ##EmployeeDetails;

select getdate()
--output : 20230912
select convert(int, convert(varchar(10), getdate(), 112))