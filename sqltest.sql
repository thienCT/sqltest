create database testsql
go
use testsql
create table categories (
 cateid char(6) primary key not null,
 catename nvarchar(100) not null,
 description nvarchar (200) not null,
 );
 go
CREATE TABLE Parts (
    PartID int PRIMARY KEY IDENTITY(1,1),
    PartName nvarchar(100) NOT NULL,
    CateID char(6) foreign key REFERENCES Categories(CateID),
    description nvarchar(1000),
    Price money NOT NULL DEFAULT 0,
    Quantity int DEFAULT 0,
    Warranty int DEFAULT 1,
    Photo nvarchar(200) DEFAULT 'photo/nophoto.png'
);
--Insert into each table at least three records.
go
insert into categories (cateid,catename)
values ('CAT001', 'CPU'), ('CAT002', 'GPU'),('CAT003', 'RAM');
go
insert into Parts (PartName, CateID, description)
values	('CPU','CAT001', 'intel core i7'), 
		('GPU','CAT002', 'NVDIA RTX300'), 
		('CAT3000', 'RAM', 'RGP pro');
--List all parts in the store with price > 100$.
select PartID, PartName, price 
from Parts
where Price > 100;
--List all parts of the category ‘CPU’
select PartID, PartName, Price
from Parts 
where CateID = 'CAT001';
/*Create a view v_Parts contains the following information Create a view v_Parts contains the following information (PartID, PartName, CateName,
Price, Quantity) from table Parts and Categories.*/
create view v_Parts as 
select Parts.PartID, Parts.PartName, categories.catename, Parts.Price, parts.Quantity
from Parts
inner join categories on parts.CateID = categories.cateid;
select *from view_Parts;
--Create a view v_TopParts about 5 parts with the most expensive price.
create view v_TopParts 
select TOP 5 PartID, PartName, Price
from Parts 
order by Price desc;
select *from v_Parts;


