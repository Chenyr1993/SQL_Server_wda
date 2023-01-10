--Instead Trigger
--把原來的操作取代掉

--當我要新增課程,若新增時發現該課程已存在,我就改以「修改課程資料」取代原來的新增動作

--after trigger
--instead trigger

create trigger add_Course on 課程
instead of insert
as 
	begin
--檢查新增的課程是否已經存在(PK是否重複)
	if exists(select * from 課程 where 課程編號=(select 課程編號 from inserted))
		begin
	--p.k重複 ，把insert取代為update
		update 課程
		set 名稱=inserted.名稱,學分=inserted.學分
	--不能使用一般update的寫法
	--where 課程編號=inserted.課程編號
		from 課程 inner join inserted on 課程.課程編號=inserted.課程編號
		end
	else--要記得寫
		begin
		--仍然要執行insert
			insert into 課程
			select * from inserted
		end
	end

	--驗證
	insert into 課程
	values('CS888','bbb','2')
	select * from 課程
	--完成Instaed trigger後，當發生PK重複，內容會從insert改為update已存在資料
	
	--update trigger可以寫很多個，Instead trigger每個資料表只能寫一個
