--���إߥH�����B�H���~�W�٬��C���϶s���R��
select *
from 
(

SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as �~�� , Month(Orders.OrderDate)as ���, 
				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),2) AS �P���B
FROM              Products INNER JOIN
                            OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate

				)as t1
				pivot (sum(�P���B) 
				for ��� in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) )as r
order by ProductID;
----

select r.ProductID,r.ProductName
, isnull( r.[1],0) as [1��]
, isnull( r.[2],0) as [2��]
, isnull( r.[3],0) as [3��]
, isnull( r.[4],0) as [4��]
, isnull( r.[5],0) as [5��]
, isnull( r.[6],0) as [6��]
, isnull( r.[7],0) as [7��]
, isnull( r.[9],0) as [8��]
, isnull( r.[8],0) as [9��]
, isnull( r.[10],0) as [10��]
, isnull( r.[11],0) as [11��]
, isnull( r.[12],0) as [12��]

from 
(
SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as �~�� , Month(Orders.OrderDate)as ���, 
				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),0) AS �P���B
FROM              Products INNER JOIN
                      OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate
				) as t1
				pivot (sum(�P���B) 
				for ��� in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) ) as r
order by ProductID;
go
----

--�ŧi�ܼƩ��ܨ쪺�s���r��
declare @year nvarchar(4),@cols_str nvarchar(max),@content_value nvarchar(max),@col nvarchar(max)
--�ŧi�ܼƦs��r��
declare @sql nvarchar(max)
set @year='1997'

--�եX+��r��isnull�ˬd�n���n�[,         --�B�z��null�ȥN��
select @cols_str = isnull(@cols_str+',isnull(r.['+cast(Month(OrderDate)as nvarchar) +'] ,0) as ['+cast(Month(OrderDate)as nvarchar) +'��]', 'isnull(r.['+cast(Month(OrderDate)as nvarchar)+'],0) as ['+cast(Month(OrderDate)as nvarchar)+'��]')
from Orders
group by Month(OrderDate)
order by Month(OrderDate) 
print @cols_str


--��pivot
select @col=  isnull(@col+',['+cast(Month(OrderDate)as nvarchar) +']', '['+cast(Month(OrderDate)as nvarchar)+']' )
from Orders
group by Month(OrderDate)
order by Month(OrderDate) 
print @col


set @sql= 'select r.ProductName,' +@cols_str +'from (

SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as �~��, Month(Orders.OrderDate)as ���, 
				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),0) AS �P���B
FROM              Products INNER JOIN
                            OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID
where year(Orders.OrderDate)=@year
GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate
				)as t1
				pivot (sum(�P���B) 
				for ��� in ('+@col +'))as r
				order by ProductID'
				print @sql
				go
				

--����
--select r.ProductName,isnull(r.[1],0) as [1��],isnull(r.[2] ,0) as [2��],isnull(r.[3] ,0) as [3��],isnull(r.[4] ,0) as [4��],isnull(r.[5] ,0) as [5��],isnull(r.[6] ,0) as [6��],isnull(r.[7] ,0) as [7��],isnull(r.[8] ,0) as [8��],isnull(r.[9] ,0) as [9��],isnull(r.[10] ,0) as [10��],isnull(r.[11] ,0) as [11��],isnull(r.[12] ,0) as [12��]from (

--SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as �~��, Month(Orders.OrderDate)as ���, 
--				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),0) AS �P���B
--FROM              Products INNER JOIN
--                            OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
--                            Orders ON OrderDetails.OrderID = Orders.OrderID
--where year(Orders.OrderDate)=@year
--GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate
--				)as t1
--				pivot (sum(�P���B) 
--				for ��� in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]))as r
--				order by ProductID



---�[�J�w�s�{��
create proc Sum_for_Products_Salse_Pivot
@year nvarchar(4)
as
begin
declare @cols_str nvarchar(max),@content_value nvarchar(max),@col nvarchar(max)
declare @sql nvarchar(max)

select @cols_str = isnull(@cols_str+',isnull(r.['+cast(Month(OrderDate)as nvarchar) +'] ,0) as ['+cast(Month(OrderDate)as nvarchar) +'��]', 'isnull(r.['+cast(Month(OrderDate)as nvarchar)+'],0) as ['+cast(Month(OrderDate)as nvarchar)+'��]')
from Orders
group by Month(OrderDate)
order by Month(OrderDate) 

select @col=  isnull(@col+',['+cast(Month(OrderDate)as nvarchar) +']', '['+cast(Month(OrderDate)as nvarchar)+']' )
from Orders
group by Month(OrderDate)
order by Month(OrderDate) 

set @sql= 'select r.ProductName,' +@cols_str +'from (

SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as �~��, Month(Orders.OrderDate)as ���, 
				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),0) AS �P���B
FROM              Products INNER JOIN
                            OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID
where year(Orders.OrderDate)='+@year+'
GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate
				)as t1
				pivot (sum(�P���B) 
				for ��� in ('+@col +'))as r
				order by ProductID'		
				exec(@sql)
				
end
---�@�w�n����W����إ߹w�s�{�ǡA�A����Ѽ�
exec Sum_for_Products_Salse_Pivot '1997'


