--CTE(common table expression)
--�N�d�ߵ��G�@���Ȧs��ƪ�
--�N�O�бª����u��ƪ�@���Ȧs��ƪ�
with test
as
(
select p.*
from ���u as e inner join �б� as p
on e.�����Ҧr��=p.�����Ҧr��
)

--�ݭn�Q�άd�ߤ~����ܦ���ƪ��e
select * from test

--�������I(�Ĥ@�h)
select * from �D�� where �D�ަr�� is null

--�u�n�O�D�ަr�����Ĥ@�h��A123456789�A�o�ǤH�N�O�ĤG�h
--�u�n�D�ަr���O���u�r���N�i�H��춥�h
--�ݭn�ϥΦۨ��X��

--��Ĥ@���Ȧs����ƪ�Ӱ����
with ���u���h
as(
--�Ĥ@��
select ���u�r��,�m�W,1 as ���h from �D�� where �D�ަr�� is null
)
--�ĤG��
--select �D��.���u�r��,�D��.�m�W,2 as ���h 
select �D��.���u�r��,�D��.�m�W,2 as ���h 
from �D�� inner join ���u���h
--�b�쥻�D�޸�ƪ�̪��D�ަr���p�G����e�@��(�b���u���h��ƪ��)�����u�r���A�N�i�H��X�W�@�h���D�ެO��
on �D��.�D�ަr��=���u���h.���u�r��


--�Q��union all���X��ƪ�
with ���u���h
as(
--�Ĥ@��
select ���u�r��,�m�W,1 as ���h from �D�� where �D�ަr�� is null

union all
 --�u�n�ŦX�D��.�D�ަr��=���u���h.���u�r���A�N�|����(�쥻���h+1)��    
select �D��.���u�r��,�D��.�m�W,���h+1 as ���h 
from �D�� inner join ���u���h
on �D��.�D�ަr��=���u���h.���u�r��
)
--�ݭn�A���q�Ȧs��ƪ��Q��order by�Ƨ�
select* from ���u���h order by  ���h

