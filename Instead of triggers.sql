select * from tblEmployee
select * from tblDepartment

create view vwEmployeeDetails
as
select E.Id,E.Name,E.gender,D.Deptname
from tblEmployee E
join tblDepartment D
on E.DeptId = D.DeptId

select * from vwEmployeeDetails

--View or function 'vwEmployeeDetails' is not updatable because the modification affects multiple base tables.
insert into vwEmployeeDetails values(7,'Jenny','Female','IqwT')

create trigger tr_vwEmployeeDetails_InsteadOfInsert
on vwEmployeeDetails
instead of insert
as
begin
	select * from inserted
	select * from deleted
end

alter trigger tr_vwEmployeeDetails_InsteadOfInsert
on vwEmployeeDetails
instead of insert
as
begin
	declare @DeptId int
	--check if there is a valid department id for the given dept name
	select @DeptId = DeptId
	from tblDepartment
	join inserted
	on inserted.DeptName = tblDepartment.DeptName

	--if department id is null throw an error
	--and stop processing
	--this happens if th user types a dept name that does not exist
	if(@DeptId is null)
	begin
		raiserror('invalid dept name. statement terminated',16,1)
		return 
	end
	-- finally insert into tblEmployee
	insert into tblEmployee(Id,Name,Gender,DeptId)
	select id,Name,Gender,@DeptId
	from inserted

end

insert into vwEmployeeDetails values(7,'Jenny','Female','IqwT') --invalid dept name. statement terminated
insert into vwEmployeeDetails values(7,'Jenny','Female','IT')

--======================================================================================================

-- instead of update trigger
select * from vwEmployeeDetails

update vwEmployeeDetails	--View or function 'vwEmployeeDetails' is not updatable because the modification affects multiple base tables.
set Name = 'Johnny',DeptName = 'IT'
where Id=1

--update function checks if the column is been changed by the update statement

Create Trigger tr_vWEmployeeDetails_InsteadOfUpdate
on vWEmployeeDetails
instead of update
as
Begin
 -- if EmployeeId is updated
 if(Update(Id))
 Begin
  Raiserror('Id cannot be changed', 16, 1)
  Return
 End
 
 -- If DeptName is updated
 if(Update(DeptName)) 
 Begin
  Declare @DeptId int

  Select @DeptId = DeptId
  from tblDepartment
  join inserted
  on inserted.DeptName = tblDepartment.DeptName
  
  if(@DeptId is NULL )
  Begin
   Raiserror('Invalid Department Name', 16, 1)
   Return
  End
  
  Update tblEmployee set DeptId = @DeptId
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
 
 -- If gender is updated
 if(Update(Gender))
 Begin
  Update tblEmployee set Gender = inserted.Gender
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
 
 -- If Name is updated
 if(Update(Name))
 Begin
  Update tblEmployee set Name = inserted.Name
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
End

-- update john's dept to IT
update vwEmployeeDetails
set DeptName = 'IT'
where id = 1;

select * from vwEmployeeDetails
select * from tblEmployee

update vwEmployeeDetails
set Name = 'Johnny',DeptName = 'IT',Gender = 'Female'
where id = 1;

--==========================================================================================

-- instead of trigger delete

--deleting a record in vwEmployeeDetails having Id =1
--View or function 'vwEmployeeDetails' is not updatable because the modification affects multiple base tables.

delete from vwEmployeeDetails
where Id = 1 

--creating the  trigger
create trigger tr_vwEmployeeDetails_InsteadOfDelete
on vwEmployeeDetails
instead of delete
as
begin
	--subquery
	delete 
	from tblEmployee
	where Id in (select Id from deleted)
end

--deleting record with id = 4
delete 
from vwEmployeeDetails
where Id = 4

