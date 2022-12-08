--有2155筆訂單資訊
select *
from OrderDetails

--有830筆訂單
select *
from Orders

--77項商品
select*
from Products

--新增小計
select*, UnitPrice*Quantity*(1-Discount) as 小計
from OrderDetails

--查詢同一筆訂單內有幾種商品
select OrderID,count(*) 
from OrderDetails
group by OrderID

--每種商品被買過幾次
select ProductID,count(*)
from OrderDetails
group by(ProductID)

--找出最熱門商品
select ProductID,count(*) as 被買次數
from OrderDetails
group by(ProductID)
order by 被買次數 desc

--找出前10名熱門商品(要有order by才可以with ties))
select top 10 with ties ProductID,count(*) as 被買次數
from OrderDetails
group by(ProductID)
order by 被買次數 desc

--統計每一種商品的營業額，並遞減排序
select ProductID,sum(UnitPrice*Quantity*(1-Discount))as 營業額
from OrderDetails
group by ProductID
order by 營業額 desc

select ProductID,sum(UnitPrice*Quantity*(1-Discount))as 營業額,count(*) as 購買次數
from OrderDetails
group by ProductID
order by 營業額 desc

--計算訂單總金額
select OrderID,ROUND(sum(UnitPrice*Quantity*(1-Discount)),0) as 訂單總金額
from OrderDetails
group by OrderID

--撈出庫存量低於安全量,且尚未訂貨的的商品
select*
from Products
where UnitsInStock<=ReorderLevel and Discontinued=0 and UnitsOnOrder=0 
