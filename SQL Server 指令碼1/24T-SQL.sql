--T-SQL

--印出執行結果（顯示在訊息）
print 'Hello World'

--執行結果變成表（顯示在結果）
select 'Hello World'

--變數
--1.純量變數 2.資料表變數

--純量變數

--宣告變數
declare @myName nvarchar(50)='Jack'
--輸出變數
print @myName
--轉存資料表
select @myName


declare @number int
--指定運算：set/select輸入變數
set @number=100
select @myName='Jack Lee'
print @number
print @myName

--資料型態轉換(cast簡單轉換/convert明確轉換)
declare @salary money=50000
print '您的薪水'+cast(@salary as varchar)

declare @birthday datetime='2022/12/19'
print '您的生日為'+convert(varchar,@birthday,120)


select　生日=@birthday
from 學生
where 學號='S002'
print '您的生日為'+convert(varchar,@birthday,120)

--資料表變數
--把資料表存進變數裡→把變數當一個資料表
declare @StuBirthday table(
name nvarchar(30),
birthday datetime
)
insert into @StuBirthday
values('任我行','2022-12-19')

insert into @StuBirthday
select 姓名,生日
from 學生

select * from @StuBirthday