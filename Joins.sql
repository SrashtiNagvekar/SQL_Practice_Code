select * from Employee;
select * from Department;

alter table Employee add manager_id int ;
alter table Employee add constraint FK_Employee_manager_id foreign key(manager_id) references Manager(manager_id);

update Employee
set manager_id =400
where emp_id=8;

--inner join
--fetch emp name and dept name
select emp_name,Dname
from Employee
inner join Department
on Dno=Dnumber;

update Employee
set Dno = null
where emp_id = 6 
--left join
select emp_name,Dname
from Employee
left join Department
on Dno=Dnumber;

--right join
select emp_name,Dname
from Employee
right join Department
on Dno=Dnumber;
insert into Employee values(8,'Kate',40000,2,'London')

create table Manager(
manager_id int primary key,
manager_name varchar(20),
dept_id int);

alter table Manager add constraint FK_manager_dept_id foreign key(dept_id) references Department(Dnumber);

create table Project(
project_id varchar(2),
project_name varchar(20),
team_member_id int);

alter table Project add constraint FK_Project_team_member_id foreign key(team_member_id) references Employee(emp_id); 
alter table Project add constraint FK_Project_team_member_id_manager_id foreign key(team_member_id) references Manager(manager_id); 
alter table Project alter column project_id int;
insert into Manager values(100,'Prem',3);
insert into Manager values(200,'Sripadh',4);
insert into Manager values(300,'Nick',1);
insert into Manager values(400,'Cory',1);

insert into Project values('P1','Data Migration',1);
insert into Project values('P1','Data Migration',2);
insert into Project values('P1','Data Migration',300);
insert into Project values('P2','ETL Tool',1);
insert into Project values('P2','ETL Tool',400);

select * from Manager;
select * from Project;

--fetch all emp,their manager,dept and projects they are working on

select e.emp_name,d.Dname,m.manager_name,p.project_name
from Employee e
left join Department d on e.Dno=d.Dnumber
join Manager m on e.manager_id=m.manager_id
left join Project p on p.team_member_id=e.emp_id

--full join

select e.emp_name,d.Dname
from Employee e
full join Department d
on e.Dno=d.Dnumber;

--cross join

select e.emp_name,d.Dname
from Employee e
cross join Department d

--self join

create table Family(
member_id varchar(2),
name varchar(20),
age int,
parent_id varchar(2))

insert into Family values('F1','David',4,'F5');
insert into Family values('F2','Carol',10,'F5');
insert into Family values('F3','Mihael',12,'F5');
insert into Family values('F4','Johnson',36,'');
insert into Family values('F5','Maryam',40,'F6');
insert into Family values('F6','Stewart',70,'');
insert into Family values('F7','Rohan',6,'F4');
insert into Family values('F8','Asha',8,'F4');
select * from family;
--fetch the child name and their age corresponding to their parent name and parent age

select child.name as [child name],child.age as [child age],parent.name as[parent name],parent.age as [parent age]
from family as child
join family as parent
on child.parent_id=parent.member_id

select * from Employee;

