--offset(��n�C���e����n�C)...fetch next(���Un�C)
--�o�Oorder by���l�y(2018����~�����\��)

select* from ���u

select* from ���u
order by �����Ҧr��
offset 3 rows

select* from ���u
order by �����Ҧr��
offset 3 rows
fetch next 3 rows only

--��order by���e�T��
--��fetch next�@�w�n��offset�A�ҥHoffset�g0
select* from ���u
order by �����Ҧr��
offset 0 rows
fetch next 3 rows only

--top 3...order by ���k
select top 3 ���u.* from ���u
order by �����Ҧr��

--isnull(�N�����ȭn�P���ƫ��A���e�۲�)
select �����Ҧr��,�m�W,isnull(�q��,'����g') as �q��
from ���u

--�L�k����A�]���ͤ�o��ƫ��A�O����ɶ��A�P�N���r�ꫬ�A����)
select �Ǹ�,�m�W,�ʧO,�q��,�m�W,isnull(�ͤ�,'����g') 
from �ǥ�

--�ͤ�������૬ cast
select �Ǹ�,�m�W,�ʧO,�q��,�m�W,cast(�ͤ� as nvarchar) 
from �ǥ�

--�ͤ�������૬ convert(���A,�����,���A�N�X)
select �Ǹ�,�m�W,�ʧO,�q��,�m�W,convert(nvarchar,�ͤ�,120) 
from �ǥ�

--����૬��N��null���e
select �Ǹ�,�m�W,�ʧO,�q��,�m�W,isnull(cast(�ͤ� as nvarchar),'����g') 
from �ǥ�

