--�����󪺸�ƿz��

select *
from �ǥ�
where �ʧO='�k'

select *
from �ǥ�
where �m�W='���|�w'

select *
from �ǥ�
where �Ǹ�='S002'

select *
from ���u
where �~��>50000

select *
from ���u
where �~��>=50000

select *
from �ǥ�
where �ͤ�>='1991/1/1'

select *
from �ǥ�
where �ͤ� is null

select *
from ���u
where �q�� is null

--like �B��l (�ҽk�d��)
-- % 0~N�ӥ��N�r��  
-- _�@�ӥ��N�r��
-- []�����N�r��

select *
from �ǥ�
where �m�W like'��%'

select *
from �ǥ�
where �m�W like'��_'

select *
from �ǥ�
where �m�W like'��__'

select *
from �б�

select *
from �б�
where ��t like'C%S'

select *
from �б�
where ��t like'C_S'

select *
from �б�
where ��t like'%[ABCDEF]%'

select *
from �б�
where ��t like'%[A-F]%'

select *
from �б�
where �����Ҧr�� like'%[A-F]%'

select *
from �б�
where �����Ҧr�� like'%[A-F0-3]%'

--between...and...�B��
select *
from ���u
where �~�� >=25000 and �~��<55000

select *
from ���u
where �~�� between 25000 and 55000

--in �B��l
select *
from �ҵ{
where �ҵ{�s��='CS101' or �ҵ{�s��='CS213' or �ҵ{�s��='CS349' or �ҵ{�s��='CS999'

select *
from �ҵ{
where �ҵ{�s�� in('CS101' ,'CS213','CS349','CS999')
