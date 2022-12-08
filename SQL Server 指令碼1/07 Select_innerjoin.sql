--合併查詢
--inner join 第一種寫法
select 班級.學號,學生.姓名,班級.課程編號,課程.名稱,學生.性別,班級.上課時間,班級.教室,
班級.教授編號,教授.科系,教授.職稱,員工.姓名
from 班級 
inner join 學生 on 班級.學號=學生.學號
inner join 課程 on 班級.課程編號=課程.課程編號
inner join 教授 on 班級.教授編號=教授.教授編號
inner join 員工 on 教授.身份證字號=員工.身份證字號

--取別名(查詢欄位可以取別名，資料表也可以)
select class.學號,s.姓名,class.課程編號,c.名稱,s.性別,class.上課時間,class.教室,
class.教授編號,p.科系,p.職稱,e.姓名
from 班級 as class
inner join 學生 as s on class.學號=s.學號
inner join 課程 as c on class.課程編號=c.課程編號
inner join 教授 as p on class.教授編號=p.教授編號
inner join 員工 as e on p.身份證字號=e.身份證字號

--查學生選課數
select c.學號,s.姓名, count(*) as 選課數
from 班級 as c
inner join 學生 as s on c.學號=s.學號
group by c.學號,s.姓名
--查詢S007是否沒選過課
select*
from 班級
where 學號='S007'
--確實沒選過課，innerjoin後看不到

--inner join第二種寫法
--括號內視為一張資料表
select  c.學號,s.姓名,c.課程編號,co.名稱,s.性別,c.上課時間,c.教室,p.教授編號,p.科系,p.職稱,e.姓名
from 員工 as e inner join (教授 as p inner join
(課程 as co inner join 
(班級 as c inner join 學生 as s on c.學號=s.學號) 
on co.課程編號=c.課程編號) 
on p.教授編號=c.教授編號) 
on e.身份證字號=p.身份證字號

--inner join第三種寫法(自然(隱含)合併法，當資料沒有拉關聯時，做卡式基運算)
--把關連當成條件
--先把全部東西列出來，再篩選符合條件內容
select c.學號,s.姓名,c.課程編號,co.名稱,s.性別,c.上課時間,c.教室,p.教授編號,p.科系,p.職稱,e.姓名
from 班級 as c,學生 as s,課程 as co,教授 as p ,員工 as e
where c.學號=s.學號 and c.課程編號=co.課程編號 and c.教授編號=p.教授編號 and p.身份證字號=e.身份證字號
