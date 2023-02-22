select o.*,c.CompanyName 
from Orders as o 
inner join customers as c
on o.CustomerID=c.CustomerID

SELECT          Orders.OrderID, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Orders.ShipName, 
                            Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, 
                            Orders.Freight, Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, 
                            Employees.LastName, Employees.FirstName, Employees.EmployeeID, Shippers.ShipperID, 
                            Shippers.CompanyName AS ShipCompany, Shippers.Phone
FROM              Orders INNER JOIN
                            Customers ON Orders.CustomerID = Customers.CustomerID INNER JOIN
                            Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                            Shippers ON Orders.ShipVia = Shippers.ShipperID
							