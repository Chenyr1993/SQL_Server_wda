--Trigger Ĳ�o�{��
--�P�w�s�{�Ǥ@�˹w���g�n�{���A�ó]�w�ɾ��ۤv�QĲ�o����,�L�k�I�s
--trigger�O�bcommit�e����


select * from �Ȥ�

insert into �Ȥ�
values('C999','���p��','07-4536456')

update �Ȥ�
set �m�W='aaa',�q��='bbb'
output inserted.�Ȥ�s��,inserted.�m�W as NewName,inserted.�q��,deleted.�m�W,deleted.�q��
where �Ȥ�s��='C010'

--�гytrigger����G�ݸ�ƪ�Q�ק�᪺��Ƨe�{
--create trigger trigger�W�٦ۭq
create trigger showCustomerData on �Ȥ�
after update
as
begin

select inserted.�Ȥ�s��,inserted.�m�W as NewName,inserted.�q�� as NewTel 
from inserted
select deleted.�Ȥ�s��, deleted.�m�W as OldName,deleted.�q�� as OldTel
from deleted

end

Update �Ȥ�
set �m�W='������',�q��='08-5645321'
where �Ȥ�s��='C999'
--�]��trigger�O�g�bupdate�A�ҥH����insert�ɤ��|Ĳ�o

insert into �Ȥ�
Values('C998','�ߦϦ�','02-2222333')

------�s�@insert trigger
select * from �ҵ{
create trigger showCourse on �ҵ{
after insert
as
begin
--�]���q�`�s�W��ƥu�|�X�{�@��Ʀ���v�T�A�ݤ��쵲�G
select *
from �ҵ{

end

insert into �ҵ{
values('CS998','123123','1')