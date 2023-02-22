--資料庫作業三
--第一題

--先建立以月份欄、以產品名稱為列的樞鈕分析表
select *
from 
(

SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as 年度 , Month(Orders.OrderDate)as 月份, 
				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),2) AS 銷售額
FROM              Products INNER JOIN
                            OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate

				)as t1
				pivot (sum(銷售額) 
				for 月份 in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) )as r
order by ProductID;
----

select r.ProductID,r.ProductName
, isnull( r.[1],0) as [1月]
, isnull( r.[2],0) as [2月]
, isnull( r.[3],0) as [3月]
, isnull( r.[4],0) as [4月]
, isnull( r.[5],0) as [5月]
, isnull( r.[6],0) as [6月]
, isnull( r.[7],0) as [7月]
, isnull( r.[9],0) as [8月]
, isnull( r.[8],0) as [9月]
, isnull( r.[10],0) as [10月]
, isnull( r.[11],0) as [11月]
, isnull( r.[12],0) as [12月]

from 
(
SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as 年度 , Month(Orders.OrderDate)as 月份, 
				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),0) AS 銷售額
FROM              Products INNER JOIN
                      OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate
				) as t1
				pivot (sum(銷售額) 
				for 月份 in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) ) as r
order by ProductID;
go
----

--宣告變數放選擇到的編號字串
declare @year nvarchar(4),@cols_str nvarchar(max),@content_value nvarchar(max),@col nvarchar(max)
--宣告變數存放字串
declare @sql nvarchar(max)
set @year='1997'

--組出+月字串isnull檢查要不要加,         --處理內null值代換
select @cols_str = isnull(@cols_str+',isnull(r.['+cast(Month(OrderDate)as nvarchar) +'] ,0) as ['+cast(Month(OrderDate)as nvarchar) +'月]', 'isnull(r.['+cast(Month(OrderDate)as nvarchar)+'],0) as ['+cast(Month(OrderDate)as nvarchar)+'月]')
from Orders
group by Month(OrderDate)
order by Month(OrderDate) 
print @cols_str


--放pivot
select @col=  isnull(@col+',['+cast(Month(OrderDate)as nvarchar) +']', '['+cast(Month(OrderDate)as nvarchar)+']' )
from Orders
group by Month(OrderDate)
order by Month(OrderDate) 
print @col


set @sql= 'select r.ProductName,' +@cols_str +'from (

SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as 年度, Month(Orders.OrderDate)as 月份, 
				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),0) AS 銷售額
FROM              Products INNER JOIN
                            OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID
where year(Orders.OrderDate)=@year
GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate
				)as t1
				pivot (sum(銷售額) 
				for 月份 in ('+@col +'))as r
				order by ProductID'
				print @sql
				go
				

--驗證
--select r.ProductName,isnull(r.[1],0) as [1月],isnull(r.[2] ,0) as [2月],isnull(r.[3] ,0) as [3月],isnull(r.[4] ,0) as [4月],isnull(r.[5] ,0) as [5月],isnull(r.[6] ,0) as [6月],isnull(r.[7] ,0) as [7月],isnull(r.[8] ,0) as [8月],isnull(r.[9] ,0) as [9月],isnull(r.[10] ,0) as [10月],isnull(r.[11] ,0) as [11月],isnull(r.[12] ,0) as [12月]from (

--SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as 年度, Month(Orders.OrderDate)as 月份, 
--				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),0) AS 銷售額
--FROM              Products INNER JOIN
--                            OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
--                            Orders ON OrderDetails.OrderID = Orders.OrderID
--where year(Orders.OrderDate)=@year
--GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate
--				)as t1
--				pivot (sum(銷售額) 
--				for 月份 in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]))as r
--				order by ProductID



---加入預存程序
create proc Sum_for_Products_Salse_Pivot
@year nvarchar(4)
as
begin
declare @cols_str nvarchar(max),@content_value nvarchar(max),@col nvarchar(max)
declare @sql nvarchar(max)

select @cols_str = isnull(@cols_str+',isnull(r.['+cast(Month(OrderDate)as nvarchar) +'] ,0) as ['+cast(Month(OrderDate)as nvarchar) +'月]', 'isnull(r.['+cast(Month(OrderDate)as nvarchar)+'],0) as ['+cast(Month(OrderDate)as nvarchar)+'月]')
from Orders
group by Month(OrderDate)
order by Month(OrderDate) 

select @col=  isnull(@col+',['+cast(Month(OrderDate)as nvarchar) +']', '['+cast(Month(OrderDate)as nvarchar)+']' )
from Orders
group by Month(OrderDate)
order by Month(OrderDate) 

set @sql= 'select r.ProductName,' +@cols_str +'from (

SELECT          Products.ProductID, Products.ProductName,year(Orders.OrderDate) as 年度, Month(Orders.OrderDate)as 月份, 
				round(SUM((OrderDetails.Quantity * OrderDetails.UnitPrice) * (1 - OrderDetails.Discount)),0) AS 銷售額
FROM              Products INNER JOIN
                            OrderDetails ON Products.ProductID = OrderDetails.ProductID INNER JOIN
                            Orders ON OrderDetails.OrderID = Orders.OrderID
where year(Orders.OrderDate)='+@year+'
GROUP BY   Products.ProductID, Products.ProductName, Orders.OrderDate
				)as t1
				pivot (sum(銷售額) 
				for 月份 in ('+@col +'))as r
				order by ProductID'		
				exec(@sql)
				
end
---一定要先單獨執行建立預存程序，再執行參數
exec Sum_for_Products_Salse_Pivot '1997'

--第二題
use  aaa
go

create table Orders(
OrderID nchar(12) primary key,
OrderName nvarchar(30) not null ,
CreateDate DateTime not null)
go


create function getOrderID()
returns char(12)
begin 
declare @currentDate varchar(8),@IdDate nvarchar(8),@newId char(12),@Id char(12),@tempId varchar(4),@len tinyint
--先取出orderID並帶上變數
		select top 1 @Id=OrderID from Orders 
		order by OrderID desc
--如果資料表內已有值
	if @@ROWCOUNT>0
		begin
		set @currentDate = CONVERT(varchar(8),GETDATE(),112)
		set @IdDate=cast((substring(@Id,1,8)) as varchar)
--如果訂單日期與雞天日期相同
		if @IdDate=@currentDate
		begin
		set @len=len(cast((substring(@Id,9,4)+1) as varchar))
--補0	
		set @tempId=
		case when @len=3 then '0'
			 when @len=2 then '00'
			 when @len=1 then'000'
		end
			set @newId=@currentDate+@tempId+cast((substring(@Id,9,4)+1) as varchar)
	 end
--最後一筆不是當天訂單，新訂單為當日第一筆
	 else
	  set @newId=@currentDate+'0001'
	end
--資料表內沒有值，建立系統的第一筆訂單	
	else
	set @newId=@currentDate+'0001'

--print @newId
return @newId
end

go

insert into  Orders(OrderID,CreateDate,"OrderName")
values(dbo.getOrderID(),GETDATE(),456)

