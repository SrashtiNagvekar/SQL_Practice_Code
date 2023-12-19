select * from EmployeeInfo
select * from Departments


select  CURRENT_TIMESTAMP

--ISDATE
select ISDATE(getdate()) --returns 1
select ISDATE('Apple')  --returns 0
Select ISDATE('2012-09-01 11:34:21.1918447') --returns 0 for datetime2 nd datetimeoffset

--DAY() : returns the day no of the month
select DAY(GETDATE());

--MONTH()
select MONTH(GETDATE())

--YEAR()
select YEAR(GETDATE())

--DATENAME()
select DATENAME(WEEKDAY,GETDATE())
select DATENAME(DAY,GETDATE())
select DATENAME(MONTH,GETDATE())
SELECT DATENAME(MONTH, '2023-09-27')
SELECT DATENAME(YEAR, '2023-09-27')
SELECT DATENAME(WEEK, '2023-09-27')
SELECT DATENAME(WEEKDAY, '2023-09-27')


--DATEPART()
select DATEPART(week,getdate())
select DATEPART(month,getdate())
select DATEPART(year,'2023-08-18')
select DATEPART(month,'2023-8-18')
select DATEPART(day,'2023-08-18')
select DATEPART(hour,'2023-08-18 10:30:00')
select DATEPART(minute,'2023-08-18 10:30:00')
select DATEPART(second,'2023-08-18 10:30:00')

--DATEADD()
select DATEADD(day,20,'2023-09-07 19:45:31.793')
select DATEADD(day,3,'2023-09-07') -- to add 3 days
select DATEADD(day,-3,'2023-09-07') -- to subtract 3 days
select DATEADD(month,-2,'2023-9-7') -- substract 2 mnths
select DATEADD(hour,2,'2023-9-7 12:30:00') --adding 2 hrs
select DATEADD(minute,15,'2023-9-7 12:30:00') --add 15 mins
select DATEADD(minute,-15,'2023-9-7 12:30:00') --sub 15 mins
select DATEADD(year,15,'2023-9-7 12:30:00') --add 15 years



--DATEDIFF()
select DATEDIFF(day,'9/7/2023','9/20/2023')
select DATEDIFF(MONTH,'9/7/2023','8/20/2023')
SELECT DATEDIFF(DAY, '2023-09-01', '2023-09-10')
SELECT DATEDIFF(MONTH, '2023-05-01', '2023-09-10')
SELECT DATEDIFF(DAY, '2023-09-01', '2023-09-10')
SELECT DATEDIFF(YEAR, '2001-04-12', '2023-09-28')

create table temp1(
Id int primary key,
Name varchar(20),
DOB datetime)

insert into temp1 values(1,'Sam','1980-12-30 00:00:00.000')
insert into temp1 values(2,'Pam','1982-09-01 12:02:36.260')
insert into temp1 values(3,'John','1985-08-22 12:03:30.370')
insert into temp1 values(4,'Sara','1979-11-29 12:59:30.670')

select * from temp1

--CAST()
select Id,Name,CAST(DOB AS nvarchar) AS ConvertedDOB
from temp1;

--CONVERT
select Id,Name,CONVERT(nvarchar,DOB,103) as convertedDOB
from temp1;

select cast(getdate() as date)