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