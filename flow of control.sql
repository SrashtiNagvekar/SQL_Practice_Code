declare @var int;
set @var=10;
if @var >5
begin
print 'variable greater than 5';
end
else
begin
print 'variable less than 5';
end

--while loop
declare @counter_val int;
set @counter_val =1;
while @counter_val<=5
begin
	print 'counter value is : '+ cast(@counter_val as varchar)
	set @counter_val = @counter_val+1
end

--break 
declare @count int;
set @count =1;
while @count<5
begin
	if @count = 3
	begin
		print 'breaked out of while loop'
	end
	set @count=@count+1
end

--continue
DECLARE @Count1 INT   
SET @Count1 = 1  
WHILE (@Count1 <= 20)  
BEGIN  
  IF @Count1 % 2 = 0  
  BEGIN  
  SET @Count1 = @Count1 + 1  
  CONTINUE  
  END  
    PRINT 'The odd value is = ' + CONVERT(VARCHAR, @Count1)  
    SET @Count1 = @Count1 + 1  
END   

--CASE
select * from Family

select name,
case
when age>=18 then 'adult'
else 'minor' end as age_group
from Family;

SELECT CASE 2 WHEN 1 THEN 'one' WHEN 2 THEN 'two' ELSE 'more' END AS "CASE Result"; 