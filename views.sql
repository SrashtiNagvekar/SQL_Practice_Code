--to display employee name along with the dept name and manager name

select * from EmployeeInfo
select * from Departments

-- step 1: displaying emp name and dept name
select E.Employee_Name,D.Dept_Name
from EmployeeInfo E
join Departments D
on E.Dept_ID=D.Dept_ID 

-- step 2: displaying emp name and dept name and manager name
select E.Employee_Name,D.Dept_Name,ISNULL(E1.Employee_Name,'CEO') as manager_name
from EmployeeInfo E
join Departments D
on E.Dept_ID=D.Dept_ID 
left join EmployeeInfo E1
on E.Manager_ID=E1.Employee_Id

-- creating view for the above query

create view vwEmpNameDeptNameManagerName
AS
select E.Employee_Name,D.Dept_Name,ISNULL(E1.Employee_Name,'CEO') as manager_name
from EmployeeInfo E
join Departments D
on E.Dept_ID=D.Dept_ID 
left join EmployeeInfo E1
on E.Manager_ID=E1.Employee_Id;

select * from vwEmpNameDeptNameManagerName

-- updating a view
begin tran
update vwEmpNameDeptNameManagerName
set Employee_Name ='Ariana Emanuel'
where Employee_Name = 'Ari Emanuel'

select * from vwEmpNameDeptNameManagerName

select * from EmployeeInfo
rollback tran

--===============================================================

create or alter view vwEmployeeNameDeptIDAndSalary
AS
SELECT Employee_ID,Employee_Name,Dept_ID,Salary
from EmployeeInfo

select * from vwEmployeeNameDeptIDAndSalary

--updating the view
-- it updates the underlying base table
begin tran
update vwEmployeeNameDeptIDAndSalary
set Employee_Name = 'ABC'
where Employee_Id =1

select * from EmployeeInfo
rollback tran

--deleting a record from view
--makes changes to the underlying base table
begin tran
delete from vwEmployeeNameDeptIDAndSalary
where Employee_Id =1

select * from EmployeeInfo
rollback tran

--Indexed views

create table Product
( ProductID int primary key,
Name varchar(10),
UnitPrice int)

create table ProductSales
(ProductID int,
QuantitySold int)

insert into Product values(1,'Books',20)
insert into Product values(2,'Pens',14)
insert into Product values(3,'Pencils',11)
insert into Product values(4,'BClips',10)

insert into ProductSales values(1,10)
insert into ProductSales values(3,23)
insert into ProductSales values(4,21)
insert into ProductSales values(2,12)
insert into ProductSales values(1,13)
insert into ProductSales values(3,12)
insert into ProductSales values(4,13)
insert into ProductSales values(1,11)
insert into ProductSales values(2,12)
insert into ProductSales values(1,14)

--create a view with 3 columns : Name,TotalSales,TotalTransactions

select * from Product
select * from ProductSales

create or alter view vwTotlSalesByproduct
with schemabinding
as
select Name, 
SUM(ISNULL((QuantitySold * UnitPrice),0)) as TotalSales,
COUNT_BIG(*) as TotalTransactions
from dbo.ProductSales
join dbo.Product
on ProductSales.ProductID = Product.ProductID
group by Name

select * from vwTotlSalesByproduct

--creating an index on the view
create unique clustered index UIX_vwTotlSalesByproduct_Name
on vwTotlSalesByproduct(Name)

