--after trigger
--�s�W�ӷ~�޿�����

--�C��ǥͳ̦h�u���5���ҡA�Y�W�L5���A���[��ɵL�k�s�J��Ʈw
alter trigger checkOrderCourse on �Z��
after insert
as
begin
--��Ҽ�
	declare @num int
	select @num=count(*)
	from �Z��
	where �Ǹ�=(select �Ǹ� from inserted)
	--�p�G��=�|�h�[�@��
	if @num>5 --��ܸӥͤw�ﺡ5����
		begin
		print '�z�w�ﺡ5���ҡA�p���[��Х��h���A�[��'
		rollback --��Ʀ^�_�A���s�J��Ʈw
		end
	end
	go
---
select * from �Z�� 
select * from �ҵ{
select * from �Z�� where �Ǹ�='S002'
insert into �Z��
values ('I003','S002','CS213','1900-01-01 09:00','622-G')

--�ק�Ǥ��A���i�C���Ǥ���
create trigger checkCredit on �ҵ{
after update
as 
begin
	declare @old int, @new int
	select @new=�Ǥ�
	from inserted
	select @old=�Ǥ�
	from deleted
	
	if @new <@old --��ܾǤ��ƧC���Ǥ�
		begin
		print '�Ǥ��Ƥ��i�C���Ǥ���'
		rollback --��Ʀ^�_�A���s�J��Ʈw
	end
end

--����
select * from �ҵ{

update �ҵ{
set �Ǥ�=1
where �ҵ{�s��='CS998'

--
select * from �ǥ�
select * from ���u
--�Y�R�����u��ƮɡA�ӭ��u�]�O�ǥ͡A���i�R��

create trigger checkEmployeeIsStudent on ���u
after delete
as
begin
if  exists (select * from �ǥ� where �m�W=(select �m�W from deleted))
begin
print'������ƦP�ɬ��ǥ͸�ơA���i�R��'
rollback
end
end

--����
delete from ���u
where �����Ҧr��='F332213046'
