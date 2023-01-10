----²Ä¤GÃD
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
declare @currentDate varchar(8)
set @currentDate = CONVERT(varchar,GETDATE(),112)
print @currentDate

declare @code nchar(4),@Id nchar(12),@len tinyint
	set @len=len(cast((substring(@code,0,4)+1) as varchar))
	
if getdate()=@currentDate
set @code=
		 case when @len=3 then '0'
		 when @len=2 then '00'
		 when @len=1 then'000'
		 else ''
		 set @Id=@currentDate+cast((substring(@code,0,4)+1) as varchar)+@code

else
set @code=0000

case

select @Id=@currentDate+@code


end