-- CTE

-- 1. Fetch those employees who earn more than the avg salary of all emps

;WITH average_salary (avg_sal) AS
(select cast(avg(salary) as int) from EmployeeInfo)
select *
from EmployeeInfo e,average_salary av
where e.Salary > av.avg_sal

