----�ĤG�D
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
--�����XorderID�ña�W�ܼ�
		select top 1 @Id=OrderID from Orders 
		order by OrderID desc
--�p�G��ƪ��w����
	if @@ROWCOUNT>0
		begin
		set @currentDate = CONVERT(varchar(8),GETDATE(),112)
		set @IdDate=cast((substring(@Id,1,8)) as varchar)
--�p�G�q�����P���Ѥ���ۦP
		if @IdDate=@currentDate
		begin
		set @len=len(cast((substring(@Id,9,4)+1) as varchar))
--��0	
		set @tempId=
		case when @len=3 then '0'
			 when @len=2 then '00'
			 when @len=1 then'000'
		end
			set @newId=@currentDate+@tempId+cast((substring(@Id,9,4)+1) as varchar)
	 end
--�̫�@�����O��ѭq��A�s�q�欰���Ĥ@��
	 else
	  set @newId=@currentDate+'0001'
	end
--��ƪ��S���ȡA�إߨt�Ϊ��Ĥ@���q��	
	else
	set @newId=@currentDate+'0001'

--print @newId
return @newId
end

go

insert into  Orders(OrderID,CreateDate,"OrderName")
values(dbo.getOrderID(),GETDATE(),456)