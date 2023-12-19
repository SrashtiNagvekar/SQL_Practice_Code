create trigger trMyFirstTrigger
on database
for create_table
as
begin
	print 'table created'
end

create table Test
(Id int)