select 100

select '100'

select 100 as score
--選取特定欄位
select 姓名,性別,電話
from 學生

--取別名
select 姓名 as [name],性別 as gender, 電話 as tel
from 學生

--數值運算
select 姓名,薪水,保險,扣稅, 薪水-保險-扣稅 as 淨所得
from 員工

--日期時間運算
select 姓名,生日,DATEDIFF(YEAR,生日,getdate())as 年齡
from 學生