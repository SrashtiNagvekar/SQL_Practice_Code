create table tblPhysicalAddress(
AddressID int not null primary key,
EmployeeNumber int,
HouseNumber varchar(5),
StreetAddress varchar(10),
City varchar(10),
PostalCode varchar(10));

create table tblMailingAddress(
AddressID int not null primary key,
EmployeeNumber int,
HouseNumber varchar(5),
StreetAddress varchar(10),
City varchar(10),
PostalCode varchar(10));

insert into tblPhysicalAddress values(1,101,'#10','Kingstreet','LONDOON','CR27DW')

insert into tblMailingAddress values(1,101,'#10','Kingstreet','LONDOON','CR27DW')

select * from tblMailingAddress;
select * from tblPhysicalAddress;

--Updates LONDOON to LONDON
create procedure spUpdateAddress
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE tblPhysicalAddress SET City='LONDON' WHERE AddressID=1 and EmployeeNumber=101;

			UPDATE tblMailingAddress SET City='LONDON' WHERE AddressID=1 and EmployeeNumber=101;

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END

execute spUpdateAddress

--creating a SP to create an error
create procedure spUpdateAddress1
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			UPDATE tblPhysicalAddress SET City='LONDON1' WHERE AddressID=1 and EmployeeNumber=101;

			--This generates error because the size of city is varchar(10)
			UPDATE tblMailingAddress SET City='LONDON LONDON' WHERE AddressID=1 and EmployeeNumber=101;

		COMMIT TRANSACTION
		PRINT 'Transaction committed'
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT 'Transaction rolled back'
	END CATCH
END

execute spUpdateAddress1
--output
--(1 row affected)

--(0 rows affected)
--Transaction rolled back

begin transaction
update tblPhysicalAddress
set PostalCode='560098'
where EmployeeNumber=101
rollback transaction
--set transaction isolation level read uncommitted