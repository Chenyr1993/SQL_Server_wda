--外部合併查詢(outer join)
--可完全顯露兩資料表的差異

select* from 員工
select* from 教授

select*
from 員工 inner join 教授
on 員工.身份證字號=教授.身份證字號

--列出不是教授的員工
select*
from 員工 left outer join 教授
--以左資料表為主資料表，左邊資料表完全顯示，又資料表只顯示符合主鍵關聯的資料
on 員工.身份證字號=教授.身份證字號

select*
from 教授 left outer join 員工
--左邊資料表完全顯示，又資料表只顯示符合主鍵關聯的資料
on 員工.身份證字號=教授.身份證字號

select 員工.*
--只需要員工資料表裡的所有欄位
from 員工 left outer join 教授
on 員工.身份證字號=教授.身份證字號
where 教授.教授編號 is null
--找出尚未選課的學生

select* from 學生 
select* from 班級
select* from 課程

select 學生.*
from 學生 left outer join 班級
on 學生.學號=班級.學號
where 班級.學號 is null

--找出尚未被選的課
select 課程.*
from 課程 left outer join 班級
on 課程.課程編號=班級.課程編號
where 班級.學號 is null

--找出尚未被選的教授資料
select * from 教授
select * from 班級

select 教授.*
from 班級 right outer join 教授
on 班級.教授編號=教授.教授編號
where 班級.教授編號 is null

--full join
--列出兩側全部資料

select*
from 班級 full join 學生
on 班級.學號=學生.學號

--cross join
--不用寫on，回傳兩資料表的卡式基(兩資料表總筆數的乘積)
select * 
from 班級 cross join 學生
--on 班級.學號=學生.學號

--isnull(欄位名,'顯示內容') 處理null值的顯示
select * from 員工

select 身份證字號, 姓名,城市,街道,isnull(電話,'尚未填寫'),薪水,保險,扣稅
from 員工 

