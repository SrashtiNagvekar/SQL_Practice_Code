create table Companies
(
Id int primary key,
[Name] nvarchar(60),
[Address] nvarchar(100),
Country nvarchar(50),
)

create table EmployeesInfo
(
Id int primary key,
Name nvarchar(30),
Age int,
Position nvarchar(50),
CompanyId int,
foreign key (CompanyId) references Companies(Id) on delete cascade
)

create procedure spGetAllCompanies
as
begin
	select * from Companies;
end;