--一(一)1.
select* from Employees
where City='London'

--一(一)2.
select* from Employees
where HireDate >= '1993-01-01'

--一(一)3.
select* from Orders
--where ShipCity='Reims'or ShipCity='Lander' or ShipCity='Madrid'
where ShipCity in('Reims','Lander','Madrid')
order by ShipCity

--一(一)4.
--因為6,7筆同樣數量，所以要記得加with ties
select top 6  with ties*
from Products
order by UnitsInStock desc

--一(一)5.
select OrderID,ProductID from OrderDetails
where OrderID=10847

--一(一)6.
select * from Orders
where ShippedDate is null

--一(一)7.
select * from Customers
where City in('Montreal','Lisboa','Lyon','Stavern','Geneve','Bruxelles','Madrid')
order by City

--一(一)8.
select* from OrderDetails
where Quantity Between 20 and 40


--一(二)1.
select AVG(UnitPrice) as 平均單價  from Products
where CategoryID=2


--一(二)2.
select * from Products
where UnitsInStock<=ReorderLevel and UnitsOnOrder=0 and Discontinued=0

--一(二)3.
select OrderID ,count(*) as 包含商品數 from OrderDetails
group by OrderID 
having count(*)>=5

--一(二)4.
select *,UnitPrice*Quantity*(1-Discount) as 小計 from OrderDetails
where OrderID=10263

--一(二)5.利用group by 加總同個OrderID
select SupplierID,COUNT(*) as 提供產品數 from Products
group by SupplierID

--一(二)6.
select CustomerID,EmployeeID,count(*) as 員工服務次數 from Orders
group by CustomerID,EmployeeID

--一(二)7.因為表單上已經有單價及數量，直接平均即可

select ProductID,AVG(UnitPrice) as 平均單價, AVG(Quantity) as 平均銷售數量 
from OrderDetails
group by ProductID
having AVG(Quantity)>10
order by ProductID

--二1.


Select o.OrderID as 訂單號碼 ,cg.CategoryName as 產品類別 ,p.ProductName as 產品名稱 ,od.UnitPrice as 訂購單價 ,od.Quantity as 訂購數量,
Round(od.UnitPrice*od.Quantity*(1-od.Discount),0) as 產品價格小計,o.CustomerID as 客戶編號,o.ShipName as 客戶名稱,c.ContactName as 收貨人姓名,
o.OrderDate as 訂購日期,(e.FirstName+e.LastName) as 處理員工姓名,sh.CompanyName as 貨運公司,s.CompanyName as 供應商

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
 

--二2.
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

--二3.
select *
from Customers
where not exists (select* from Orders where Customers.CustomerID=Orders.CustomerID )

--二4.

select Employees.EmployeeID,(Employees.FirstName+','+Employees.LastName) as Name,Employees.Title,Employees.Extension,Employees.Notes  
from Employees
where EmployeeID
in(select distinct EmployeeID  from Orders) 

--二5.
select*from Orders
--合併查詢
--寫法一
select  p.ProductID,p.ProductName,p.QuantityPerUnit,p.UnitPrice,p.UnitsInStock,p.UnitsOnOrder,p.CategoryID,p.Discontinued,p.SupplierID,p.ReorderLevel,SUM(od.Quantity) as Quanity
from Products as p
left outer join OrderDetails as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
where (o.OrderDate between '1998-01-01' and '1998-12-31') 
group by p.ProductID,p.ProductName,p.QuantityPerUnit,p.UnitPrice,p.UnitsInStock,p.UnitsOnOrder,p.CategoryID,p.Discontinued,p.SupplierID,p.ReorderLevel
order by p.ProductID

--寫法二
select distinct p.*
from Products as p
inner join OrderDetails as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
where (o.OrderDate between '1998-01-01' and '1998-12-31') 
order by p.ProductID


--子查詢(記得要把所有資料表拉關聯！！！)
--寫法一
select *
from Products 
where exists (select * from OrderDetails 
where exists (select * from Orders 
where OrderDate between '1998-01-01' and '1998-12-31' 
and OrderDetails.OrderID=Orders.OrderID 
and Products.ProductID=OrderDetails.ProductID) )

--寫法二
select *
from Products 
where ProductID in (select ProductID from OrderDetails 
where OrderID in (select OrderID from Orders 
where OrderDate between '1998-01-01' and '1998-12-31'
) )

--三１
create database HW2DDL
go

--三2
use HW2DDL
go
create table 學生資料表(

學號 char(10) not null primary key,
姓名 nvarchar(20) not null,
電話 varchar(20) not null,
地址 nvarchar(100) not null,
生日 datetime
)
go

create table 課程資料表(
課程代碼 char(6) not null primary key, 
課程名稱 nvarchar(30) not null,
學分數 int not null default 3
)
go
--三3
create table 訂單資料表(
訂單代號 char(10) not null primary key,
訂購日期 datetime not null
)
go

create table 產品(
產品編號 char(6)not null primary key,
產品名稱 nvarchar(50) not null
)
go

create table 訂單明細(
訂單代號 char(10) not null,
產品編號 char(6)not null,
購買數量 int not null
primary key(訂單代號,產品編號)
)
go
alter table 訂單明細
add foreign key (訂單代號) references 訂單資料表(訂單代號) on delete no action on update cascade 
go

alter table 訂單明細
add foreign key (產品編號) references 產品(產品編號) on delete no action on update cascade 
go
