--�ЧQ��Northwind��Ʈw�i��d��
--1.�C�X�q���U�L�q�檺�Ȥ���

select * from Customers
select * from Orders

select Customers.*
from Customers left outer join Orders
on Customers.CustomerID=Orders.CustomerID
where Orders.CustomerID is null

--2.�C�X�q���B�z�L�q�檺���u���
select* from Employees
select* from Orders

select Orders.*
from Employees left outer join Orders
on Employees.EmployeeID = Orders.EmployeeID
where Orders.EmployeeID is null


--3.�C�X�q���Q�ʶR���ӫ~���
select * from Products
select* from OrderDetails

select OrderDetails.* 
from Products left outer join OrderDetails
on Products.ProductID=OrderDetails.ProductID
where OrderDetails.ProductID is null

--��null�Ȫ��B�z�覡
--�έp(count)�C��Region���X�ӫȤ�
select* from Customers
--����@�Ӱ�a�ѭ��@�ϭt�d
select* from Region


select isnull(Region,'N/A')as Region ,COUNT(*) customer_number
from Customers 
group by Region
