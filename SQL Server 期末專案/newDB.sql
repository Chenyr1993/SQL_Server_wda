create database Project_V1
use Project_V1

--訪客資料表
create table Visitors(
VisitorID nvarchar(5) primary key,
VisitorName nvarchar(30) not null,
Phone nvarchar(13) not null,
CreatedTime DateTime 
)
go
--狀態資料表
Create table Status
(
StatusID nvarchar(3) primary key,
StatausStatement nvarchar(20) not null
)
--會員資料表
create table Members(
MemberID nvarchar(5) primary key,
MemberName nvarchar(30) not null,
Gender bit not null,
Birthday DateTime not null,
MainPhone nvarchar(13) not null,
Email nvarchar(100) not null,
HomeAddress nvarchar(50),
WorkAddress nvarchar(50),
CurrentAddress nvarchar(50),
JoinDate DateTime not null,
StatusID nvarchar(3) not null,
Account nvarchar(10) not null,
Password nvarchar(max) not null,
foreign key (StatusID) references Status (StatusID) on delete no action on update cascade  
)
go
--管理員資料表
create table Administrators(
AdminID nvarchar(5) primary key,
Name nvarchar(30) not null,
Phone nvarchar(13)not null,
Extension nvarchar(10)not null,
Account nvarchar(10) not null,
Password nvarchar(max) not null,
CreateDate DateTime
)
go
--管理明細表
create table Manage(
ID nvarchar(12) primary key,
Type nvarchar(10),
Problem nvarchar(150) not null,
CreateDate DateTime not null,
DealDate DateTime,
AdminID nvarchar(5),
MemberID nvarchar(5),
foreign key(MemberID) references Members (MemberID) on delete no action on update cascade,
foreign key(AdminID) references Administrators (AdminID) on delete no action on update cascade
)
go

--縣市資料表
create table County(
CountyID char(2) Primary Key,
CountyName nvarchar(5) not null
)
go

--區域資料表
create table Area
(
AreaID nvarchar(3) Primary Key,
AreaName nvarchar(10) not null,
CountyID char(2)not null,
foreign key(CountyID) references County (CountyID) on delete no action on update cascade
)

--店家資料表
create table Stores(
StoreID nvarchar(5) Primary Key,
StoreName nvarchar(100) not null,
ContactTel nvarchar(10) not null,
AreaID nvarchar(3) not null,
Address nvarchar(50) not null,
Description nvarchar(200),
CreatedDate DateTime not null,
StatusID nvarchar(3) not null,
Account nvarchar(20),
Password nvarchar(max),

foreign key(AreaID) references Area(AreaID) on delete no action on update cascade,
foreign key(StatusID) references Status (StatusID) on delete no action on update cascade,
)
go
--評論資料表
create table Comments
(
CommentsID nvarchar(12) Primary Key,
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
CategoryID nvarchar(4) Primary Key,
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
PayID char(2) Primary Key,
PayMethod nvarchar(10) not null
)
go

--取貨方式
create table Delivery
(
DeliveryID char(2) Primary Key,
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




