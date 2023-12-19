create table tblPerson
(ID int not null primary key,
Name nvarchar(10),
Email nvarchar(20),
GenderId int);

create table tblGender(
ID int not null primary key,
Gender nvarchar(20) not null);

alter table tblPerson add constraint tblPerson_GenderId_FK foreign key(GenderId) references tblGender(ID);

insert into tblGender values(1,'Female')
insert into tblGender values(2,'Male')
insert into tblGender values(3,'Unknown')

insert into tblPerson(ID,Name,Email) values(1,'Ana','a@gmail.com');
insert into tblPerson(ID,Name,Email) values(2,'Smith','a@gmail.com');
insert into tblPerson values(3,'Smith','smith@gmail.com',2);
insert into tblPerson values(4,'David','david@gmail.com',2);
insert into tblPerson values(5,'Pooja','dpooja@gmail.com',1);
insert into tblPerson values(6,'Angela','angela@gmail.com',1);

select top 3 *
from Employee;

select * from tblPerson;
select * from tblGender;

alter table tblPerson add constraint DF_tblPerson_GenderId default 3 for GenderId;

-- referential integrity constraint error
delete from tblGender where ID=2;
delete from tblGender where ID=1;

--adding check constraint
alter table tblPerson add age int;

alter table tblPerson add constraint CK_tblPerson_age check(age >0 and age < 150);
insert into tblPerson values(7,'Mike','mike@gmail.com',2,50);

create table emp1(
emp_id int primary key,
SSN varchar(11) unique,
email nvarchar(20) unique,
firstName varchar(10),
lastName varchar(10));

insert into emp1 values(1,123456789,'ana@gmail.com','Ana','J');

insert into emp1 values(2,null,'james@gmail.com','James','K');

select * from emp1;

insert into emp1 values(3,876912340,'kate@gmail.com','Kate','W');

--check
alter table emp1 add constraint CK_emp1_email check(email like '%@%')

insert into emp1 values(4,765321189,'will@gmail.com','William','C');

--NULL functions--

-- IS NULL
select * from emp1
where SSN IS NULL;

--IS NOT NULL
select * from emp1
where SSN IS NOT NULL;

--coalesce : returns the first non null value
select Coalesce(null,null,'apple','pear')

create table Users(
user_id int primary key,
work_email nvarchar(20),
personal_email nvarchar(20))

insert into Users values(1,'angel@datacamp.com',null);
insert into Users values(2,null,'bruce@gmail.com');
insert into Users values(3,'cath@datacamp.com','cath@datacamp.com');

select user_id,coalesce(personal_email,'Unknown') as coalesce_function_personal_email
from Users;

create table Products(
productID int primary key,
productName varchar(100),
productDesription varchar(100));

insert into Products values(1,'G.Skill Ripjaws V Series','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:4x16GBSize:64GB');
insert into Products values(2,'G.Skill Ripjaws V Series','Speed:DDR4-3200,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB');
insert into Products values(3,'Asus X99-E-10G WS','CPU:LGA2011-3,Form Factor:SSI CEB,RAM Slots:8,Max RAM:128GB');

select productName,coalesce(
case
when LEN(productDesription)>=60 then null
else productDesription
end,productName) as product_name_or_description
from Products;

select nullif('apple','apple')

create table ShowConstraints
(
employee_id int primary key,
email varchar(50) unique,
age int check(age>=18),
favSports varchar(20) default 'NA',
salary numeric not null,
)

--default value example
insert into ShowConstraints(employee_id,email,age,salary) values(1,'sam@gmail.com',20,500000)
select * from ShowConstraints

--unique key violation in email
insert into ShowConstraints(employee_id,email,age,favSports,salary) values(2,'sam@gmail.com',20,'Swimming',500000)

--check constraint violation
insert into ShowConstraints(employee_id,email,age,favSports,salary) values(3,'samm@gmail.com',12,'Swimming',500000)