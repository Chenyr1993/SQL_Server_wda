--T-SQL

--�L�X���浲�G�]��ܦb�T���^
print 'Hello World'

--���浲�G�ܦ���]��ܦb���G�^
select 'Hello World'

--�ܼ�
--1.�¶q�ܼ� 2.��ƪ��ܼ�

--�¶q�ܼ�

--�ŧi�ܼ�
declare @myName nvarchar(50)='Jack'
--��X�ܼ�
print @myName
--��s��ƪ�
select @myName


declare @number int
--���w�B��Gset/select��J�ܼ�
set @number=100
select @myName='Jack Lee'
print @number
print @myName

--��ƫ��A�ഫ(cast²���ഫ/convert���T�ഫ)
declare @salary money=50000
print '�z���~��'+cast(@salary as varchar)

declare @birthday datetime='2022/12/19'
print '�z���ͤ鬰'+convert(varchar,@birthday,120)


select�@�ͤ�=@birthday
from �ǥ�
where �Ǹ�='S002'
print '�z���ͤ鬰'+convert(varchar,@birthday,120)

--��ƪ��ܼ�
--���ƪ�s�i�ܼƸ̡����ܼƷ�@�Ӹ�ƪ�
declare @StuBirthday table(
name nvarchar(30),
birthday datetime
)
insert into @StuBirthday
values('���ڦ�','2022-12-19')

insert into @StuBirthday
select �m�W,�ͤ�
from �ǥ�

select * from @StuBirthday