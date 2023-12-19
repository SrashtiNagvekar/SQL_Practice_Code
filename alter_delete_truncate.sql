--alter command to add new column

alter table Employee add Email varchar(50);

--alter command to drop a column

alter table Employee drop column Email;

--to change the data type of a column

alter table Employee add DateOfBirth varchar(10);

alter table Employee alter column DateOfBirth date;

alter table Employee drop column DateOfBirth;

create table temp(
no int primary key,
name varchar(10));

insert into temp values(1,'apple');
insert into temp values(2,'cherry');
insert into temp values(3,'pear');
insert into temp values(4,'grape');

select * from temp;

delete from temp;

delete from temp where name='pear';

insert into temp values(10,'kiwi');

truncate table temp;