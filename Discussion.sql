select * from EmployeeInfo
where Employee_Id = 1022
order by 1 DESC
select * from Departments

select Manager_ID
from EmployeeInfo
--group by Manager_ID
having min(Manager_ID) > 2

insert into EmployeeInfo(Employee_Name) values('Srashti')
delete from EmployeeInfo where Employee_Id=1021

alter table EmployeeInfo alter column Dept_ID int not null;

USE [Practice]
GO

ALTER TABLE [dbo].[EmployeeInfo] ADD  DEFAULT (abs(checksum(newid()))%(25)+(20)) FOR [Age]
GO

select newid()

select * from EmployeeInfo
where Dept_ID is null

update EmployeeInfo
set Dept_ID = 40
where Employee_Id = 1022

insert into EmployeeInfo(Employee_Name,Dept_ID) values('Sam',30)

create table sample
( colA int,
colB int)

insert into sample values(null,null)
insert into sample values(null,null)
insert into sample values(null,null)
insert into sample values(null,null)
insert into sample values(null,null)
insert into sample values(1,2)
insert into sample values(3,4)
insert into sample values(5,6)
insert into sample values(7,8)
insert into sample values(9,10)

select * 
from sample

select count(*)
from sample


select count(colA)
from sample

select count(colB)
from sample