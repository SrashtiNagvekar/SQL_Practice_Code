select * from Employees
create procedure spGetAllEmployees
as
begin
select * from Employees;
end


exec spGetAllEmployees
------------------------------------------------------------------

create procedure spGetEmpById
@Id int
as
begin
select * from Employees 
where ID=@Id;
end

exec spGetEmpById 3
---------------------------------------------------------------

create procedure spCreateEmployee
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @JobTitle NVARCHAR(100),
    @Salary DECIMAL(10, 2)
AS
BEGIN
    -- Insert a new employee record into the Employees table
    INSERT INTO Employees (FirstName, LastName, JobTitle, Salary)
    VALUES (@FirstName, @LastName, @JobTitle, @Salary);

    -- Optionally, you can return information about the inserted record
    SELECT SCOPE_IDENTITY() AS EmployeeID;
END;
-------------------------------------------------------------------------
create procedure spTransferFunds
@FromAccount int,
@ToAccount int,
@Amount decimal(10,2)
as
begin
	begin try
		begin transaction
		
		--deduct amount from the sender's account
		update Account
		set Balance = Balance - @Amount
		where AccountID = @FromAccount;

		--Add amount to he destination account
		update Account
		set Balance = Balance + @Amount
		where AccountID = @ToAccount;
		commit;

	end try
	begin catch
		--if error occurs rollback the transaction
		rollback;
	end catch
end;
-------------------------------------------------------------------
-- Create a stored procedure named SearchEmployees that allows users to search for employees based on 
-- dynamic criteria such as name, job title, and department.

alter procedure spSearchEmployees
@FirstName nvarchar(50)=null,
@LastName nvarchar(50)=null,
@DeptId nvarchar = null
as
begin

--declare @FirstName nvarchar(50)='john'
--declare @LastName nvarchar(50) ='A'
--declare @DeptId nvarchar='1';
	declare @sql nvarchar(max);
	declare @where nvarchar(max)=' ';
	set @sql='select * from Employees where 1=1';
	--Print @sql
	if @FirstName is not null
		set @where = @where +'and FirstName = '''  + @FirstName +''' ' ;
	
	if @LastName is not null
		set @where = @where +'and LastName = '''  +@LastName +''' ' ;

	if @DeptId is not null
		set @where = @where +'and DepartmentId = '''  +@DeptId +''' ' ;
	--exec sp_executesql @sql,
	--N'@FirstName nvarchar(50),@LastName nvarchar(50),@DeptId int',
	--@FirstName, @LastName , @DeptId
	set @sql = @sql + @where;
	--print @sql;
 exec sp_executesql @sql;

	End;

 



EXEC spSearchEmployees 'John', 'Stanmore' , '1';   
EXEC spSearchEmployees 'John', 'Stanmore' , '1';

----------------------------------------------------------------------
-- Create a stored procedure named UpdateEmployeeSalary that takes an employee ID and a new salary as 
-- parameters and updates the salary for the specified employee.