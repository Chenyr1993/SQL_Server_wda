--預存程序 Stored Procedure
--意義：預先寫一段程式，有需要再呼叫，非常類似函數,可以在裡面寫迴圈...

--create Procedure(縮寫Proc) 命名
create Proc StudentCourseOrders
as
begin
	SELECT          學生.學號, 學生.姓名, 課程.名稱, 課程.學分, 班級.上課時間, 班級.教室, 員工.姓名 AS 老師
	FROM              員工 INNER JOIN
                            教授 ON 員工.身份證字號 = 教授.身份證字號 INNER JOIN
                            班級 ON 教授.教授編號 = 班級.教授編號 INNER JOIN
                            課程 ON 班級.課程編號 = 課程.課程編號 INNER JOIN
                            學生 ON 班級.學號 = 學生.學號
end
--測試使用預存程序
--execute(縮寫exec) 預存程序名
exec StudentCourseOrders
go
--學生選課數
create Proc StudentsCourse
as
begin
	SELECT          學生.學號, 學生.姓名,count(*) as 選課數,sum(課程.學分) as 總學分
	FROM              員工 INNER JOIN
                            教授 ON 員工.身份證字號 = 教授.身份證字號 INNER JOIN
                            班級 ON 教授.教授編號 = 班級.教授編號 INNER JOIN
                            課程 ON 班級.課程編號 = 課程.課程編號 INNER JOIN
                            學生 ON 班級.學號 = 學生.學號
							group by 學生.學號, 學生.姓名
end
--執行學生選課數
exec StudentsCourse
go
---------------------------------
--學生選課數(有參數的預存程序)
create Proc queryStudentsCourse
@name varchar(12)
as
begin
	SELECT          學生.學號, 學生.姓名,count(*) as 選課數,sum(課程.學分) as 總學分
	FROM              員工 INNER JOIN
                            教授 ON 員工.身份證字號 = 教授.身份證字號 INNER JOIN
                            班級 ON 教授.教授編號 = 班級.教授編號 INNER JOIN
                            課程 ON 班級.課程編號 = 課程.課程編號 INNER JOIN
                            學生 ON 班級.學號 = 學生.學號
							where 學生.姓名=@name
							group by 學生.學號, 學生.姓名
end
--執行篩學學生
exec queryStudentsCourse '令狐沖'
