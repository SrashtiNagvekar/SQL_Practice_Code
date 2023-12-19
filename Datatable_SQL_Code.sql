create table Students
(
Id int primary key identity(1,1),
[Name] nvarchar(50),
Age int,
FavHobby nvarchar(50),
FatherName nvarchar(50),
MotherName nvarchar(50),
[Address] nvarchar(100)
)

drop table Students

insert into Students values('Anna Smith',14,'Gardening','Smith Brown','Flora Smith','Main street 123, UK')
insert into Students values('Joseph Swift',10,'Watching Cartoons','Tom Swift','Lara Swift','NY street 123, USA')