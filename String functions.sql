select ASCII('A')

--returns the ascii code of 'A'
select ASCII('AB')

select ASCII('BCD')

select CHAR(65)

--printing A-Z
declare @Start int
set @Start =  65
while (@Start <= 90)
begin
	print char(@Start)
	Set @Start=@Start +1
end
--------------------------------------------------------------------------------------
--TRIM
SELECT LTRIM('   Hello   ') AS TrimmedString
SELECT RTRIM('   Hello   ') AS TrimmedString
select LTRIM('XHelloX','X')
select RTRIM('XHelloX','X')
select TRIM('       hello      ')

select UPPER('Sam')
select LOWER('RAM')

select Name,len(Name) as length from tblPerson;

select LEFT('ABCDEF',3);
select RIGHT('ABCDEF',3);

-----------------------------------------------------------------------------------------------------------

--CHARINDEX() is a SQL Server function used to find the starting position of a substring within a string. 
select CHARINDEX('a','sara@aaa.com')
select CHARINDEX('a','sara@aaa.com',3)
select CHARINDEX('aa','sara@aaa.com')
select CHARINDEX('@','a@gmail.com')

--------------------------------------------------------------------------------------------------------

--SUBSTRING() is a SQL function used to extract a substring from a string. 
--It takes three arguments: the string you want to extract from, the starting position of the substring, and the length of the substring.
select SUBSTRING('smith.john@gmail.com',12,9)
select SUBSTRING('a@gmail.com',CHARINDEX('@','a@gmail.com')+1,LEN('a@gmail.com')-CHARINDEX('@','a@gmail.com'))

DECLARE @FullName varchar(20);
SET @FullName = 'Joe Smith'
--get the first name
SELECT SUBSTRING(@FullName,1,CHARINDEX(' ',@Fullname)-1)
--to get the last name
select SUBSTRING(@FullName,CHARINDEX(' ',@FullName)+1,LEN(@FullName)-CHARINDEX(' ',@FullName))

---------------------------------------------------------------------------------------------------------------------

select LEN('hello      ') --it will not count the spaces on the RHS
select * from tblPerson;

select SUBSTRING(Email,CHARINDEX('@',Email)+1,LEN(Email)-CHARINDEX('@',Email)) as domain,count(Email) as count
from tblPerson
group by SUBSTRING(Email,CHARINDEX('@',Email)+1,LEN(Email)-CHARINDEX('@',Email))

--reverse
select reverse('hello')
--replicate
select replicate('*',3)+'@gmail.com'

--patindex
SELECT PATINDEX('%pp%', 'apple') AS Position

SELECT PATINDEX('%pp%', 'applepp') AS Position

select Email,PATINDEX('%@gmail.com',Email) as occurence
from tblPerson
where PATINDEX('%@gmail.com',Email)>0

select PATINDEX('%ing','Interesting')

select REPLACE(Email,'.com','.net')
from tblPerson

select * from tblPerson

select stuff('hello world',7,5,'universe')
