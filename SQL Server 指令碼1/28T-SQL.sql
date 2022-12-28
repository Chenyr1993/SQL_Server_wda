--系統變數(系統內建變數)

--計算某學生選了幾門課
--方法一
declare @n int
select @n=count(*)
from 班級 
where 學號='S002'
print '您共選了'+cast(@n as varchar)+'門課'
--方法二 @@rowcount

select *
from 班級 
where 學號='S001'

print '您共選了'+cast(@@rowcount as varchar)+'門課'

--在@@rowcount新增條件
--你寫了一段程式
select * from 學生

--這裡有第二段程式,但是這段程式必須要第一段程式有資料才能再執行
if @@ROWCOUNT>0
begin
	
	select * from 班級
end


--例外處理Error handle(try 裡放有可能發生例外的語法，但為了不讓使用者看到系統的錯誤訊息，而是顯示catch設定內容)
--語法沒錯但無法得出結果→例外

print 100/0

begin try 
print 100/0
end try
begin catch 
--print @@error
--print error_message()
--撰寫自定義錯誤訊息
print '伺服器忙線中......'
end catch
go 

--針對不同錯誤代碼制定錯誤訊息
begin try
	print 100/0
end try
begin catch

		if @@ERROR=8134
			print '您真愛開玩笑啊'
		else if @@ERROR=807
			print '哩麥亂啊啦!!'
		else
		    print '伺服器忙碌中....'

end catch