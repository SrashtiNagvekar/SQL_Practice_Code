select *
from Employee
where salary>30000;

select avg(salary),Dnumber
from Employee,Department
where Employee.Dno=Department.Dnumber
group by Dnumber
having count(*)>=2
order by Dnumber DESC;

select count(*) from Employee;
select * from Employee;

select sum(salary) from Employee;

select min(salary) from Employee;

select max(salary) from Employee;