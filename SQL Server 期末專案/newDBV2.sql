create database Project_V2
go

use Project_V2


--狀態資料表
Create table Status
(
StatusID int IDENTITY(1,1) primary key,
StatausStatement nvarchar(20) not null
)
--身分資料表
Create table Identify
(
IdSN int IDENTITY(1,1) primary key,
IdName nvarchar(30) not null
)

--會員資料表
create table Members(
MemberID nvarchar(12) primary key,
MemberName nvarchar(30) not null,
Gender bit not null,
Birthday DateTime not null,
Phone nvarchar(13) not null,
Email nvarchar(100) not null,
HomeAddress nvarchar(50),
WorkAddress nvarchar(50),
CurrentAddress nvarchar(50),
JoinDate DateTime not null,
StatusID int not null,
Account nvarchar(10) not null,
Password nvarchar(max) not null,
IdentifySN int not null

foreign key (StatusID) references Status (StatusID) on delete no action on update cascade, 
foreign key (IdentifySN) references Identify (IdSN) on delete no action on update cascade  

)
go

--管理員資料表
create table Administrators(
SN int IDENTITY(1,1)primary key,
AdminCode nvarchar(12)not null, 
Title nvarchar(20) not null,
Phone nvarchar(13)not null,
Extension nvarchar(10)not null,

foreign key (AdminCode) references Members (MemberID) on delete no action on update cascade, 
)
go
--事件類型
create table ProblemType(
SN int IDENTITY(1,1)primary key,
Type nvarchar(10) not null
)
go

--管理明細表
create table Manage(
SN int  primary key,
MangeCode nvarchar(12)not null,
Type nvarchar(10) not null,
Details nvarchar(150) not null,
CreateDate DateTime not null,
DealDate DateTime,
AdminCode nvarchar(12),
MemberID nvarchar(12) not null,
foreign key(MemberID) references Members (MemberID) on delete no action on update cascade,
foreign key(AdminCode) references Members (MemberID) on delete no action on update cascade
)
go


--店家資料表
create table Stores(
SN int IDENTITY(1,1)Primary Key,
MemberID nvarchar(12)not null,
StoreName nvarchar(100) not null,
Phone nvarchar(10) not null,
Address nvarchar(50) not null,
Description nvarchar(200),
CreatedDate DateTime not null,
StatusID int not null,

foreign key(MemberID)references Members(MemberID) on delete no action on update cascade,
foreign key(StatusID) references Status (StatusID) on delete no action on update cascade,
)
go
--評論資料表
create table Comments
(
CommentsID navrchar(12) Primary Key,
Comment nvarchar(200) not null,
CreatedTime DateTime,
MemberID nvarchar(5) not null,
StoreID nvarchar(5) not null,

foreign key(MemberID) references Members(MemberID)on delete no action on update no action,
foreign key(StoreID) references Stores(StoreID)on delete no action on update no action
)
go

--種類資料表
create table Categories
(
CategoryID int IDENTITY(1,1) Primary Key,
CategoryName nvarchar(10) not null
)
go

--商品資料表
create table Products(

ProductID nvarchar(5) Primary Key,
ProductName nvarchar(100) not null,
CategoryID nvarchar (4) not null,
StoreID nvarchar(5) not null,
Unit nvarchar(4) not null,
UnitPrice money not null,
Stock int not null,
Discontinuted bit,
Photo image,
PhotoType nvarchar(10),
CreatedDate DateTime not null,
Foreign Key (CategoryID) references Categories (CategoryID) on delete cascade on update cascade,
Foreign Key (StoreID) references Stores(StoreID) on delete no action on update cascade
)
go


--付款方式
create table PayType
(
PayID int IDENTITY(1,1) Primary Key,
PayMethod nvarchar(10) not null
)
go

--取貨方式
create table Delivery
(
DeliveryID int IDENTITY(1,1) Primary Key,
DeliveryMethod nvarchar(10) not null
)
go

--團購事件
create table OrderEvents
(
EventID nvarchar(13) Primary Key,
StoreID nvarchar(5) not null,
CreatedDate DateTime not null,
Startdate DateTime not null,
MemberID nvarchar(5) not null,
Title nvarchar(100) not null,
Description nvarchar(200),
RequireDate DateTime not null,
CloseDate DateTime not null,
ShipAddress nvarchar(50) not null,
DeliveryID char(2) not null,
LimitMoney money,
LimitNumber int,
PayID char(2) not null,
foreign key(PayID) references PayType(PayID)on delete no action on update no action,
foreign key(StoreID) references Stores(StoreID)on delete no action on update no action,
foreign key(MemberID) references Members(MemberID) on delete no action on update no action,
foreign key(DeliveryID) references Delivery(DeliveryID) on delete no action on update no action

)
go
--訂單
create table Orders
(
OrderID nvarchar(12) Primary Key,
EventID nvarchar(13) not null,
CreatedDate DateTime not null,
CustomerID nvarchar(5) not null,
PayType char(2) not null,
Payed bit,
foreign key(PayType) references PayType(PayID)on delete no action on update no action,
foreign key(EventID) references OrderEvents(EventID)on delete no action on update no action

)
go
--訂單明細
create table Orderdetails
(
OrderID nvarchar(12) not null,
ProductID nvarchar(5) not null,
Quanity int,
UnitPrice money,
Discount int,
Subtotal As (UnitPrice * Quanity * (1-Discount)),
primary key(OrderID,ProductID),
foreign key(OrderID) references Orders(OrderID)on delete no action on update no action,
foreign key(ProductID) references Products(ProductID) on delete no action on update no action

)
go


--店家清單


