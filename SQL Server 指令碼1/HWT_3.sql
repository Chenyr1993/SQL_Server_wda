--�򥻫��A
select *
from
(
SELECT p.ProductID, p.ProductName, year(o.OrderDate) as [Year], month(o.OrderDate) as [Month],
round(sum(od.UnitPrice*od.Quantity*(1-od.Discount)),0) as Total
FROM Orders as o 
INNER JOIN OrderDetails as od ON o.OrderID = od.OrderID 
INNER JOIN Products as p ON od.ProductID = p.ProductID
where year(o.OrderDate)=1997
group by p.ProductID, p.ProductName, o.OrderDate
) as x
pivot
(
	sum(x.Total)
	for x.Month in
	([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
)as pvt
order by pvt.ProductID


--�B�znull��
select pvt.ProductName as ���~�W��, isnull([1],0) as '�@��', isnull([2],0) as '�G��', isnull([3],0) as '�T��'
, isnull([4],0) as '�|��', isnull([5],0) as '����', isnull([6],0) as '����', isnull([7],0) as '�C��'
, isnull([8],0) as '�K��', isnull([9],0) as '�E��', isnull([10],0) as '�Q��', isnull([11],0) as '�Q�@��'
, isnull([12],0) as '�Q�G��'
from
(
SELECT p.ProductID, p.ProductName, year(o.OrderDate) as [Year], month(o.OrderDate) as [Month],
round(od.UnitPrice*od.Quantity*(1-od.Discount),0) as Total
FROM Orders as o 
INNER JOIN OrderDetails as od ON o.OrderID = od.OrderID 
INNER JOIN Products as p ON od.ProductID = p.ProductID
where year(o.OrderDate)=1996
--group by p.ProductID, p.ProductName, o.OrderDate
) as x
pivot
(
	sum(x.Total)
	for x.Month in
	([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
)as pvt
order by pvt.ProductID


--�����g������

declare @yy int =1998

declare @in_columns nvarchar(max)
select @in_columns=isnull(@in_columns+',['+cast(Month as varchar)+']','['+cast(Month as varchar)+']')
from
(select distinct month(OrderDate) as [Month]
from Orders
where year(OrderDate)=@yy) as o
order by [Month]

declare @select_columns nvarchar(max)=''
select @select_columns+= ',isnull(['+cast(Month as varchar)+'],0) as ['+cast(Month as varchar)+'��]'
from
(select distinct month(OrderDate) as [Month]
from Orders
where year(OrderDate)=@yy) as o
order by [Month]

--print @select_columns

declare @sql nvarchar(max)
set @sql='select pvt.ProductName as ���~�W��'+@select_columns+'
from
(
SELECT p.ProductID, p.ProductName, year(o.OrderDate) as [Year], month(o.OrderDate) as [Month],
round(od.UnitPrice*od.Quantity*(1-od.Discount),0) as Total
FROM Orders as o 
INNER JOIN OrderDetails as od ON o.OrderID = od.OrderID 
INNER JOIN Products as p ON od.ProductID = p.ProductID
where year(o.OrderDate)='+cast(@yy as varchar)+'
) as x
pivot
(
	sum(x.Total)
	for x.Month in
	('+@in_columns+')
)as pvt
order by pvt.ProductID'


exec(@sql)
go


--��{���إߦ��w�s�{��

create proc Sum_for_Products_Salse_Pivot_t
	@yy int
as
begin
	declare @in_columns nvarchar(max)
	select @in_columns=isnull(@in_columns+',['+cast(Month as varchar)+']','['+cast(Month as varchar)+']')
	from
	(select distinct month(OrderDate) as [Month]
	from Orders
	where year(OrderDate)=@yy) as o
	order by [Month]

	declare @select_columns nvarchar(max)=''
	select @select_columns+= ',isnull(['+cast(Month as varchar)+'],0) as ['+cast(Month as varchar)+'��]'
	from
	(select distinct month(OrderDate) as [Month]
	from Orders
	where year(OrderDate)=@yy) as o
	order by [Month]

	--print @select_columns

	declare @sql nvarchar(max)
	set @sql='select pvt.ProductName as ���~�W��'+@select_columns+'
	from
	(
	SELECT p.ProductID, p.ProductName, year(o.OrderDate) as [Year], month(o.OrderDate) as [Month],
	round(od.UnitPrice*od.Quantity*(1-od.Discount),0) as Total
	FROM Orders as o 
	INNER JOIN OrderDetails as od ON o.OrderID = od.OrderID 
	INNER JOIN Products as p ON od.ProductID = p.ProductID
	where year(o.OrderDate)='+cast(@yy as varchar)+'
	) as x
	pivot
	(
		sum(x.Total)
		for x.Month in
		('+@in_columns+')
	)as pvt
	order by pvt.ProductID'


	exec(@sql)

end



exec Sum_for_Products_Salse_Pivot_t 1998