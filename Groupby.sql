select * from Employee;
select * from Department;
alter table Employee add City nvarchar(10)

select City,count(emp_id) 
from Employee
group by City 
having City='London'

--to display those dept that have more than 3 employees
select Dname,count(emp_id) as [total employees]
from Employee,Department
where Dno=Dnumber
group by Dname
having count(emp_id)>3



-- max salary per dept
select top 1 max(salary) as max_sal,Dno
from Employee
group by Dno
order by max(salary) DESC;


select Dname,sum(salary) as Sumofsalary
from Employee,Department
group by Dno
having Dno=(select A.Dno, max(A.Totalsalary) from
select Top 1 A.Dno,a.Totalsalary from (select Dno,sum(salary) as Totalsalary
from Employee group by Dno) A order by Totalsalary desc
);

select d.Dname,max(salary)
from Employee e
right join Department d
on e.Dno=d.Dnumber
group by d.Dname;

--salary total of each dept
select Dname,max(salary)
from Employee
right join Department
on Dno=Dnumber
group by Dname;

--no of emps in each dept
select count(e.emp_id)as[emp count],d.Dname
from Employee e
right join Department d
on e.Dno=d.Dnumber
group by Dname
