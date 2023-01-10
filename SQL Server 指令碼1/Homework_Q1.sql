--�@(�@)1.
select* from Employees
where City='London'

--�@(�@)2.
select* from Employees
where HireDate >= '1993-01-01'

--�@(�@)3.
select* from Orders
--where ShipCity='Reims'or ShipCity='Lander' or ShipCity='Madrid'
where ShipCity in('Reims','Lander','Madrid')
order by ShipCity

--�@(�@)4.
--�]��6,7���P�˼ƶq�A�ҥH�n�O�o�[with ties
select top 6  with ties*
from Products
order by UnitsInStock desc

--�@(�@)5.
select OrderID,ProductID from OrderDetails
where OrderID=10847

--�@(�@)6.
select * from Orders
where ShippedDate is null

--�@(�@)7.
select * from Customers
where City in('Montreal','Lisboa','Lyon','Stavern','Geneve','Bruxelles','Madrid')
order by City

--�@(�@)8.
select* from OrderDetails
where Quantity Between 20 and 40


--�@(�G)1.
select AVG(UnitPrice) as �������  from Products
where CategoryID=2


--�@(�G)2.
select * from Products
where UnitsInStock<=ReorderLevel and UnitsOnOrder=0 and Discontinued=0

--�@(�G)3.
select OrderID ,count(*) as �]�t�ӫ~�� from OrderDetails
group by OrderID 
having count(*)>=5

--�@(�G)4.
select *,UnitPrice*Quantity*(1-Discount) as �p�p from OrderDetails
where OrderID=10263

--�@(�G)5.�Q��group by �[�`�P��OrderID
select SupplierID,COUNT(*) as ���Ѳ��~�� from Products
group by SupplierID

--�@(�G)6.
select CustomerID,EmployeeID,count(*) as ���u�A�Ȧ��� from Orders
group by CustomerID,EmployeeID

--�@(�G)7.�]�����W�w�g������μƶq�A���������Y�i

select ProductID,AVG(UnitPrice) as �������, AVG(Quantity) as �����P��ƶq 
from OrderDetails
group by ProductID
having AVG(Quantity)>10
order by ProductID

--�G1.


Select o.OrderID as �q�渹�X ,cg.CategoryName as ���~���O ,p.ProductName as ���~�W�� ,od.UnitPrice as �q�ʳ�� ,od.Quantity as �q�ʼƶq,
Round(od.UnitPrice*od.Quantity*(1-od.Discount),0) as ���~����p�p,o.CustomerID as �Ȥ�s��,o.ShipName as �Ȥ�W��,c.ContactName as ���f�H�m�W,
o.OrderDate as �q�ʤ��,(e.FirstName+e.LastName) as �B�z���u�m�W,sh.CompanyName as �f�B���q,s.CompanyName as ������

from OrderDetails as od inner join Orders as o
on od.OrderID=o.OrderID
inner join Shippers as sh
on o.ShipVia=sh.ShipperID
inner join Products as p
on od.ProductID=p.ProductID
inner join Categories as cg
on p.CategoryID=cg.CategoryID
inner join Customers as c
on o.CustomerID=c.CustomerID
inner join Employees as e
on o.EmployeeID=e.EmployeeID
inner join Suppliers as s
on p.SupplierID=s.SupplierID
where (o.OrderDate between '1996-07-01' and '1996-07-31') and sh.CompanyName='United Package'
 

--�G2.
Select * from Orders
Select * from Customers
Select* from Products
Select * from OrderDetails
Select * from Shippers
Select* from Employees
Select* from Suppliers

select o.CustomerID,c.ContactName,p.ProductName,sum(od.Quantity) as Quantity
from Orders as o inner join OrderDetails as od
on o.OrderID=od.OrderID
inner join Customers as c
on o.CustomerID=c.CustomerID
inner join Products as p
on od.ProductID=p.ProductID
where o.CustomerID='ANTON'
group by o.CustomerID,c.ContactName,p.ProductName
order by P.ProductName

--�G3.
select *
from Customers
where not exists (select* from Orders where Customers.CustomerID=Orders.CustomerID )

--�G4.

select Employees.EmployeeID,(Employees.FirstName+','+Employees.LastName) as Name,Employees.Title,Employees.Extension,Employees.Notes  
from Employees
where EmployeeID
in(select distinct EmployeeID  from Orders) 

--�G5.
select*from Orders
--�X�֬d��
--�g�k�@
select  p.ProductID,p.ProductName,p.QuantityPerUnit,p.UnitPrice,p.UnitsInStock,p.UnitsOnOrder,p.CategoryID,p.Discontinued,p.SupplierID,p.ReorderLevel,SUM(od.Quantity) as Quanity
from Products as p
left outer join OrderDetails as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
where (o.OrderDate between '1998-01-01' and '1998-12-31') 
group by p.ProductID,p.ProductName,p.QuantityPerUnit,p.UnitPrice,p.UnitsInStock,p.UnitsOnOrder,p.CategoryID,p.Discontinued,p.SupplierID,p.ReorderLevel
order by p.ProductID

--�g�k�G
select distinct p.*
from Products as p
inner join OrderDetails as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
where (o.OrderDate between '1998-01-01' and '1998-12-31') 
order by p.ProductID


--�l�d��(�O�o�n��Ҧ���ƪ�����p�I�I�I)
--�g�k�@
select *
from Products 
where exists (select * from OrderDetails 
where exists (select * from Orders 
where OrderDate between '1998-01-01' and '1998-12-31' 
and OrderDetails.OrderID=Orders.OrderID 
and Products.ProductID=OrderDetails.ProductID) )

--�g�k�G
select *
from Products 
where ProductID in (select ProductID from OrderDetails 
where OrderID in (select OrderID from Orders 
where OrderDate between '1998-01-01' and '1998-12-31'
) )

--�T��
create database HW2DDL
go

--�T2
use HW2DDL
go
create table �ǥ͸�ƪ�(

�Ǹ� char(10) not null primary key,
�m�W nvarchar(20) not null,
�q�� varchar(20) not null,
�a�} nvarchar(100) not null,
�ͤ� datetime
)
go

create table �ҵ{��ƪ�(
�ҵ{�N�X char(6) not null primary key, 
�ҵ{�W�� nvarchar(30) not null,
�Ǥ��� int not null default 3
)
go
--�T3
create table �q���ƪ�(
�q��N�� char(10) not null primary key,
�q�ʤ�� datetime not null
)
go

create table ���~(
���~�s�� char(6)not null primary key,
���~�W�� nvarchar(50) not null
)
go

create table �q�����(
�q��N�� char(10) not null,
���~�s�� char(6)not null,
�ʶR�ƶq int not null
primary key(�q��N��,���~�s��)
)
go
alter table �q�����
add foreign key (�q��N��) references �q���ƪ�(�q��N��) on delete no action on update cascade 
go

alter table �q�����
add foreign key (���~�s��) references ���~(���~�s��) on delete no action on update cascade 
go
