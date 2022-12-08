--請利用Northwind資料庫進行查詢
--1.列出從未下過訂單的客戶資料

select * from Customers
select * from Orders

select Customers.*
from Customers left outer join Orders
on Customers.CustomerID=Orders.CustomerID
where Orders.CustomerID is null

--2.列出從未處理過訂單的員工資料
select* from Employees
select* from Orders

select Orders.*
from Employees left outer join Orders
on Employees.EmployeeID = Orders.EmployeeID
where Orders.EmployeeID is null


--3.列出從未被購買的商品資料
select * from Products
select* from OrderDetails

select OrderDetails.* 
from Products left outer join OrderDetails
on Products.ProductID=OrderDetails.ProductID
where OrderDetails.ProductID is null

--對null值的處理方式
--統計(count)每個Region有幾個客戶
select* from Customers
--對哪一個國家由哪一區負責
select* from Region


select isnull(Region,'N/A')as Region ,COUNT(*) customer_number
from Customers 
group by Region
