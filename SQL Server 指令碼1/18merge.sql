--merge
--看條件決定要新增、修改或刪除
--比對客戶資料表與新客戶資料表
--若以存在的客戶修改其資料，若屬於新客戶則新增資料
merge 客戶 as c
using 新客戶 as nc
on c.客戶編號=nc.客戶編號
when matched then
update set 姓名=nc.姓名,電話=nc.電話
when not matched then
insert (客戶編號,姓名,電話) values(nc.客戶編號,nc.姓名,nc.電話)
;
--若原業績目標>=250，刪除客戶的業績目標資料
--若原業績目標<250，將客戶的業績目標+25
--尚未有業績目標，將客戶的業績目標資料設定為100
--順序刪除>修改>新增

merge 客戶業績 as cs
using 客戶 as c
on cs.客戶編號=c.客戶編號
when matched and cs.業績目標>=250 then
delete 
--上面篩選完>=250，剩下的就會是<250
when matched then
update set 業績目標=cs.業績目標+25
when not matched then
insert (客戶編號,業績目標)values(c.客戶編號,100);