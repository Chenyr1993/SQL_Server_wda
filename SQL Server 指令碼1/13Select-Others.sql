--offset(第n列往前推移n列)...fetch next(往下n列)
--這是order by的子句(2018版後才有此功能)

select* from 員工

select* from 員工
order by 身份證字號
offset 3 rows

select* from 員工
order by 身份證字號
offset 3 rows
fetch next 3 rows only

--像order by取前三位
--但fetch next一定要有offset，所以offset寫0
select* from 員工
order by 身份證字號
offset 0 rows
fetch next 3 rows only

--top 3...order by 做法
select top 3 員工.* from 員工
order by 身份證字號

--isnull(代換的值要與原資料型態內容相符)
select 身份證字號,姓名,isnull(電話,'未填寫') as 電話
from 員工

--無法執行，因為生日得資料型態是日期時間，與代換字串型態不符)
select 學號,姓名,性別,電話,姓名,isnull(生日,'未填寫') 
from 學生

--生日欄位資料轉型 cast
select 學號,姓名,性別,電話,姓名,cast(生日 as nvarchar) 
from 學生

--生日欄位資料轉型 convert(型態,資料欄,型態代碼)
select 學號,姓名,性別,電話,姓名,convert(nvarchar,生日,120) 
from 學生

--資料轉型後代換null內容
select 學號,姓名,性別,電話,姓名,isnull(cast(生日 as nvarchar),'未填寫') 
from 學生

