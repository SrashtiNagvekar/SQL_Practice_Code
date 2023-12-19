--Triggers
select * from Product

--this table stores the audit information
create table ProductAudit
(
Id int identity(1,1),
Info varchar(100)
)

--INSERT DML after trigger 
create trigger tr_Product_Insert
ON product 
FOR INSERT
AS
BEGIN
	DECLARE @Id int
	select @Id = ProductID from inserted

	insert into ProductAudit values('new product with ID = '+cast(@Id as varchar)+ ' is added at '+ cast(getdate() as nvarchar(20)))
END

insert into Product values(5,'Erasers',10)
select * from ProductAudit

-- After Trigger for deletion

create trigger tr_Product_Delete
on Product
for delete
as
begin
	DECLARE @Id int
	select @Id = ProductID from deleted

	insert into ProductAudit values('An existing product with ID = '+cast(@Id as varchar)+ ' is deleted at '+ cast(getdate() as nvarchar(20)))
end

delete from Product where ProductID = 5
select * from ProductAudit

--================================================================================

--After DML Update trigger

create trigger tr_product_update
on Product
for update
as 
begin
	select * from deleted
	select * from inserted
end

select * from ProductAudit
update Product
set UnitPrice = 30
where ProductID =1

-- update trigger for employee table

create table tblDepartment
(
DeptId int primary key,
DeptName varchar(20)
)

create table tblEmployee(
id int primary key,
Name varchar(20),
Gender varchar(10),
DeptId int ,
foreign key (DeptId) references tblDepartment(DeptId)
)

insert into tblDepartment values(1,'IT'),(2,'Payroll'),(3,'HR'),(4,'Admin');

insert into tblEmployee values (1,'John','Male',3)
insert into tblEmployee values (2,'Mike','Male',2)
insert into tblEmployee values (3,'pam','Female',1)
insert into tblEmployee values (4,'Todd','Male',4)
insert into tblEmployee values (5,'Sara','Female',1)
insert into tblEmployee values (6,'Ben','Male',3)

select * from tblEmployee
select * from tblDepartment

--create table for EmployeeAudit

create table EmployeeAudit
(
Id int identity(1,1),
AuditInfo varchar(1000))


create trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
      -- Declare variables to hold old and updated data
      Declare @Id int
      Declare @OldName nvarchar(20), @NewName nvarchar(20)
      Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
      Declare @OldDeptId int, @NewDeptId int
     
      -- Variable to build the audit string
      Declare @AuditString nvarchar(1000)
      
      -- Load the updated records into temporary table
      Select *
      into #TempTable
      from inserted
     
      -- Loop thru the records in temp table
      While(Exists(Select Id from #TempTable))
      Begin
            --Initialize the audit string to empty string
            Set @AuditString = ''
           
            -- Select first row data from temp table
            Select Top 1 @Id = Id, @NewName = Name, 
            @NewGender = Gender, 
            @NewDeptId = DeptId
            from #TempTable
           
            -- Select the corresponding row from deleted table
            Select @OldName = Name, @OldGender = Gender, 
             @OldDeptId = DeptId
            from deleted where Id = @Id
   
     -- Build the audit string dynamically           
            Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
            if(@OldName <> @NewName)
                  Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
                 
            if(@OldGender <> @NewGender)
                  Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender
                 
            
                  
     if(@OldDeptId <> @NewDeptId)
                  Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))
           
            insert into EmployeeAudit values(@AuditString)
            
            -- Delete the row from temp table, so we can move to the next row
            Delete from #TempTable where Id = @Id
      End
End

select * from tblEmployee
select * from EmployeeAudit

update tblEmployee
set Name = 'Srashti',Gender ='Female'
where Id = 5
