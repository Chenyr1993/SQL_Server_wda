select count(*) as 人數
from 學生

select count(*) as 人數
from 學生
group by 性別

--group by
select 學分
from 課程

select distinct 學分
from 課程
--distinct是移除相同資料
select 學分
from 課程
group by 學分

--查詢總人數
select count(*) as 人數
from 學生

--男女人數資料統計
select 性別, count(*) as 人數
from 學生
group by 性別


--查詢有幾筆選課資料
select count(*) 
from 班級

--統計每位學生各選幾門課

select 學號,count(*)as 修課數
from 班級
group by 學號

--統計每門課程個被多少學生選修
select 課程編號,count(*)as 修課人次
from 班級
group by 課程編號

--統計每位教授有多少學生選課
select 教授編號,count(*)as 修課人次
from 班級
group by 教授編號

--每個教授開的某門課有幾人選
select 教授編號,課程編號,count(*)as 修課人次
from 班級
group by 教授編號,課程編號
--三元關係(一門課可以被多位教授開課;一位教授可以開多門課;一位教授會有多位學生;一位學生可能會上到多位教授的課;一位學生可以選修多門課程;一門課可以被多位學生選修)

--查詢(有篩選條件)選課數<3的學生
select 學號,count(*)as 選課數
from 班級
group by 學號
having count(*)<3
order by 學號  desc
--where 選課數--因為執行順序，所以找不到

--查詢學生的選課數(+排倒序)
select 學號,count(*)as 選課數
from 班級
group by 學號
order by 學號  desc

--撰寫順序
--1.select
--2.from
--3.where
--4.group by
--5.having
--6.order by

--執行順序
--1. from
--2. where
--3. group by
--4. having
--5. select
--6. order by