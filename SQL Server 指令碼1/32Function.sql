--函數(function) 自訂函數
--純量值函數(函式)：通常會回傳值   
--輸入員工身份證字號查詢薪水
create function fnGetSalary(@id char(10))
returns money
begin
declare @salary money
select @salary=薪水
from 員工
where 身份證字號=@id

if @salary is null
return 0

return @salary

end
go
--查出A123456789的薪資
select dbo.fnGetSalary('A123456789')

--針對查詢結果做動作
--宣告 @變數 型態
declare @Salary money
--如果
set @Salary=dbo.fnGetSalary('A123456789')

if @Salary=0
print '查無此人'
else
print '薪資為'+cast(@salary as varchar)