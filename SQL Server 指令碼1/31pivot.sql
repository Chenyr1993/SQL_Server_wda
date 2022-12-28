--先寫原始資料select
--pivot(聚合函數 for)as 別名;

select*
from
--行(學號)
(select 學生.姓名+班級.學號 as 姓名學號,班級.課程編號,班級.教室
from 班級 inner join 學生
on 班級.學號=學生.學號) as t1
pivot(
--內容(教室)
max(教室)
--列(課程編號)
for 課程編號 in ([CS101],[CS213],[CS349],[CS121],[CS222],[CS203],[CS111],[CS205])
)as r;
--------------
select r.姓名學號
,isnull(r.CS101,'未修課')as CS101
,isnull(r.CS111,'未修課')as CS111
,isnull(r.CS121,'未修課')as CS121
,isnull(r.CS203,'未修課')as CS203
,isnull(r.CS213,'未修課')as CS213
,isnull(r.CS222,'未修課')as CS222
,isnull(r.CS349,'未修課')as CS349
from
(select 學生.姓名+'('+班級.學號+')'as 姓名學號,班級.課程編號,班級.教室
from 班級 inner join 學生
on 班級.學號=學生.學號) as t1
pivot(
max(教室)
for 課程編號 in ([CS101],[CS213],[CS349],[CS121],[CS222],[CS203],[CS111])
)as r;
--------------------

--宣告變數放選擇到的編號字串
declare @select_cols nvarchar(max)
--宣告變數存放字串
declare @sql nvarchar(max)

--組出字串
--如果@select_cols不是null就累加

select @select_cols = isnull(@select_cols+',['+課程編號+']','['+課程編號+']')
from 課程
print @select_cols

set @sql= 'select r.姓名,'+@select_cols+
'from
(select 學生.姓名,班級.課程編號,班級.教室
from 班級 inner join 學生
on 班級.學號=學生.學號) as t1
pivot(
max(教室)
for 課程編號 in ('+@select_cols+')
)as r'

select 課程編號
from 課程

exec(@sql)