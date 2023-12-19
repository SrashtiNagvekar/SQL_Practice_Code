DECLARE @floatVal FLOAT = 1234567890.123456789
SELECT @floatVal

DECLARE @decimalVal DECIMAL(18, 9) = 123456789.123456789
SELECT @decimalVal

DECLARE @floatVal1 FLOAT = 0.1 + 0.2
SELECT @floatVal1 

DECLARE @decimalVal1 DECIMAL(10, 1) = 0.1 + 0.2
SELECT @decimalVal1

declare @myInt date
select @myInt

SHIVA
select LEFT('SHIVA',1)
select LOWER(RIGHT('SHIVA',4))
select LEFT('SHIVA',1) + LOWER(RIGHT('SHIVA',4))

declare @var decimal(3,2) = 1.9
select @var

declare @var1 decimal(3,2) = 9.99
select @var1

declare @var2 decimal(3,2) = -9.99
select @var2

--cast function
declare @val varchar(10) = 'abc';
select cast(@val as int)
begin try
	select cast(@val as int)
end try
begin catch
	select 'conversion error : ' + ERROR_MESSAGE()
end catch

--convert function
declare @val1 varchar(10) = '123abc';
select convert(int,@val1)
