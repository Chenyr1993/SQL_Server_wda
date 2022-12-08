select od.OrderID as �q��s��,c.CategoryName as ���~���O,od.ProductID as ���~�s��,p.ProductName as ���~�W��,p.QuantityPerUnit as �W��,
od.UnitPrice as ���,p.UnitPrice as �w��,od.Quantity as �ƶq,od.Discount as �馩,
od.UnitPrice*od.Quantity*(1-od.Discount) as �p�p,s.CompanyName as ������,s.ContactName as �p�����f,s.ContactTitle as �p���H¾��
from OrderDetails as od inner join Products as p
on od.ProductID=p.ProductID inner join Categories as c 
on c.CategoryID=p.CategoryID inner join Suppliers as s on s.SupplierID=p.SupplierID  

select*, UnitPrice*Quantity*(1-Discount) as �p�p
from OrderDetails

select*
from Products
select*
from Suppliers
 
select od.OrderID,c.CompanyName as �Ȥ�,c.ContactName as �Ȥᵡ�f,c.ContactTitle as �p�����f¾��,
o.OrderDate as �q����,o.RequiredDate as �ݨD���,o.ShippedDate as�X�f���,COUNT(*)as �q�椺�t���~����,
e.LastName+','+e.FirstName as �B�z�q����u,ROUND(SUM(od.UnitPrice*od.Quantity*(1-od.Discount)),0)as �q���`���B
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

--�`�p�C��Ȥ᪺���O���B
--count(*)�H�Ȥᬰ�D�έp�A��ܫȤ�b���X�{�����ơA�N�O�U�L�q�檺���� 
select c.CustomerID, c.CompanyName,ROUND(SUM(od.UnitPrice*od.Quantity*(1-od.Discount)),0)as �Ȥ���O�`���B,
count(*) as �U�榸��
from Customers as c inner join Orders as o on c.CustomerID=o.CustomerID
inner join OrderDetails as od on o.OrderID=od.OrderID
group by c.CustomerID,c.CompanyName
order by �Ȥ���O�`���B desc
--���έp�ѩ��Ӫ�X�o(���G�|�P�W��@��)
select o.CustomerID,c.CompanyName,round(sum(od.UnitPrice*od.Quantity*(1-od.Discount)),0) as �Ȥ�~�Z,
count(*) as �U�榸��
from  OrderDetails as od inner join Orders as o on od.OrderID=o.OrderID
inner join Customers as c on o.CustomerID=c.CustomerID
group by o.CustomerID,c.CompanyName
order by �Ȥ�~�Z desc


--�ϯä��R����
SELECT          OrderDetails.OrderID, Products.ProductID, Products.ProductName, Customers.CompanyName, convert(date,Orders.OrderDate,112) as ODate, 
                            OrderDetails.UnitPrice, OrderDetails.Quantity, OrderDetails.Discount
FROM              OrderDetails INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID INNER JOIN
                            Products ON OrderDetails.ProductID = Products.ProductID INNER JOIN
                            Customers ON Orders.CustomerID = Customers.CustomerID
