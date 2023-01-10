--Trigger 觸發程序
--與預存程序一樣預先寫好程式，並設定時機自己被觸發執行,無法呼叫
--trigger是在commit前執行


select * from 客戶

insert into 客戶
values('C999','王小明','07-4536456')

update 客戶
set 姓名='aaa',電話='bbb'
output inserted.客戶編號,inserted.姓名 as NewName,inserted.電話,deleted.姓名,deleted.電話
where 客戶編號='C010'

--創造trigger物件：看資料表被修改後的資料呈現
--create trigger trigger名稱自訂
create trigger showCustomerData on 客戶
after update
as
begin

select inserted.客戶編號,inserted.姓名 as NewName,inserted.電話 as NewTel 
from inserted
select deleted.客戶編號, deleted.姓名 as OldName,deleted.電話 as OldTel
from deleted

end

Update 客戶
set 姓名='王明明',電話='08-5645321'
where 客戶編號='C999'
--因為trigger是寫在update，所以執行insert時不會觸發

insert into 客戶
Values('C998','喜羊羊','02-2222333')

------製作insert trigger
select * from 課程
create trigger showCourse on 課程
after insert
as
begin
--因為通常新增資料只會出現一資料行受影響，看不到結果
select *
from 課程

end

insert into 課程
values('CS998','123123','1')