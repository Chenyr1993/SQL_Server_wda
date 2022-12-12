--contraints�������
--primary key Constraints

--���h�Ū�primary key
--orderID nchar(8) primary key

--��ƪ�h�Ū�primary key
--�b����ӥD�䪺��ƪ�A��
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

--���ޡG�����Y�p��u���@��

--unique constraint
--�����A��ܸ�Ƥ��e���i���ơA���D�D��
--�u�n�w�q��unique�N�|�Q�����ޡA�]��unique�]�O�ߤ@�ȡA���i�H���\null
create table Customers (
customerID nchar(5) primary key,
customerName nvarchar(30) not null,
Account nvarchar(20) not null unique,
Password nvarchar(20) not null
)
go

--check constraint
--�۩w�q���������
create table ProductType(
ProductTypeID nchar(2) primary key,
ProductTypeName nvarchar(50) not null,
ProductTypeValue int not null constraint CK_ProductTypeMoreThanZero check(ProductTypeValue>=0)     --�n��@��>=0����
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
foreign key(StudId)references Students(StudId) on delete no action on update no action,--�j���Ѧҧ����(���i�R���έק�)
foreign key(CId)references Courses(CId) on delete cascade on update cascade,--�j���Ѧҧ����(��R���έק�A�s�ʽվ��L���)
foreign key(ProfessorID)references Professors(ProfessorID) on delete no action on update cascade--�j���Ѧҧ����(���i�R���A���i�s�ʭק�)
)
go

