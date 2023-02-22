--資料庫DDL的Trigger
create trigger readOnlyTable on database
for drop_table,alter_table
as
begin
rollback
end

--學生2跟其他資料表沒有關聯，所以可以透過triiger控制不被刪除
drop table 學生2

--先停用資料庫trigger
	disable trigger readOnlyTable on database

--才可以停用資料表的trigger
alter table 課程
	disable trigger showCourse
--啟用trigger
alter table 課程
	enable trigger showCourse
