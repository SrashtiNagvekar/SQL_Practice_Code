execute sp_helpindex Employee
select * from Employee

insert into Employee values(10,'William',70000,3,'Toronto',100,'Male'),(9,'Michael',50000,2,'Sydney',200,'Male');

--composite clustered index
create clustered index IX_Employee_Gender_Salary
on Employee(gender desc,salary asc)

--non clustered index
create nonclustered index IX_Employee_Emp_Name
on Employee(emp_name)

create nonclustered index IX_Employee_City
on Employee(city)

select emp_name 
from Employee

select emp_name
from Employee
where city='London';
