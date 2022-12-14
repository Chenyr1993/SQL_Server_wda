
use Project
create table Member(
MID nvarchar(10) not null primary key,
MName nvarchar(30) not null,
MBday datetime,
MMail nvarchar not null
)
go
create table M_Tel(
MTelId char(2) not null primary key,
MainTel nchar(10) not null,
Tel_2 nchar(10)
)
go
create table M_Address(
MAdressId char(3) not null primary key,
Home nvarchar(100) not null,
WorkPlace nvarchar(100),
)
go

alter table Member
 add MTelId char(2) not null,MAdressId char(3) not null
 go

 alter table Member
 add foreign key (MTelId) references M_Tel (MTelId) on delete cascade on update cascade
 go
 
 alter table Member
 add foreign key (MAdressId)references M_Address(MAdressId)on delete cascade on update cascade
 go
exec sp_rename 'Project.Member.MAdressId','MAddressId'
 go