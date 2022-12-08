select od.OrderID as 訂單編號,c.CategoryName as 產品類別,od.ProductID as 產品編號,p.ProductName as 產品名稱,p.QuantityPerUnit as 規格,
od.UnitPrice as 售價,p.UnitPrice as 定價,od.Quantity as 數量,od.Discount as 折扣,
od.UnitPrice*od.Quantity*(1-od.Discount) as 小計,s.CompanyName as 供應商,s.ContactName as 聯絡窗口,s.ContactTitle as 聯絡人職稱
from OrderDetails as od inner join Products as p
on od.ProductID=p.ProductID inner join Categories as c 
on c.CategoryID=p.CategoryID inner join Suppliers as s on s.SupplierID=p.SupplierID  

select*, UnitPrice*Quantity*(1-Discount) as 小計
from OrderDetails

select*
from Products
select*
from Suppliers
 
select od.OrderID,c.CompanyName as 客戶,c.ContactName as 客戶窗口,c.ContactTitle as 聯絡窗口職稱,
o.OrderDate as 訂單日期,o.RequiredDate as 需求日期,o.ShippedDate as出貨日期,COUNT(*)as 訂單內含產品種類,
e.LastName+','+e.FirstName as 處理訂單員工,ROUND(SUM(od.UnitPrice*od.Quantity*(1-od.Discount)),0)as 訂單總金額
from OrderDetails as od inner join Orders as o on od.OrderID=o.OrderID
inner join Customers as c on o.CustomerID=c.CustomerID
inner join Employees as e on o.EmployeeID=e.EmployeeID 
group by od.OrderID,c.CompanyName,c.ContactName ,c.ContactTitle ,
o.OrderDate,o.RequiredDate,o.ShippedDate,
e.LastName,e.FirstName

select*
from OrderDetails

select*
from Customers
select*
from Orders

--總計每位客戶的消費金額
--count(*)以客戶為主統計，表示客戶在表單出現的次數，就是下過訂單的次數 
select c.CustomerID, c.CompanyName,ROUND(SUM(od.UnitPrice*od.Quantity*(1-od.Discount)),0)as 客戶消費總金額,
count(*) as 下單次數
from Customers as c inner join Orders as o on c.CustomerID=o.CustomerID
inner join OrderDetails as od on o.OrderID=od.OrderID
group by c.CustomerID,c.CompanyName
order by 客戶消費總金額 desc
--做統計由明細表出發(結果會與上方一樣)
select o.CustomerID,c.CompanyName,round(sum(od.UnitPrice*od.Quantity*(1-od.Discount)),0) as 客戶業績,
count(*) as 下單次數
from  OrderDetails as od inner join Orders as o on od.OrderID=o.OrderID
inner join Customers as c on o.CustomerID=c.CustomerID
group by o.CustomerID,c.CompanyName
order by 客戶業績 desc


--樞紐分析表資料
SELECT          OrderDetails.OrderID, Products.ProductID, Products.ProductName, Customers.CompanyName, convert(date,Orders.OrderDate,112) as ODate, 
                            OrderDetails.UnitPrice, OrderDetails.Quantity, OrderDetails.Discount
FROM              OrderDetails INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID INNER JOIN
                            Products ON OrderDetails.ProductID = Products.ProductID INNER JOIN
                            Customers ON Orders.CustomerID = Customers.CustomerID
