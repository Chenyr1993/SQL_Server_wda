--���(function) �ۭq���
--�¶q�Ȩ��(�禡)�G�q�`�|�^�ǭ�   
--��J���u�����Ҧr���d���~��
create function fnGetSalary(@id char(10))
returns money
begin
declare @salary money
select @salary=�~��
from ���u
where �����Ҧr��=@id

if @salary is null
return 0

return @salary

end
go
--�d�XA123456789���~��
select dbo.fnGetSalary('A123456789')

--�w��d�ߵ��G���ʧ@
--�ŧi @�ܼ� ���A
declare @Salary money
--�p�G
set @Salary=dbo.fnGetSalary('A123456789')

if @Salary=0
print '�d�L���H'
else
print '�~�ꬰ'+cast(@salary as varchar)