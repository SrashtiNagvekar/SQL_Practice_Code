create table tblperson1(
personId int identity(1,1) primary key,
personName varchar(10));

insert into tblperson1 values('Tom');
insert into tblperson1 values('smith');
insert into tblperson1 values('anna');
insert into tblperson1 values('john');

select * from tblperson1;

delete from tblperson1 where personId=1;
insert into tblperson1 values('jenny');

--cannot explicitly mention the value for identity column
--insert into tblperson1 values(1,'tom');

set identity_insert tblperson1 ON;

insert into tblperson1(personId,personName) values(1,'tom');

set identity_insert tblperson1 OFF;
insert into tblperson1 values('martin');

delete from tblperson1;
dbcc checkident(tblperson1,reseed,0);