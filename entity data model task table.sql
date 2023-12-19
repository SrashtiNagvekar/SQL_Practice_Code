create table Products
(
ProductID int primary key identity,
ProductName varchar(50),
Price int
)

create table Task
(
TaskID int primary key identity,
TaskName varchar(50),
[Hours] int,
EmployeeID int foreign key references Employees(ID)
)