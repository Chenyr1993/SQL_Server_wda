--after trigger
--新增商業邏輯驗證

--每位學生最多只能選5門課，若超過5門，欲加選時無法存入資料庫
alter trigger checkOrderCourse on 班級
after insert
as
begin
--選課數
	declare @num int
	select @num=count(*)
	from 班級
	where 學號=(select 學號 from inserted)
	--如果有=會多加一筆
	if @num>5 --表示該生已選滿5門課
		begin
		print '您已選滿5門課，如欲加選請先退選後再加選'
		rollback --資料回復，不存入資料庫
		end
	end
	go
---
select * from 班級 
select * from 課程
select * from 班級 where 學號='S002'
insert into 班級
values ('I003','S002','CS213','1900-01-01 09:00','622-G')

--修改學分，不可低於原學分數
create trigger checkCredit on 課程
after update
as 
begin
	declare @old int, @new int
	select @new=學分
	from inserted
	select @old=學分
	from deleted
	
	if @new <@old --表示學分數低於原學分
		begin
		print '學分數不可低於原學分數'
		rollback --資料回復，不存入資料庫
	end
end

--測試
select * from 課程

update 課程
set 學分=1
where 課程編號='CS998'

--
select * from 學生
select * from 員工
--若刪除員工資料時，該員工也是學生，不可刪除

create trigger checkEmployeeIsStudent on 員工
after delete
as
begin
if  exists (select * from 學生 where 姓名=(select 姓名 from deleted))
begin
print'本筆資料同時為學生資料，不可刪除'
rollback
end
end

--測試
delete from 員工
where 身份證字號='F332213046'
