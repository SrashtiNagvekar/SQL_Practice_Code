select len(getdate())
select getdate()
select cast(getdate() as date)

select convert(int, convert(varchar(10), getdate(), 112))

select convert(varchar(10), getdate(), 112)