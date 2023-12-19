create table ParentTable
(
ParentID int primary key
)

create table ChildTable
(
ChildID int primary key,
ParentID int,
foreign key (ParentID) references ParentTable(ParentID) ON DELETE CASCADE ON UPDATE CASCADE)


INSERT INTO ParentTable (ParentID) VALUES (1);
INSERT INTO ChildTable (ChildID, ParentID) VALUES (101, 1);
INSERT INTO ChildTable (ChildID, ParentID) VALUES (102, 1); 

select * from ParentTable;
select * from ChildTable;

--delete the record with parentID = 1

delete from ParentTable
where ParentID = 1;

select * from ParentTable;
select * from ChildTable;
--After executing the DELETE statement on ParentTable, both rows in ChildTable with ParentID = 1 
--will be automatically deleted due to the DELETE CASCADE option. 
--This ensures that there are no orphaned records in the child table.

update ParentTable
set ParentID =3
where ParentID = 1
--After executing the UPDATE statement on ParentTable, both rows in ChildTable that had ParentID = 1
--will be automatically updated to have ParentID = 2 due to the UPDATE CASCADE option. 
--This ensures that the related data in the child table remains consistent with the changes made in the parent table.
