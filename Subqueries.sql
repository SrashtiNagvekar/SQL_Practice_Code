select * from EmployeeInfo

-- 1.find emps whose salary is greater than the avg salary of all employees
select *
from EmployeeInfo
where salary > (select avg(salary) from EmployeeInfo)

--using join
select E.* 
from EmployeeInfo E
join (select avg(Salary) sal from EmployeeInfo) avg_sal
on E.Salary > avg_sal.sal;

--====================================================================
-- 2.find the emps who earn the highest salary in each dept
select Employee_Name,Dept_ID,max(salary) over(partition by Dept_ID)
from EmployeeInfo

--select *
--from EmployeeInfo
--where (Dept_ID , Salary) IN(select Dept_ID ,max(Salary)
--							from EmployeeInfo
--							group by Dept_ID)

--=======================================================================
-- 3.display those dept that have no emps

select Dept_Name,Dept_ID
from Departments
where Dept_ID not in
(select distinct dept_ID
from EmployeeInfo)

--using correlated subquery
select *
from Departments D
where not exists(select 1 from EmployeeInfo E where E.Dept_ID = D.Dept_ID )

--==================================================================

-- fetch all emp details and add remarks to those emps who earn more than the avg pay

--subquery in select clause

select Employee_Name,(CASE WHEN Salary > (select avg(salary) from EmployeeInfo) THEN 'Higher than average'
					  ELSE null END) as remarks
from EmployeeInfo

--avoid using subquery in SELECT
select Employee_Name,(CASE WHEN Salary > avg_sal.sal THEN 'Higher than average'
					  ELSE null END) as remarks
from EmployeeInfo
cross join (select avg(Salary) as sal from EmployeeInfo) avg_sal
