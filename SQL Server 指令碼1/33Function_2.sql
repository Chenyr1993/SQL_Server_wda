--資料表值函數
create function fnGetStudentCourse()
returns table
--可以把select出來的表放在return
return(
SELECT          學生.學號, 學生.姓名, 課程.名稱, 課程.學分, 教授.教授編號, 員工.姓名 AS 教授姓名
FROM              班級 INNER JOIN
                            教授 ON 班級.教授編號 = 教授.教授編號 INNER JOIN
                            課程 ON 班級.課程編號 = 課程.課程編號 INNER JOIN
                            學生 ON 班級.學號 = 學生.學號 INNER JOIN
                            員工 ON 教授.身份證字號 = 員工.身份證字號
							)
--執行函數
select * from dbo.fnGetStudentCourse()

--查詢某位學生的選課資料
create function fnGetStudentCourseResult(@id char(4))
returns table
--可以把select出來的表放在return
return(
SELECT          學生.學號, 學生.姓名, 課程.名稱, 課程.學分, 教授.教授編號, 員工.姓名 AS 教授姓名
FROM              班級 INNER JOIN
                            教授 ON 班級.教授編號 = 教授.教授編號 INNER JOIN
                            課程 ON 班級.課程編號 = 課程.課程編號 INNER JOIN
                            學生 ON 班級.學號 = 學生.學號 INNER JOIN
                            員工 ON 教授.身份證字號 = 員工.身份證字號
							where 學生.學號=@id
							)
--執行函數
select * from dbo.fnGetStudentCourseResult('S002')