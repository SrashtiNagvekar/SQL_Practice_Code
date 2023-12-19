-- 1. find the max salary in each dept

-- step 1: Displaying the dept_id nd corresponding max salary
select Dept_ID,max(salary) as max_sal
from EmployeeInfo
group by Dept_ID;

-- making max() as a window function using OVER clause

select *, max(salary) over (partition by dept_id) as max_sal
from EmployeeInfo

--========================================================================
--ROW_NUMBER

-- with PARTITION BY
select *, ROW_NUMBER() over(partition by Dept_ID order by Dept_ID) as rn
from EmployeeInfo

--without PARTITION BY
select *, ROW_NUMBER() over(order by Dept_ID) as rn
from EmployeeInfo

--==========================================================================
-- RANK and DENSE_RANK

-- rank the emp based on salary

select *,RANK() over(partition by Dept_ID order by Salary DESC) as [rank]
from EmployeeInfo

select *,DENSE_RANK() over(partition by Dept_ID order by Salary DESC) as [rank]
from EmployeeInfo

--====================================================================================

--Running Total

select Employee_Name,Salary,SUM(Salary) over(order by Employee_Id) as running_total
from EmployeeInfo

-- order by Salary
-- if there are duplicate values in the Salary column , all the duplicate values will be added to the running total at once.
select Employee_Name,Salary,SUM(Salary) over(order by Salary) as running_total
from EmployeeInfo

--=========================================================================================

--NTILE

select Employee_Name,Salary,NTILE(2) over(order by Salary) as [Ntile]
from EmployeeInfo

select Employee_Name,Salary,NTILE(3) over(order by Salary) as [Ntile]
from EmployeeInfo

-- group no exceeding the no of rows.It will try to create as many groups as possible
select Employee_Name,Salary,NTILE(1021) over(order by Salary) as [Ntile]
from EmployeeInfo

--using partition by
select Employee_Name,Salary,Dept_ID,NTILE(1021) over(partition by Dept_ID order by Salary) as [Ntile]
from EmployeeInfo

--===============================================================================================

--LEAD and LAG

select Employee_Name,Salary,
LEAD(Salary,2,-1) over (order by Salary)as [Lead],
LAG(Salary,1,-1) over (order by Salary)as [Lag]
from EmployeeInfo

--with partition
select Employee_Name,Salary,Dept_ID,
LEAD(Salary,2,-1) over (partition by Dept_ID order by Salary)as [Lead],
LAG(Salary,1,-1) over (partition by Dept_ID order by Salary)as [Lag]
from EmployeeInfo

--============================================================================

--FIRST_VALUE

--displays the emp name whose has the min salary
select Employee_Name,Salary,Dept_ID,
FIRST_VALUE(Employee_Name) over (order by Salary) as FirstValue
from EmployeeInfo

-- displays the emp name with min salary in each dept
select Employee_Name,Salary,Dept_ID,
FIRST_VALUE(Employee_Name) over ( partition by Dept_ID order by Salary) as FirstValue
from EmployeeInfo
--==================================================================================

select avg(salary)
from EmployeeInfo
-- here it is performing running totals because by default the rows and range clause is
-- RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW is by default
-- the average is calculated from the preceeding row till each current row
select Employee_Name,Salary,
AVG(Salary) over (order by Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as avg_sal
from EmployeeInfo

--using partition
select Employee_Name,Salary,Dept_ID,
AVG(Salary) over (partition by Dept_ID order by Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as avg_sal
from EmployeeInfo

--here RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING is used
-- the average salary is calculated from the starting row to the last row of the result set
select Employee_Name,Salary,
AVG(Salary) over (order by Salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as avg_sal
from EmployeeInfo

--using partition
select Employee_Name,Salary,Dept_ID,
AVG(Salary) over (partition by Dept_ID order by Salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as avg_sal
from EmployeeInfo

select Employee_Name,Salary,
AVG(Salary) over (order by Salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as avg_sal,
SUM(Salary) over (order by Salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as sum_sal,
COUNT(Salary) over (order by Salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as count_sal
from EmployeeInfo

--Difference between ROWS and RANGE
Select Employee_name,Salary,
SUM(Salary) over(order by Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as sum_sal
from EmployeeInfo

Select Employee_name,Salary,
SUM(Salary) over(order by Salary RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as sum_sal
from EmployeeInfo

--=========================================================================
--LAST_VALUE

--the person with highest salary is expected
--but the result is different
--because by deault it is RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
Select Employee_Name,Salary,
LAST_VALUE(Employee_Name)over(order by Salary)
from EmployeeInfo

--this returns the person with highest salary
Select Employee_Name,Salary,
LAST_VALUE(Employee_Name) over(order by Salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_val
from EmployeeInfo

--retrieving the person with highest salary in each dept
Select Employee_Name,Dept_ID,Salary,
LAST_VALUE(Employee_Name) over(partition by Dept_ID order by Salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_val
from EmployeeInfo