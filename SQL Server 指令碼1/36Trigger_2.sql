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