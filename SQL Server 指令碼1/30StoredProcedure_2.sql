--預存程序篩選資料表
--exec(可以放入字串執行select)
exec('select * from 教授')
go

create Proc querytable_2
@tableName nvarchar(100)
as
begin
exec('select * from '+ @tableName)
end

exec querytable_2 '教授'
