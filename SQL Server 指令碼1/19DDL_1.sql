--SQL
--DML

--�s�W��Ʈw create ���󫬺A �R�W����
--�s�W��Ʈw
create database dbTest
go

--������Ʈw��m
use dbTest
go

-- go ��ܧ妸����
--�إ�school��Ʈw�æb�̭��إ߸�ƪ�
create database school
go

use school
go

-- table ��ƪ�
--char�T�w����(�į��)�Avarchar(���T�w����)�Anchar/nvarchar(�Ҧ��Ÿ���w��1�X)
--primary key ���ӴN�����ŭȡA��L���Y�n���w�������n�gnot null
--bit�u��1/8�A2�ؿ��
--�~�֨ϥέp�����C�~�N�|�۰ʧ��
--�Ʀr bigint (���Ʀr64�줸)
create table Students(
	StudId nchar(4) primary key,
	StuName nvarchar(30) not null,
	StuGender bit not null,
	StuTel nvarchar(20),
	StuBirthday datetime not null,
	StuAge as datediff(year,StuBirthday,getdate()) --�p������as
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
EmpSalary money default 28000,--���w�]�����
Insurance money not null,
tax as EmpSalary*0.05,--�p�����

)
go
create table Professors(
ProfessorID nchar(4) primary key,
Jobtitle nvarchar(10) not null,
Department nvarchar(10) not null,
ID nchar(10) not null
)
go
--�ק�course credit ��ƫ��A
alter table courses 
alter column CCredit tinyint
go
