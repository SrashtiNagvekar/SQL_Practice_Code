
--1st connection window
--temporary table
create table #PersonDetails(
Id int,
name varchar(20))

insert into #PersonDetails values (1,'Kate'),(2,'John'),(3,'Alice');

select * from #PersonDetails;

select name
from tempdb..sysobjects
where name LIKE '#PersonDetails%'

create procedure spCreateLocalTempTable
as
begin
create table #PersonDetails(
Id int,
name varchar(20))

insert into #PersonDetails values (1,'Kate'),(2,'John'),(3,'Alice');

select * from #PersonDetails;
end

execute spCreateLocalTempTable
select * from #PersonDetails;
select * from ##EmployeeDetails;