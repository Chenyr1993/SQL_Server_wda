--�y�{����
--case(switch)

--²�� case end
--when���᭱�u���@�ӱ���(=)
select �m�W,

case when �ʧO='�k' then '����'
     when �ʧO='�k' then '�p�j'
	 else 'N/A'
end�@as �ٿ�

from �ǥ�


--�j�Mcase
declare @gender nvarchar(1),@result nvarchar(6) 
set @gender='0'

set @result =
case when @gender='1' then '����'
	 when @gender='0' then '�p�j' 
	else 'N/A'
end
print @result
go --��ܧ妸����A�i�����ܼƫ᭱�i�A���P�W


--�Hcase��gif/else�d��
declare @height int,@result nvarchar(6)
set @height=150
set @result=
case when @height>=120
	 then '����'
	 when @height>=90
	 then '�b��'
	 else '�K�O'
end
print @result
--T-Sql�S�����淧��