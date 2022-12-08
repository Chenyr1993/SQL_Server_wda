--update

update 課程
set 名稱='計算機概論'
where 課程編號='CS101'


--一次改兩個欄位
update 課程
set 學分=4,名稱='互動式網頁設計'
where 課程編號='CS205'

--利用子查詢跨資料表限定條件
--若該課程人數>=3，將課程學分數改為30
update 課程
set 學分=30
where 課程編號 in(select 課程編號
from 班級
group by 課程編號
having count(*)>=3)

--用合併查詢
--把有被選的課程，學分數改成100
update 課程
set 學分=100
from 班級 inner join 課程
on 班級.課程編號=課程.課程編號
