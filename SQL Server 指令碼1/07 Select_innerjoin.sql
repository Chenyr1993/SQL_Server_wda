--�X�֬d��
--inner join �Ĥ@�ؼg�k
select �Z��.�Ǹ�,�ǥ�.�m�W,�Z��.�ҵ{�s��,�ҵ{.�W��,�ǥ�.�ʧO,�Z��.�W�Үɶ�,�Z��.�Ы�,
�Z��.�б½s��,�б�.��t,�б�.¾��,���u.�m�W
from �Z�� 
inner join �ǥ� on �Z��.�Ǹ�=�ǥ�.�Ǹ�
inner join �ҵ{ on �Z��.�ҵ{�s��=�ҵ{.�ҵ{�s��
inner join �б� on �Z��.�б½s��=�б�.�б½s��
inner join ���u on �б�.�����Ҧr��=���u.�����Ҧr��

--���O�W(�d�����i�H���O�W�A��ƪ�]�i�H)
select class.�Ǹ�,s.�m�W,class.�ҵ{�s��,c.�W��,s.�ʧO,class.�W�Үɶ�,class.�Ы�,
class.�б½s��,p.��t,p.¾��,e.�m�W
from �Z�� as class
inner join �ǥ� as s on class.�Ǹ�=s.�Ǹ�
inner join �ҵ{ as c on class.�ҵ{�s��=c.�ҵ{�s��
inner join �б� as p on class.�б½s��=p.�б½s��
inner join ���u as e on p.�����Ҧr��=e.�����Ҧr��

--�d�ǥͿ�Ҽ�
select c.�Ǹ�,s.�m�W, count(*) as ��Ҽ�
from �Z�� as c
inner join �ǥ� as s on c.�Ǹ�=s.�Ǹ�
group by c.�Ǹ�,s.�m�W
--�d��S007�O�_�S��L��
select*
from �Z��
where �Ǹ�='S007'
--�T��S��L�ҡAinnerjoin��ݤ���

--inner join�ĤG�ؼg�k
--�A���������@�i��ƪ�
select  c.�Ǹ�,s.�m�W,c.�ҵ{�s��,co.�W��,s.�ʧO,c.�W�Үɶ�,c.�Ы�,p.�б½s��,p.��t,p.¾��,e.�m�W
from ���u as e inner join (�б� as p inner join
(�ҵ{ as co inner join 
(�Z�� as c inner join �ǥ� as s on c.�Ǹ�=s.�Ǹ�) 
on co.�ҵ{�s��=c.�ҵ{�s��) 
on p.�б½s��=c.�б½s��) 
on e.�����Ҧr��=p.�����Ҧr��

--inner join�ĤT�ؼg�k(�۵M(���t)�X�֪k�A���ƨS�������p�ɡA���d����B��)
--�����s������
--��������F��C�X�ӡA�A�z��ŦX���󤺮e
select c.�Ǹ�,s.�m�W,c.�ҵ{�s��,co.�W��,s.�ʧO,c.�W�Үɶ�,c.�Ы�,p.�б½s��,p.��t,p.¾��,e.�m�W
from �Z�� as c,�ǥ� as s,�ҵ{ as co,�б� as p ,���u as e
where c.�Ǹ�=s.�Ǹ� and c.�ҵ{�s��=co.�ҵ{�s�� and c.�б½s��=p.�б½s�� and p.�����Ҧr��=e.�����Ҧr��
