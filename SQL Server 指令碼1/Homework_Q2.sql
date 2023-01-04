--���إߥH�����B�H���~�W�٬��C���϶s���R��
select * from (
SELECT          Products.ProductID, Products.ProductName, Orders.OrderDate, SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) 
                            * (1 - OrderDetails.Discount)) AS �P���B,DATEDIFF(YEAR,Orders.OrderDate)as �~��, SUM(Products.ProductID) AS Expr1
FROM              Products INNER JOIN
                            OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID
WHERE Orders.OrderDate between '1998-01-01' and '1998-12-31'
GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate
ORDER BY   Products.ProductID
					)as 
					pivot(
					Max() 
					for Orders.OrderDate in([1996],[1997],[1998]) as y