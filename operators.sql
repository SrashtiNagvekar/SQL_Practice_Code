select * from Employee;
select * from emp1;

--union

select emp_name
from Employee
union
select firstName
from emp1;

select distinct Dno
from Employee

select emp_name
from Employee
where salary > 30000
union
select firstName
from emp1;

--union all
select emp_name
from Employee
union all
select firstName
from emp1;

--intersect
select emp_name
from Employee 
intersect
select firstName
from emp1;

--IN
select emp_name
from Employee
where emp_name IN ('Kate','Ana','Ramesh')

--OR
select emp_name
from Employee
where emp_name ='Mahesh'
OR emp_name='Kate'
or emp_name='Ramesh'

select emp_name
from Employee
where emp_name not in ('kate','ramesh');

select emp_name
from Employee
where emp_name<>'kate' and emp_name <> 'ramesh';

--between
select * from family
select name
from Family
where age not between 10 and 20

--is null
select name 
from Family
where parent_id is not null

select firstName
from emp1
where SSN is null

--like
select emp_name
from Employee
where emp_name like 'J%'

select emp_name
from Employee
where emp_name like 'Jo[scye]ce%'

select emp_name
from Employee
where emp_name like 'Jo[sce]ce%'

select emp_name
from Employee
where emp_name like 'J____'

--exists
select * from Department
select Dname
from Department
where not exists(select 1 from Employee where Dno=Dnumber)


--except
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50)
);

-- Create a table of former employees
CREATE TABLE former_employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50)
);

INSERT INTO employees (employee_id, employee_name)
VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith'),
    (3, 'Bob Johnson');

INSERT INTO former_employees (employee_id, employee_name)
VALUES
    (1, 'John Doe'),
    (4, 'Alice Brown');
--to find current employees who are not former emps
select employee_id,employee_name
from employees
except
select employee_id,employee_name
from former_employees