--檢視表
use 教務系統
go

create view view學生選課明細
as
select 班級.學號,學生.姓名 as 學生姓名,班級.課程編號,課程.名稱,學生.性別,班級.上課時間,班級.教室,
班級.教授編號,教授.科系,教授.職稱,員工.姓名 as 員工姓名
from 班級 
inner join 學生 on 班級.學號=學生.學號
inner join 課程 on 班級.課程編號=課程.課程編號
inner join 教授 on 班級.教授編號=教授.教授編號
inner join 員工 on 教授.身份證字號=員工.身份證字號

select * from view學生選課明細
where 性別='男'