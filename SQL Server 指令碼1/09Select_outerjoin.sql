--�~���X�֬d��(outer join)
--�i�������S���ƪ��t��

select* from ���u
select* from �б�

select*
from ���u inner join �б�
on ���u.�����Ҧr��=�б�.�����Ҧr��

--�C�X���O�бª����u
select*
from ���u left outer join �б�
--�H����ƪ��D��ƪ�A�����ƪ�����ܡA�S��ƪ�u��ܲŦX�D�����p�����
on ���u.�����Ҧr��=�б�.�����Ҧr��

select*
from �б� left outer join ���u
--�����ƪ�����ܡA�S��ƪ�u��ܲŦX�D�����p�����
on ���u.�����Ҧr��=�б�.�����Ҧr��

select ���u.*
--�u�ݭn���u��ƪ�̪��Ҧ����
from ���u left outer join �б�
on ���u.�����Ҧr��=�б�.�����Ҧr��
where �б�.�б½s�� is null
--��X�|����Ҫ��ǥ�

select* from �ǥ� 
select* from �Z��
select* from �ҵ{

select �ǥ�.*
from �ǥ� left outer join �Z��
on �ǥ�.�Ǹ�=�Z��.�Ǹ�
where �Z��.�Ǹ� is null

--��X�|���Q�諸��
select �ҵ{.*
from �ҵ{ left outer join �Z��
on �ҵ{.�ҵ{�s��=�Z��.�ҵ{�s��
where �Z��.�Ǹ� is null

--��X�|���Q�諸�б¸��
select * from �б�
select * from �Z��

select �б�.*
from �Z�� right outer join �б�
on �Z��.�б½s��=�б�.�б½s��
where �Z��.�б½s�� is null

--full join
--�C�X�ⰼ�������

select*
from �Z�� full join �ǥ�
on �Z��.�Ǹ�=�ǥ�.�Ǹ�

--cross join
--���μgon�A�^�Ǩ��ƪ��d����(���ƪ��`���ƪ����n)
select * 
from �Z�� cross join �ǥ�
--on �Z��.�Ǹ�=�ǥ�.�Ǹ�

--isnull(���W,'��ܤ��e') �B�znull�Ȫ����
select * from ���u

select �����Ҧr��, �m�W,����,��D,isnull(�q��,'�|����g'),�~��,�O�I,���|
from ���u 

