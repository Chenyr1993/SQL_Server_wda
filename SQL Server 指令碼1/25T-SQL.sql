--�y�{����
--if/else
--�H begin,end ���N{}

declare @test nvarchar(5)='Hello'

if @test='hELlo'
begin
	print '����'
end
else
	print '������'

--�j�M�� else if

declare @height int 
set @height=150

if @height>=120
print '����'
else if @height>=90
print '�b��'
else
print '�K�O'