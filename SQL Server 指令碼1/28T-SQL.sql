--�t���ܼ�(�t�Τ����ܼ�)

--�p��Y�ǥͿ�F�X����
--��k�@
declare @n int
select @n=count(*)
from �Z�� 
where �Ǹ�='S002'
print '�z�@��F'+cast(@n as varchar)+'����'
--��k�G @@rowcount

select *
from �Z�� 
where �Ǹ�='S001'

print '�z�@��F'+cast(@@rowcount as varchar)+'����'

--�b@@rowcount�s�W����
--�A�g�F�@�q�{��
select * from �ǥ�

--�o�̦��ĤG�q�{��,���O�o�q�{�������n�Ĥ@�q�{������Ƥ~��A����
if @@ROWCOUNT>0
begin
	
	select * from �Z��
end


--�ҥ~�B�zError handle(try �̩񦳥i��o�ͨҥ~���y�k�A�����F�����ϥΪ̬ݨ�t�Ϊ����~�T���A�ӬO���catch�]�w���e)
--�y�k�S�����L�k�o�X���G���ҥ~

print 100/0

begin try 
print 100/0
end try
begin catch 
--print @@error
--print error_message()
--���g�۩w�q���~�T��
print '���A�����u��......'
end catch
go 

--�w�藍�P���~�N�X��w���~�T��
begin try
	print 100/0
end try
begin catch

		if @@ERROR=8134
			print '�z�u�R�}������'
		else if @@ERROR=807
			print '�����ðڰ�!!'
		else
		    print '���A�����L��....'

end catch