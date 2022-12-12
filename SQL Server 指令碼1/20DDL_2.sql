--contraints條件約束
--primary key Constraints

--欄位層級的primary key
--orderID nchar(8) primary key

--資料表層級的primary key
--在有兩個主鍵的資料表適用
--primary key(orderID)

Create table Oders(
orderID nchar(8),
ordreDate datetime default getdate(),--Default constraint
customerID nchar(5) not null,
primary key(orderID)
)
go
Create table Products(
ProductID nchar(8) primary key,
ProductName nvarchar(40) not null,
UnitPrice money not null
)
go

create table orderDetails(
orderID nchar(8),
ProductID nchar(8),
UnitPrice money not null,
Quanity int not null,
UnitTotal as UnitPrice*Quanity,
primary key(orderID,ProductID)
)
go

--索引：把資料縮小到只有一筆

--unique constraint
--交替鍵，表示資料內容不可重複，但非主鍵
--只要定義成unique就會被當成索引，因為unique也是唯一值，但可以允許null
create table Customers (
customerID nchar(5) primary key,
customerName nvarchar(30) not null,
Account nvarchar(20) not null unique,
Password nvarchar(20) not null
)
go

--check constraint
--自定義的條件約束
create table ProductType(
ProductTypeID nchar(2) primary key,
ProductTypeName nvarchar(50) not null,
ProductTypeValue int not null constraint CK_ProductTypeMoreThanZero check(ProductTypeValue>=0)     --要填一個>=0的值
)
go

--Foreign key constraint
create table classes(
StudId nchar(4),
CId nchar(5),
ProfessorID nchar(4),
ClassTime datetime not null,
Classroom nchar(5) not null,
primary key(StudId,CId,ProfessorID),
foreign key(StudId)references Students(StudId) on delete no action on update no action,--強迫參考完整性(不可刪除及修改)
foreign key(CId)references Courses(CId) on delete cascade on update cascade,--強迫參考完整性(當刪除或修改，連動調整其他欄位)
foreign key(ProfessorID)references Professors(ProfessorID) on delete no action on update cascade--強迫參考完整性(不可刪除，但可連動修改)
)
go

