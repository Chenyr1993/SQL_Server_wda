--�禡�G�۰ʲ��ͨ�W�h���s��
create function getStuID()
	returns char(4)
	begin
	declare @id char(4),@newId char(4),@tempId varchar(4),@len tinyint
	select top 1 @id=�Ǹ� from �ǥ�
	order by �Ǹ� desc
	--������(�૬(����r�� substring(�ܼ�,�q�X�Ӧr�A��X��)as���A) 
	
	set @len=len(cast((substring(@id,2,3)+1) as varchar))
	--�P�_�n�ɴX��0
	set @tempId=
	case when @len=2 then 'S0'
		 when @len=1 then 'S00'
		 else 'S'
	end

	--��B�z�n��id ��b@newId
	
	set @newId= @tempId + cast((substring(@id,2,3)+1) as varchar)
	--print @newId
	return @newId
	end
	go
	--�s�W�@���ǥ͸��
	insert into �ǥ�(�Ǹ�,�ͤ�,�q��,�m�W,�ʧO)
	values(dbo.getStuID(),'1999-9-9','07-1245678','�F�褣��','�k')