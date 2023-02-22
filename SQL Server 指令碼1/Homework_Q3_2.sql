----第二題
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
--如果訂單日期與今天日期相同
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