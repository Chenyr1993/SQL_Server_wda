use aaa
go
create table¡@tryId(
Id int IDENTITY(1,1)¡@primary key,
name nvarchar(2) not null
)
insert into tryId(name) values('aa')
insert into tryId(name) values('bb')

create table¡@tryId1(
Id int IDENTITY(1,1)¡@primary key,
name nvarchar(2) not null
)
insert into tryId1(name) values('aa')
insert into tryId1(name) values('bb')