create database Project_V3
use Project_V3
go
--權限
create table Auth(
SN INT IDENTITY(1,1) primary key,
AuthName nvarchar(10) not null
)
go
--使用者
create table Users(
SN INT IDENTITY(1,1) primary key,
Account nvarchar(50) not null,
Password nvarchar(max) not null,
CreatedDate Datetime default getdate(),
AuthSN int not null,
Enabled bit not null,

foreign key (AuthSN) references Auth(SN) on delete no action on update cascade
)
go
--會員
create table Members(
SN INT IDENTITY(1,1) primary key,
UserSN int not null,
Name nvarchar(30) not null,
Phone nvarchar(13) not null,
Email nvarchar(100) not null,
Address nvarchar(50) not null

foreign key (UserSN) references Users(SN) on delete no action on update no action
)
go
--管理員
create table Admin(
SN INT IDENTITY(1,1) primary key,
UserSN int not null,
Name nvarchar(30) not null,
Title nvarchar(20) not null,
Phone nvarchar(13) not null,
Extension nvarchar(10),
Email nvarchar(100) not null,

foreign key (UserSN) references Users(SN) on delete no action on update no action
)
go
--管理事件類型
create table ProblemType(
SN INT IDENTITY(1,1) primary key,
Type nvarchar(30) not null
)
go
--管理清單
create table Manage(
SN INT IDENTITY(1,1) primary key,
TypeSN int not null,
Details nvarchar(150),
CreatedDate Datetime default getdate(),
DealDate DateTime,
AdminSN int,
MemberSN int not null,

foreign key(MemberSN) references Members (SN) on delete no action on update no action,
foreign key(AdminSN) references Admin (SN) on delete no action on update cascade,
foreign key(TypeSN) references ProblemType (SN) on delete no action on update no action

)
go
--商店
create table Stores(
SN INT IDENTITY(1,1) primary key,
AdminSN int not null,
MemberSN int,
Name nvarchar(100) not null,
Phone nvarchar(13) not null,
Address nvarchar(50) not null,
Description nvarchar(200),
CreatedDate Datetime default getdate(),
Status nvarchar(30) not null

foreign key(AdminSN) references Admin (SN) on delete no action on update no action,
foreign key(MemberSN) references Members (SN) on delete no action on update cascade

)
go
--評論
create table Comments
(
SN INT IDENTITY(1,1) primary key,
Comment nvarchar(200) not null,
CreatedDate Datetime default getdate(),
MemberSN int not null,
StoreSN int not null

foreign key(MemberSN) references Members(SN)on delete no action on update no action,
foreign key(StoreSN) references Stores(SN)on delete no action on update no action
)
go
--種類
create table Category
(
SN INT IDENTITY(1,1) primary key,
CategoryName nvarchar(10) not null
)
go
--商品
create table Products(
SN INT IDENTITY(1,1) primary key,
ProductName nvarchar(100) not null,
Stock int not null,
Unit nvarchar(4) not null,
UnitPrice money not null,
Discontinued bit,
Photo image,
PhotoType nvarchar(10),
CreatedDate Datetime default getdate(),
CategorySN int not null,
StoreSN int not null,

Foreign Key (CategorySN) references Category (SN) on delete no action on update cascade,
Foreign Key (StoreSN) references Stores(SN) on delete cascade on update cascade
)
go

--付款方式
create table PayType
(
SN INT IDENTITY(1,1) primary key,
Method nvarchar(10) not null
)
go
--取貨方式
create table Delivery
(
SN INT IDENTITY(1,1) primary key,
Method nvarchar(10) not null
)
go


--團購
create table GroupBuying
(
ID nvarchar(13) primary key,
StoreSN int not null,
CreatedDate Datetime default getdate(),
Startdate DateTime not null,
CreatedPerson int not null,
Title nvarchar(50) not null,
Description nvarchar(200),
RequireDate DateTime not null,
CloseDate DateTime not null,
ShipAddress nvarchar(50) not null,
DeliverySN int not null,
LimitMoney money,
LimitNumber int,
Continued bit not null,
PaySN int not null,

foreign key(PaySN) references PayType(SN)on delete no action on update cascade,
foreign key(StoreSN) references Stores(SN)on delete no action on update no action,
foreign key(CreatedPerson) references Members(SN) on delete no action on update no action,
foreign key(DeliverySN) references Delivery(SN) on delete cascade on update cascade

)
go
--訂單
create table Orders
(
ID nvarchar(13) primary key,
CreatedDate Datetime default getdate(),
PaySN int not null,
Payed bit not null,
CustomerSN int not null,
GroupBuyingID nvarchar(13) not null,

foreign key(PaySN) references PayType(SN)on delete no action on update cascade,
foreign key(GroupBuyingID) references GroupBuying(ID)on delete no action on update no action,
foreign key(CustomerSN) references Members(SN)on delete no action on update cascade

)
go
--訂單明細
create table Orderdetails
(
SN INT IDENTITY(1,1) primary key,
OrderID nvarchar(13) not null,
ProductSN int not null,
Quanity int not null,
UnitPrice money not null,
Discount int,


foreign key(OrderID) references Orders(ID)on delete no action on update no action,
foreign key(ProductSN) references Products(SN)on delete cascade on update cascade

)
go


ALTER TABLE Orderdetails ADD Subtotal AS (UnitPrice * Quanity * (1-Discount));
GO


