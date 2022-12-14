--drop
create table test(
	ID nvarchar(10) primary key,
	name nvarchar(30) not null
)
drop table test

--如果物件之間有不可刪除關聯，要使用alter刪除兩資料表的關聯才可以繼續刪除