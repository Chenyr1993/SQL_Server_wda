--集合運算
--聯集union(找事學生或員工的人，排除資料交集的人)
select 姓名 from 員工
union
select 姓名 from 學生

--交集intersect(找是學生也是員工的人)
select 姓名 from 員工
intersect
select 姓名 from 學生

--差集except(是員工但不是學生)
select 姓名 from 員工
except
select 姓名 from 學生

--是學生但不是員工
select 姓名 from 學生
except
select 姓名 from 員工