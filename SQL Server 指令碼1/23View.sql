--�˵���
use �аȨt��
go

create view view�ǥͿ�ҩ���
as
select �Z��.�Ǹ�,�ǥ�.�m�W as �ǥͩm�W,�Z��.�ҵ{�s��,�ҵ{.�W��,�ǥ�.�ʧO,�Z��.�W�Үɶ�,�Z��.�Ы�,
�Z��.�б½s��,�б�.��t,�б�.¾��,���u.�m�W as ���u�m�W
from �Z�� 
inner join �ǥ� on �Z��.�Ǹ�=�ǥ�.�Ǹ�
inner join �ҵ{ on �Z��.�ҵ{�s��=�ҵ{.�ҵ{�s��
inner join �б� on �Z��.�б½s��=�б�.�б½s��
inner join ���u on �б�.�����Ҧr��=���u.�����Ҧr��

select * from view�ǥͿ�ҩ���
where �ʧO='�k'