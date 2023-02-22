
use Project

create table Visitors(
VisitorID nvarchar(5) primary key,
VisitorName nvarchar(30) not null,
Phone nvarchar(13) not null,
CreatedTime DateTime 
)
go


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
Status nvarchar(10) not null,
Account nvarchar(10) not null,
Password nvarchar(max) not null
)
go

create table Administrators(
AdminID nvarchar(5) primary key,
Name nvarchar(30) not null,
CreateTime DateTime,
Account nvarchar(10) not null,
Password nvarchar(max) not null
)
go

alter table Administrators
add Phone nvarchar(13) not null,
Extension nvarchar(13) not null
go 

create table Manage(
ID int primary key,
Type nvarchar(10),
Problem nvarchar(150),
CreateDate DateTime,
DealDate DateTime,
AdminID nvarchar(5),
MemberID nvarchar(5)
foreign key(MemberID) references Members (MemberID) on delete no action on update cascade,
foreign key(AdminID) references Administrators (AdminID) on delete no action on update cascade
)
go



create table Categories
(
CategoryID nvarchar(4) Primary Key,
CategoryName nvarchar(10) not null
)
go

create table Products(
ProductID nvarchar(5) Primary Key,
ProductName nvarchar(100) not null,
CategoryID nvarchar (4) not null,
StoreID nvarchar(5) not null,
Unit nvarchar(4) not null,
UnitPrice money,
Stock int not null,
Discontinuted bit,
Photo image,
PhotoType nvarchar(10),
CreatedDate DateTime,
Foreign Key (CategoryID) references Categories (CategoryID) on delete cascade on update cascade,
Foreign Key (StoreID) references Stores(StoreID) on delete no action on update cascade
)
go


create table PayType
(
PayID char(2) Primary Key,
PayMethod nvarchar(10) not null
)
go

create table Delivery
(
DeliveryID char(2) Primary Key,
DeliveryMethod nvarchar(10) not null
)
go

create table Comments
(
CommentsID nvarchar(12) Primary Key,
Comment nvarchar(200) not null,
CreatedTime DateTime,
MemberID nvarchar(5) not null,
StoreID nvarchar(5) not null

foreign key(MemberID) references Members(MemberID)on delete no action on update cascade,
foreign key(StoreID) references Stores(StoreID)on delete no action on update cascade
)
go


create table OrderEvents
(
EventID nvarchar(13) Primary Key,
StoreID nvarchar(5) not null,
CreatedDate DateTime not null,
Startdate DateTime not null,
CreatedPerson nvarchar(5) not null,
Title nvarchar(100) not null,
Description nvarchar(200),
RequireDate DateTime not null,
CloseDate DateTime not null,
ShipAddress nvarchar(50) not null,
DeliveryID char(2) not null,
LimitMoney money,
LimitNumber int,
PayType char(2) not null,

foreign key(PayType) references PayType(PayID)on delete cascade on update cascade,
foreign key(StoreID) references Stores(StoreID)on delete no action on update cascade,
foreign key(CreatedPerson) references Members(MemberID) on delete cascade on update cascade,
foreign key(DeliveryID) references Delivery(DeliveryID) on delete cascade on update cascade

)
go
--
create table Orders
(
OrderID nvarchar(12) Primary Key,
EventID nvarchar(13) not null,
CreatedDate DateTime not null,
CustomerID nvarchar(5) not null,
PayType char(2) not null,
Payed bit,

foreign key(PayType) references PayType(PayID)on delete no action on update cascade,
foreign key(EventID) references OrderEvents(EventID)on delete no action on update no action

)
go
create table Orderdetails
(
OrderID nvarchar(12) not null,
ProductID nvarchar(5) not null,
Quanity int,
UnitPrice money,
Discount int,
primary key(OrderID,ProductID),
foreign key(OrderID) references Orders(OrderID)on delete cascade on update cascade,
foreign key(ProductID) references Products(ProductID)on delete cascade on update cascade

)
go
alter Table Orderdetails
add Subtotal money not null

alter Table OrderEvents
add Total money not null

ALTER TABLE Orderdetails DROP COLUMN Subtotal;
GO
ALTER TABLE Orderdetails ADD Subtotal AS (UnitPrice * Quanity * (1-Discount));
GO
ALTER TABLE OrderEvents DROP COLUMN Total;
GO
ALTER TABLE Stores DROP COLUMN CountyCode
ALTER TABLE Stores ADD CountyCode nvarchar(3) not null
ALTER TABLE Stores add foreign key (CountyCode) references County(CountyCode) on delete no action on update no action 
GO

EXEC sp_rename 'Members.Status','StatusID'
EXEC sp_rename 'Stores.Status','StatusID'
---
Create table Status
(
StatusID nvarchar(3) primary key,
StatausStatement nvarchar(20) not null
)

create table Area
(
AreaCode nvarchar(3) Primary Key,
AreaName nvarchar(20) not null

)


create table County(
CountyCode char(2) Primary Key,
CountyName nvarchar(10) not null
)
go
create table Stores(
StoreID nvarchar(5) Primary Key,
StoreName nvarchar(100) not null,
ContactTel nvarchar(10) not null,
CountyCode char(2) not null,
AreaCode nvarchar(3) not null,
Address nvarchar(50) not null,
Description nvarchar(200),
CreatedDate DateTime not null,
StatusID nvarchar(3) not null,
Account nvarchar(20),
Password nvarchar(max)
)
go