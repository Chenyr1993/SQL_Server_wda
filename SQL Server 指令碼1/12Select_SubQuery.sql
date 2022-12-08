--子查詢(SubQuery)
--不是查詢的主要資料即為子查詢
--查詢資料不限一層
--查"張無忌"的選課資料
select * from 班級
--合併查詢效能>子查詢，任何子查詢都可以用合併查詢達成
select* from 班級
where 學號 in (select 學號 from 學生
where 姓名='張無忌')

--合併查詢
select 班級.*
from 班級 inner join 學生
on 班級.學號=學生.學號
where 學生.姓名='張無忌'

--請查詢哪些員工的薪水大於全部員工的平均薪資
--子查詢
select *from 員工
where 薪水>(select avg(薪水) as 平均薪資 from 員工)

--合併查詢(自身合併)

--使用inner join
select 員工.身份證字號,員工.姓名,員工.薪水
from 員工 inner join 員工 as 新員工
on 員工.身份證字號 !=新員工.身份證字號
--扣除兩者相同的對應，會剩下72筆
group by 員工.身份證字號,員工.姓名,員工.薪水
having 員工.薪水>avg(新員工.薪水)
--因為需要用聚和函數做比較運算，要用having

--使用cross join
select 員工.身份證字號,員工.姓名,員工.薪水
from 員工 cross join  員工 as 新員工
group by 員工.身份證字號,員工.姓名,員工.薪水
having 員工.薪水>avg(新員工.薪水)

--使用自然合併
select a.身份證字號,a.姓名,a.薪水
from 員工 as a ,員工 as b
group by a.身份證字號,a.姓名,a.薪水
having a.薪水>avg(b.薪水)


--查詢哪幾位員工是教授
select* from 員工
select * from 教授

--利用子查詢寫法(運算子 in)
--比較運算式除非後面查詢出來的結果只有一個，則不能用=
--查詢結果不是主索引鍵一定要用 in
select *from 員工
where 身份證字號 in (select 身份證字號 from 教授)

--利用子查詢寫法(運算子 exists，不用指定欄位)
--此子查詢無法單獨被執行
select *from 員工
where  exists (select* from 教授 where 教授.身份證字號=員工.身份證字號)

--inner join 寫法
select 員工.*
from 員工 inner join 教授
on 員工.身份證字號=教授.身份證字號

--哪些學生選了CS222課程
select * from 學生
select * from 課程
select * from 班級
--in
select * from 學生
where 學號 in(select 學號 from 班級 where 班級.課程編號='CS222')

--exists
select * from 學生
where exists (select 學號 from 班級 where 班級.學號=學生.學號 and 課程編號='CS222')

--哪些課程在221-S上課
--in
select* from 課程 where 課程編號 in 
(select distinct 課程編號 from 班級 where 教室='221-S') 
--exists
select* from 課程 where exists 
(select distinct 課程編號 from 班級 where 課程.課程編號=班級.課程編號 and 教室='221-S') 

--查詢學生周杰輪所選課的課程資料
--子查詢

select * from 班級
--in


select * from 課程 where 課程編號 in(select 課程編號 from 班級 
where 學號 in( select 學號 from 學生 where 姓名='周杰輪'))

--exists
select * from 課程 where exists (select 課程編號 from 班級 
where exists (select 學號 from 學生 
where 姓名='周杰輪' and 班級.學號=學生.學號 and 班級.課程編號=課程.課程編號))

--合併查詢
select * from 課程
inner join 班級 on 班級.課程編號=課程.課程編號
inner join 學生
on 學生.學號=班級.學號
where 學生.姓名='周杰輪'

--查詢學生周杰輪"沒有"選的課程資料
--子查詢
--in(不在課程中 not in)
select * from 課程 where 課程編號  not in(select 課程編號 from 班級 
where 學號 in( select 學號 from 學生 where 姓名='周杰輪'))

--exists (不在課程中 not exists)
select * from 課程 
where not exists (select 課程編號 from 班級 
where exists (select 學號 from 學生 
where 姓名='周杰輪' and 班級.學號=學生.學號 and 班級.課程編號=課程.課程編號))

--合併查詢
--利用except與原資料表做差集
select * from 課程
except
select 課程.* from 課程
inner join 班級 on 班級.課程編號=課程.課程編號
inner join 學生
on 學生.學號=班級.學號
where 學生.姓名='周杰輪'

--找出薪資大於(住在台北所有員工)的薪資

--薪水大於平均薪資
select * 
from 員工
where 薪水>(select avg(薪水) from 員工)
--薪水大於住台北的所有員工
select * 
from 員工
           --先找在台北的最高薪資
where 薪水>=(select top 1 薪水 from 員工 where 城市='台北' order by 薪水 desc)

--all 找大於子集合裡的最大值資料
select * 
from 員工          
where 薪水>=all(select  薪水 from 員工 where 城市='台北')


--薪水大於任一位住台北員工
--以下方法皆為找大於子集合裡最小值資料
--some (正規寫法)
select * 
from 員工          
where 薪水>=some(select  薪水 from 員工 where 城市='台北')
--any(T-SQL專用)
select * 
from 員工          
where 薪水>=any(select  薪水 from 員工 where 城市='台北')
--一般子集合
select * 
from 員工 
where 薪水>=(select top 1 薪水 from 員工 where 城市='台北' order by 薪水)