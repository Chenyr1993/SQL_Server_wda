--update

update �ҵ{
set �W��='�p�������'
where �ҵ{�s��='CS101'


--�@���������
update �ҵ{
set �Ǥ�=4,�W��='���ʦ������]�p'
where �ҵ{�s��='CS205'

--�Q�Τl�d�߸��ƪ��w����
--�Y�ӽҵ{�H��>=3�A�N�ҵ{�Ǥ��Ƨאּ30
update �ҵ{
set �Ǥ�=30
where �ҵ{�s�� in(select �ҵ{�s��
from �Z��
group by �ҵ{�s��
having count(*)>=3)

--�ΦX�֬d��
--�⦳�Q�諸�ҵ{�A�Ǥ��Ƨ令100
update �ҵ{
set �Ǥ�=100
from �Z�� inner join �ҵ{
on �Z��.�ҵ{�s��=�ҵ{.�ҵ{�s��
