--有條件的資料篩選

select *
from 學生
where 性別='男'

select *
from 學生
where 姓名='陳會安'

select *
from 學生
where 學號='S002'

select *
from 員工
where 薪水>50000

select *
from 員工
where 薪水>=50000

select *
from 學生
where 生日>='1991/1/1'

select *
from 學生
where 生日 is null

select *
from 員工
where 電話 is null

--like 運算子 (模糊查詢)
-- % 0~N個任意字元  
-- _一個任意字元
-- []內任意字元

select *
from 學生
where 姓名 like'陳%'

select *
from 學生
where 姓名 like'陳_'

select *
from 學生
where 姓名 like'陳__'

select *
from 教授

select *
from 教授
where 科系 like'C%S'

select *
from 教授
where 科系 like'C_S'

select *
from 教授
where 科系 like'%[ABCDEF]%'

select *
from 教授
where 科系 like'%[A-F]%'

select *
from 教授
where 身份證字號 like'%[A-F]%'

select *
from 教授
where 身份證字號 like'%[A-F0-3]%'

--between...and...運算
select *
from 員工
where 薪水 >=25000 and 薪水<55000

select *
from 員工
where 薪水 between 25000 and 55000

--in 運算子
select *
from 課程
where 課程編號='CS101' or 課程編號='CS213' or 課程編號='CS349' or 課程編號='CS999'

select *
from 課程
where 課程編號 in('CS101' ,'CS213','CS349','CS999')
