--��2155���q���T
select *
from OrderDetails

--��830���q��
select *
from Orders

--77���ӫ~
select*
from Products

--�s�W�p�p
select*, UnitPrice*Quantity*(1-Discount) as �p�p
from OrderDetails

--�d�ߦP�@���q�椺���X�ذӫ~
select OrderID,count(*) 
from OrderDetails
group by OrderID

--�C�ذӫ~�Q�R�L�X��
select ProductID,count(*)
from OrderDetails
group by(ProductID)

--��X�̼����ӫ~
select ProductID,count(*) as �Q�R����
from OrderDetails
group by(ProductID)
order by �Q�R���� desc

--��X�e10�W�����ӫ~(�n��order by�~�i�Hwith ties))
select top 10 with ties ProductID,count(*) as �Q�R����
from OrderDetails
group by(ProductID)
order by �Q�R���� desc

--�έp�C�@�ذӫ~����~�B�A�û���Ƨ�
select ProductID,sum(UnitPrice*Quantity*(1-Discount))as ��~�B
from OrderDetails
group by ProductID
order by ��~�B desc

select ProductID,sum(UnitPrice*Quantity*(1-Discount))as ��~�B,count(*) as �ʶR����
from OrderDetails
group by ProductID
order by ��~�B desc

--�p��q���`���B
select OrderID,ROUND(sum(UnitPrice*Quantity*(1-Discount)),0) as �q���`���B
from OrderDetails
group by OrderID

--���X�w�s�q�C��w���q,�B�|���q�f�����ӫ~
select*
from Products
where UnitsInStock<=ReorderLevel and Discontinued=0 and UnitsOnOrder=0 
