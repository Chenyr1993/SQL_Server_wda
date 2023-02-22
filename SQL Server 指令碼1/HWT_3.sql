--基本型態
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


--處理null值
select pvt.ProductName as 產品名稱, isnull([1],0) as '一月', isnull([2],0) as '二月', isnull([3],0) as '三月'
, isnull([4],0) as '四月', isnull([5],0) as '五月', isnull([6],0) as '六月', isnull([7],0) as '七月'
, isnull([8],0) as '八月', isnull([9],0) as '九月', isnull([10],0) as '十月', isnull([11],0) as '十一月'
, isnull([12],0) as '十二月'
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


--把欄位寫成活的

declare @yy int =1998

declare @in_columns nvarchar(max)
select @in_columns=isnull(@in_columns+',['+cast(Month as varchar)+']','['+cast(Month as varchar)+']')
from
(select distinct month(OrderDate) as [Month]
from Orders
where year(OrderDate)=@yy) as o
order by [Month]

declare @select_columns nvarchar(max)=''
select @select_columns+= ',isnull(['+cast(Month as varchar)+'],0) as ['+cast(Month as varchar)+'月]'
from
(select distinct month(OrderDate) as [Month]
from Orders
where year(OrderDate)=@yy) as o
order by [Month]

--print @select_columns

declare @sql nvarchar(max)
set @sql='select pvt.ProductName as 產品名稱'+@select_columns+'
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


--把程式建立成預存程序

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
	select @select_columns+= ',isnull(['+cast(Month as varchar)+'],0) as ['+cast(Month as varchar)+'月]'
	from
	(select distinct month(OrderDate) as [Month]
	from Orders
	where year(OrderDate)=@yy) as o
	order by [Month]

	--print @select_columns

	declare @sql nvarchar(max)
	set @sql='select pvt.ProductName as 產品名稱'+@select_columns+'
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