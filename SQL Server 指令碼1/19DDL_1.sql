--SQL
--DML

--新增資料庫 create 物件型態 命名物件
--新增資料庫
create database dbTest
go

--切換資料庫位置
use dbTest
go

-- go 表示批次執行
--建立school資料庫並在裡面建立資料表
create database school
go

use school
go

-- table 資料表
--char固定長度(效能佳)，varchar(不固定長度)，nchar/nvarchar(所有符號制定為1碼)
--primary key 本來就不為空值，其他欄位若要限定必填欄位要寫not null
--bit只佔1/8，2種選擇
--年齡使用計算欄位每年就會自動更動
--數字 bigint (長數字64位元)
create table Students(
	StudId nchar(4) primary key,
	StuName nvarchar(30) not null,
	StuGender bit not null,
	StuTel nvarchar(20),
	StuBirthday datetime not null,
	StuAge as datediff(year,StuBirthday,getdate()) --計算欄位用as
)
go
create table Courses(
CId nchar(5) primary key,
CName nvarchar(30) not null,
CCredit int not null
)
go

create table Employees(
ID nchar(10) primary key,
EmpName nvarchar(30) not null,
City nvarchar(5) not null,
Street nvarchar(50) not null,
EmpTel nvarchar(20) not null,
EmpSalary money default 28000,--有預設值欄位
Insurance money not null,
tax as EmpSalary*0.05,--計算欄位

)
go
create table Professors(
ProfessorID nchar(4) primary key,
Jobtitle nvarchar(10) not null,
Department nvarchar(10) not null,
ID nchar(10) not null
)
go
--修改course credit 資料型態
alter table courses 
alter column CCredit tinyint
go
