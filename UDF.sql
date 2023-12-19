select * from EmployeeInfo

create function CalculateExperienceOfEmployee(@Hire_Date DATE)
RETURNS INT
AS
BEGIN
DECLARE @Value int;
SET @Value = DATEDIFF(year,@Hire_Date,getdate())
return @Value
END

--to call the scalar UDF
select Practice.dbo.CalculateExperienceOfEmployee('2019-08-12') as experience

--UDF can be used in SELECT clause
select Employee_Name,dbo.CalculateExperienceOfEmployee(Hire_Date) as experience
from EmployeeInfo

--UDF can be used in SELECT WHERE clause
-- displaying those employees whose experience is greater than 5 years
select Employee_Name,dbo.CalculateExperienceOfEmployee(Hire_Date)
from EmployeeInfo
where dbo.CalculateExperienceOfEmployee(Hire_Date)>5


----------------------------------------INLINE TABLE-VALUED FUNCTION-----------------------------------------------------
create function fn_EmployeesByDept(@Dept_Id int)
returns TABLE
AS
RETURN(select Employee_Name
		from EmployeeInfo
		where Dept_ID=@Dept_Id)

--altering the function
alter function fn_EmployeesByDept(@Dept_Id int)
returns TABLE
AS
RETURN(select Employee_Name,Dept_ID
		from EmployeeInfo
		where Dept_ID=@Dept_Id)

--calling the function
select * from fn_EmployeesByDept(30);
select * from fn_EmployeesByDept(30) where Employee_Name='Anand'

--using joins with inline function
select E.Employee_Name,D.Dept_Name
from fn_EmployeesByDept(30) E
join Departments D
on E.Dept_ID=D.Dept_ID

---------------------------------MULTISTATEMENT TABLE VALUED FUNCTION----------------------------

create function fn_MSTVF_GetEmployees()
RETURNS @Table TABLE(Emp_ID int,Emp_Name varchar(50),Dept_ID int)
as
begin
	insert into @Table
	select Employee_Id,Employee_Name,Dept_ID from EmployeeInfo
	return
end

select * from fn_MSTVF_GetEmployees()

--------------------------------------------------------------------------------------------
-- Create a UDF that calculates the annual salary of an employee based on their monthly salary.

create function CalculateAnnualSalary(@MonthlySalary numeric)
returns numeric
as
begin
	declare @AnnualSalary numeric;
	set @AnnualSalary = @MonthlySalary * 12;
	return @AnnualSalary;
end

select Employee_Id,Employee_Name,Salary as [Monthly Salary],Practice.dbo.CalculateAnnualSalary(Salary) as [Annual Salary]
from EmployeeInfo

---------------------------------------------------------------------------------------------------------------

--Create a UDF that calculates the number of years an employee has been with the company based on their hire date.

create function CalculateYearsOfService(@Hire_Date date)
returns int
as
begin
	declare @Years int;
	set @Years = DATEDIFF(YEAR,@Hire_Date,GETDATE());
	return @Years;
end

select Employee_Id,Employee_Name,Salary as [Monthly Salary],Practice.dbo.CalculateYearsOfService(Hire_Date) as [Years of Service]
from EmployeeInfo

----------------------------------------------------------------------------------------------------------
--Create an ITVF that returns all employees hired in a specific year.

CREATE FUNCTION GetEmployeesHiredInYear (@hireYear INT)
RETURNS TABLE
AS
RETURN (
    SELECT Employee_Name,Hire_Date
    FROM EmployeeInfo
    WHERE YEAR(Hire_Date) = @hireYear
);
select * from EmployeeInfo
select * from dbo.GetEmployeesHiredInYear(2022)

-- Create an ITVF that returns employees with a salary above a specified threshold.

create function GetSalaryAboveThreshold(@threshold int)
returns table
as
return (
select Employee_Name,Salary
from EmployeeInfo
where Salary > @threshold);

select * from GetSalaryAboveThreshold(50000)

--

