--CTE(common table expression)
--將查詢結果作為暫存資料表
--將是教授的員工資料表作為暫存資料表
with test
as
(
select p.*
from 員工 as e inner join 教授 as p
on e.身份證字號=p.身份證字號
)

--需要利用查詢才能顯示此資料表內容
select * from test

--先找錨點(第一層)
select * from 主管 where 主管字號 is null

--只要是主管字號為第一層的A123456789，這些人就是第二層
--只要主管字號是員工字號就可以找到階層
--需要使用自身合併

--把第一階暫存成資料表來做對照
with 員工階層
as(
--第一階
select 員工字號,姓名,1 as 階層 from 主管 where 主管字號 is null
)
--第二階
--select 主管.員工字號,主管.姓名,2 as 階層 
select 主管.員工字號,主管.姓名,2 as 階層 
from 主管 inner join 員工階層
--在原本主管資料表裡的主管字號如果等於前一階(在員工階層資料表裡)的員工字號，就可以找出上一層的主管是誰
on 主管.主管字號=員工階層.員工字號


--利用union all結合資料表
with 員工階層
as(
--第一階
select 員工字號,姓名,1 as 階層 from 主管 where 主管字號 is null

union all
 --只要符合主管.主管字號=員工階層.員工字號，就會成為(原本階層+1)階    
select 主管.員工字號,主管.姓名,階層+1 as 階層 
from 主管 inner join 員工階層
on 主管.主管字號=員工階層.員工字號
)
--需要再次從暫存資料表中利用order by排序
select* from 員工階層 order by  階層

