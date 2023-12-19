declare @name varchar(50)
declare @salary int

-- declaring a cursor
declare EmployeeCursor cursor for
select Employee_Name,Salary
from EmployeeInfo
where Dept_ID =30

--open the cursor
open EmployeeCursor

--
fetch next from EmployeeCursor into @Name,@salary

while(@@FETCH_STATUS = 0)
begin
	print 'name : '+ @Name +'Salary : '+ cast(@salary as varchar) 
	fetch next from EmployeeCursor into @Name,@salary
end
 
close EmployeeCursor
deallocate EmployeeCursor

