--流程控制
--if/else
--以 begin,end 取代{}

declare @test nvarchar(5)='Hello'

if @test='hELlo'
begin
	print '成立'
end
else
	print '不成立'

--搜尋式 else if

declare @height int 
set @height=150

if @height>=120
print '全票'
else if @height>=90
print '半票'
else
print '免費'