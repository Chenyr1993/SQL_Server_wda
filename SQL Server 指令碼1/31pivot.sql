--���g��l���select
--pivot(�E�X��� for)as �O�W;

select*
from
--��(�Ǹ�)
(select �ǥ�.�m�W+�Z��.�Ǹ� as �m�W�Ǹ�,�Z��.�ҵ{�s��,�Z��.�Ы�
from �Z�� inner join �ǥ�
on �Z��.�Ǹ�=�ǥ�.�Ǹ�) as t1
pivot(
--���e(�Ы�)
max(�Ы�)
--�C(�ҵ{�s��)
for �ҵ{�s�� in ([CS101],[CS213],[CS349],[CS121],[CS222],[CS203],[CS111],[CS205])
)as r;
--------------
select r.�m�W�Ǹ�
,isnull(r.CS101,'���׽�')as CS101
,isnull(r.CS111,'���׽�')as CS111
,isnull(r.CS121,'���׽�')as CS121
,isnull(r.CS203,'���׽�')as CS203
,isnull(r.CS213,'���׽�')as CS213
,isnull(r.CS222,'���׽�')as CS222
,isnull(r.CS349,'���׽�')as CS349
from
(select �ǥ�.�m�W+'('+�Z��.�Ǹ�+')'as �m�W�Ǹ�,�Z��.�ҵ{�s��,�Z��.�Ы�
from �Z�� inner join �ǥ�
on �Z��.�Ǹ�=�ǥ�.�Ǹ�) as t1
pivot(
max(�Ы�)
for �ҵ{�s�� in ([CS101],[CS213],[CS349],[CS121],[CS222],[CS203],[CS111])
)as r;
--------------------

--�ŧi�ܼƩ��ܨ쪺�s���r��
declare @select_cols nvarchar(max)
--�ŧi�ܼƦs��r��
declare @sql nvarchar(max)

--�եX�r��
--�p�G@select_cols���Onull�N�֥[

select @select_cols = isnull(@select_cols+',['+�ҵ{�s��+']','['+�ҵ{�s��+']')
from �ҵ{
print @select_cols

set @sql= 'select r.�m�W,'+@select_cols+
'from
(select �ǥ�.�m�W,�Z��.�ҵ{�s��,�Z��.�Ы�
from �Z�� inner join �ǥ�
on �Z��.�Ǹ�=�ǥ�.�Ǹ�) as t1
pivot(
max(�Ы�)
for �ҵ{�s�� in ('+@select_cols+')
)as r'

select �ҵ{�s��
from �ҵ{

exec(@sql)