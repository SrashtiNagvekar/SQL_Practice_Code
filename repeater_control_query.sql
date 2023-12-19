create table tblCustomer
(
CustID int not null primary key,
Name varchar(50),
Balance money,
City varchar(50),
Status bit
)

insert into tblCustomer values(100,'Smith',1000,'Bangalore',1);
insert into tblCustomer values(101,'Alice',500,'Bangalore',0);
insert into tblCustomer values(102,'Rohan',2000,'Bangalore',1);
insert into tblCustomer values(103,'Kavya',400,'Bangalore',0);
insert into tblCustomer values(104,'Pooja',800,'Bangalore',1);
insert into tblCustomer values(105,'Alex',300,'Bangalore',0);

select * from tblCustomer;

create procedure sp_Customer_Select
@CustID int = null,
@Status bit = null
as
begin
set nocount on;
if @CustID is null and @Status is null
	select CustID,Name,Balance,City,Status from tblCustomer order by CustID
else if @CustID is not null and @Status is null
	select CustID,Name,Balance,City,Status from tblCustomer where CustID = @CustID
else if @CustID is null and @Status is not null
		select CustID,Name,Balance,City,Status from tblCustomer where Status = @Status order by CustID
else if @CustID is not null and @Status is not null
		select CustID,Name,Balance,City,Status from tblCustomer where CustID = @CustID and Status = @Status
end