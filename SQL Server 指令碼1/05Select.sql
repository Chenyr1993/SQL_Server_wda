select count(*) as �H��
from �ǥ�

select count(*) as �H��
from �ǥ�
group by �ʧO

--group by
select �Ǥ�
from �ҵ{

select distinct �Ǥ�
from �ҵ{
--distinct�O�����ۦP���
select �Ǥ�
from �ҵ{
group by �Ǥ�

--�d���`�H��
select count(*) as �H��
from �ǥ�

--�k�k�H�Ƹ�Ʋέp
select �ʧO, count(*) as �H��
from �ǥ�
group by �ʧO


--�d�ߦ��X����Ҹ��
select count(*) 
from �Z��

--�έp�C��ǥͦU��X����

select �Ǹ�,count(*)as �׽Ҽ�
from �Z��
group by �Ǹ�

--�έp�C���ҵ{�ӳQ�h�־ǥͿ��
select �ҵ{�s��,count(*)as �׽ҤH��
from �Z��
group by �ҵ{�s��

--�έp�C��б¦��h�־ǥͿ��
select �б½s��,count(*)as �׽ҤH��
from �Z��
group by �б½s��

--�C�ӱб¶}���Y���Ҧ��X�H��
select �б½s��,�ҵ{�s��,count(*)as �׽ҤH��
from �Z��
group by �б½s��,�ҵ{�s��
--�T�����Y(�@���ҥi�H�Q�h��б¶}��;�@��б¥i�H�}�h����;�@��б·|���h��ǥ�;�@��ǥͥi��|�W��h��бª���;�@��ǥͥi�H��צh���ҵ{;�@���ҥi�H�Q�h��ǥͿ��)

--�d��(���z�����)��Ҽ�<3���ǥ�
select �Ǹ�,count(*)as ��Ҽ�
from �Z��
group by �Ǹ�
having count(*)<3
order by �Ǹ�  desc
--where ��Ҽ�--�]�����涶�ǡA�ҥH�䤣��

--�d�߾ǥͪ���Ҽ�(+�ƭ˧�)
select �Ǹ�,count(*)as ��Ҽ�
from �Z��
group by �Ǹ�
order by �Ǹ�  desc

--���g����
--1.select
--2.from
--3.where
--4.group by
--5.having
--6.order by

--���涶��
--1. from
--2. where
--3. group by
--4. having
--5. select
--6. order by