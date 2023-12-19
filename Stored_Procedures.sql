Create procedure spGetEmployees
AS
BEGIN
select emp_name,Dno
from Employee
END

select * from Employee;

alter procedure spGetEmployeesByNameAndDept
@DepartmentNo int
with encryption
AS
BEGIN
select emp_name,Dno
from Employee
where Dno=@DepartmentNo
order by emp_name
END;

sp_helptext spGetEmployeesByNameAndDept

spGetEmployeesByNameAndDept 5

--sp_helptext spGetEmployeesByNameAndDept

--stored procedure with parameters
create procedure spGetEmployeeCountByDept
@DeptNo int,
@EmpCount int output
AS
BEGIN
select @EmpCount=count(emp_id)
from Employee
where Dno=@DeptNo
END

declare @TotalCount int
execute spGetEmployeeCountByDept 4 , @TotalCount output
print @TotalCount

-- sp to get emp count
create procedure spGetEmpCount
@count int out
as
begin
	select @count = count(emp_id)
	from Employee;
end

declare @empcount int 
exec spGetEmpCount @empcount out
print @empcount

--sp_help spGetEmployeeCountByDept
--sp_help Employee
--sp_depends spGetEmployeeCountByDept

--SP with RETURN
create procedure spGetTotalEmployeeCount
AS
BEGIN
RETURN(select count(emp_id) from Employee)
END

declare @TotalCount int
execute @TotalCount = spGetTotalEmployeeCount
print @TotalCount

--using output parameter
create procedure spGetEmployeeById
@Id int,
@Name nvarchar(10) output
AS
BEGIN
select @Name=emp_name from Employee where emp_id=@Id
END

declare @Res nvarchar(10)
execute spGetEmployeeById 4 ,@Res output
print 'name = '+@Res

--using return value
--Conversion failed when converting the varchar value 'Jennifer' to data type int.
create procedure spGetEmployeeById2
@Id int
AS
BEGIN
return (select emp_name from Employee where emp_id=@Id)
END

declare @Result varchar(10)
execute @Result = spGetEmployeeById2 4
print @Result

-- SP with default parameters
create procedure spGetEmployee
@EmpID int = NULL,
@DeptID int = 0
as
begin
	if @EmpID is not null
		select * from EmployeeInfo where Employee_Id = @EmpID;
	else
		select * from EmployeeInfo where Dept_ID = @DeptID;
end

--@EmployeeID and @DepartmentID. @EmployeeID has a default value of NULL, 
--and @DepartmentID has a default value of 0. 
--This means that when you call the procedure, 
--you can provide values for both parameters, one of them, or neither, depending on your needs.

-- call with both the parametes specified
exec spGetEmployee @EmpID = 1, @DeptID = 20

--call with empid
exec spGetEmployee @EmpID = 10;

--call with dept id
exec spGetEmployee @DeptID = 30;

--call without parameters
exec spGetEmployee;