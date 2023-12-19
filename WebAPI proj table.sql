create table Issues
(
Id int primary key not null,
Title nvarchar(max) not null,
Description nvarchar(max) not null,
Priority int not null,
IssueType int not null,
CreatedDate datetime2(7) not null,
Completed datetime2(7)
)

drop table Issues
