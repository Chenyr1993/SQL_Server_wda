--�l�d��(SubQuery)
--���O�d�ߪ��D�n��ƧY���l�d��
--�d�߸�Ƥ����@�h
--�d"�i�L��"����Ҹ��
select * from �Z��
--�X�֬d�߮į�>�l�d�ߡA����l�d�߳��i�H�ΦX�֬d�߹F��
select* from �Z��
where �Ǹ� in (select �Ǹ� from �ǥ�
where �m�W='�i�L��')

--�X�֬d��
select �Z��.*
from �Z�� inner join �ǥ�
on �Z��.�Ǹ�=�ǥ�.�Ǹ�
where �ǥ�.�m�W='�i�L��'

--�Ьd�߭��ǭ��u���~���j��������u�������~��
--�l�d��
select *from ���u
where �~��>(select avg(�~��) as �����~�� from ���u)

--�X�֬d��(�ۨ��X��)

--�ϥ�inner join
select ���u.�����Ҧr��,���u.�m�W,���u.�~��
from ���u inner join ���u as �s���u
on ���u.�����Ҧr�� !=�s���u.�����Ҧr��
--������̬ۦP�������A�|�ѤU72��
group by ���u.�����Ҧr��,���u.�m�W,���u.�~��
having ���u.�~��>avg(�s���u.�~��)
--�]���ݭn�λE�M��ư�����B��A�n��having

--�ϥ�cross join
select ���u.�����Ҧr��,���u.�m�W,���u.�~��
from ���u cross join  ���u as �s���u
group by ���u.�����Ҧr��,���u.�m�W,���u.�~��
having ���u.�~��>avg(�s���u.�~��)

--�ϥΦ۵M�X��
select a.�����Ҧr��,a.�m�W,a.�~��
from ���u as a ,���u as b
group by a.�����Ҧr��,a.�m�W,a.�~��
having a.�~��>avg(b.�~��)


--�d�߭��X����u�O�б�
select* from ���u
select * from �б�

--�Q�Τl�d�߼g�k(�B��l in)
--����B�⦡���D�᭱�d�ߥX�Ӫ����G�u���@�ӡA�h�����=
--�d�ߵ��G���O�D������@�w�n�� in
select *from ���u
where �����Ҧr�� in (select �����Ҧr�� from �б�)

--�Q�Τl�d�߼g�k(�B��l exists�A���Ϋ��w���)
--���l�d�ߵL�k��W�Q����
select *from ���u
where  exists (select* from �б� where �б�.�����Ҧr��=���u.�����Ҧr��)

--inner join �g�k
select ���u.*
from ���u inner join �б�
on ���u.�����Ҧr��=�б�.�����Ҧr��

--���ǾǥͿ�FCS222�ҵ{
select * from �ǥ�
select * from �ҵ{
select * from �Z��
--in
select * from �ǥ�
where �Ǹ� in(select �Ǹ� from �Z�� where �Z��.�ҵ{�s��='CS222')

--exists
select * from �ǥ�
where exists (select �Ǹ� from �Z�� where �Z��.�Ǹ�=�ǥ�.�Ǹ� and �ҵ{�s��='CS222')

--���ǽҵ{�b221-S�W��
--in
select* from �ҵ{ where �ҵ{�s�� in 
(select distinct �ҵ{�s�� from �Z�� where �Ы�='221-S') 
--exists
select* from �ҵ{ where exists 
(select distinct �ҵ{�s�� from �Z�� where �ҵ{.�ҵ{�s��=�Z��.�ҵ{�s�� and �Ы�='221-S') 

--�d�߾ǥͩP�N���ҿ�Ҫ��ҵ{���
--�l�d��

select * from �Z��
--in


select * from �ҵ{ where �ҵ{�s�� in(select �ҵ{�s�� from �Z�� 
where �Ǹ� in( select �Ǹ� from �ǥ� where �m�W='�P�N��'))

--exists
select * from �ҵ{ where exists (select �ҵ{�s�� from �Z�� 
where exists (select �Ǹ� from �ǥ� 
where �m�W='�P�N��' and �Z��.�Ǹ�=�ǥ�.�Ǹ� and �Z��.�ҵ{�s��=�ҵ{.�ҵ{�s��))

--�X�֬d��
select * from �ҵ{
inner join �Z�� on �Z��.�ҵ{�s��=�ҵ{.�ҵ{�s��
inner join �ǥ�
on �ǥ�.�Ǹ�=�Z��.�Ǹ�
where �ǥ�.�m�W='�P�N��'

--�d�߾ǥͩP�N��"�S��"�諸�ҵ{���
--�l�d��
--in(���b�ҵ{�� not in)
select * from �ҵ{ where �ҵ{�s��  not in(select �ҵ{�s�� from �Z�� 
where �Ǹ� in( select �Ǹ� from �ǥ� where �m�W='�P�N��'))

--exists (���b�ҵ{�� not exists)
select * from �ҵ{ 
where not exists (select �ҵ{�s�� from �Z�� 
where exists (select �Ǹ� from �ǥ� 
where �m�W='�P�N��' and �Z��.�Ǹ�=�ǥ�.�Ǹ� and �Z��.�ҵ{�s��=�ҵ{.�ҵ{�s��))

--�X�֬d��
--�Q��except�P���ƪ��t��
select * from �ҵ{
except
select �ҵ{.* from �ҵ{
inner join �Z�� on �Z��.�ҵ{�s��=�ҵ{.�ҵ{�s��
inner join �ǥ�
on �ǥ�.�Ǹ�=�Z��.�Ǹ�
where �ǥ�.�m�W='�P�N��'

--��X�~��j��(��b�x�_�Ҧ����u)���~��

--�~���j�󥭧��~��
select * 
from ���u
where �~��>(select avg(�~��) from ���u)
--�~���j���x�_���Ҧ����u
select * 
from ���u
           --����b�x�_���̰��~��
where �~��>=(select top 1 �~�� from ���u where ����='�x�_' order by �~�� desc)

--all ��j��l���X�̪��̤j�ȸ��
select * 
from ���u          
where �~��>=all(select  �~�� from ���u where ����='�x�_')


--�~���j����@���x�_���u
--�H�U��k�Ҭ���j��l���X�̳̤p�ȸ��
--some (���W�g�k)
select * 
from ���u          
where �~��>=some(select  �~�� from ���u where ����='�x�_')
--any(T-SQL�M��)
select * 
from ���u          
where �~��>=any(select  �~�� from ���u where ����='�x�_')
--�@��l���X
select * 
from ���u 
where �~��>=(select top 1 �~�� from ���u where ����='�x�_' order by �~��)