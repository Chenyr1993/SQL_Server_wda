--流程控制
--case(switch)

--簡單 case end
--when的後面只能放一個條件(=)
select 姓名,

case when 性別='男' then '先生'
     when 性別='女' then '小姐'
	 else 'N/A'
end　as 稱謂

from 學生


--搜尋case
declare @gender nvarchar(1),@result nvarchar(6) 
set @gender='0'

set @result =
case when @gender='1' then '先生'
	 when @gender='0' then '小姐' 
	else 'N/A'
end
print @result
go --表示批次執行，可釋放變數後面可再取同名


--以case改寫if/else範例
declare @height int,@result nvarchar(6)
set @height=150
set @result=
case when @height>=120
	 then '全票'
	 when @height>=90
	 then '半票'
	 else '免費'
end
print @result
--T-Sql沒有分行概念