use Project_V3
go

use Project
go

create function getID()
returns char(13)
begin 
declare @currentDate varchar(8),@IdDate nvarchar(8),@newId char(13),@Id char(13),@tempId varchar(5),@len tinyint
--�����XorderID�ña�W�ܼ�
		select top 1 @Id=EventID from Orders 
		order by EventID desc
--�p�G��ƪ��w����
	if @@ROWCOUNT>0
		begin
		set @currentDate = CONVERT(varchar(8),GETDATE(),112)
		set @IdDate=cast((substring(@Id,1,8)) as varchar)
--�p�G�q�����P���Ѥ���ۦP
		if @IdDate=@currentDate
		begin
		set @len=len(cast((substring(@Id,9,5)+1) as varchar))
--��0	
		set @tempId=
		case when @len=4 then '0'
			 when @len=3 then '00'
			 when @len=2 then'000'
			 when @len=1 then'0000'
		
		end
			set @newId=@currentDate+@tempId+cast((substring(@Id,9,5)+1) as varchar)
	 end
--�̫�@�����O��ѭq��A�s�q�欰���Ĥ@��
	 else
	  set @newId=@currentDate+'00001'
	end
--��ƪ��S���ȡA�إߨt�Ϊ��Ĥ@���q��	
	else
	set @newId=@currentDate+'00001'

--print @newId
return @newId
end

go