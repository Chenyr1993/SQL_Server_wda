--alter 修改資料表定義

--新增foreign key
alter table Professors
	add foreign key(ID) references Employees(ID) on delete no action on update no action	

--增加欄位
alter table Products
	add ProductTypeID nchar(2) not null
alter table Products
	add foreign key (ProductTypeID) references ProductType(ProductTypeID) on delete no action on update no action