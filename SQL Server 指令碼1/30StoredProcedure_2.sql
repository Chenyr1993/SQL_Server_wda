--�w�s�{�ǿz���ƪ�
--exec(�i�H��J�r�����select)
exec('select * from �б�')
go

create Proc querytable_2
@tableName nvarchar(100)
as
begin
exec('select * from '+ @tableName)
end

exec querytable_2 '�б�'
