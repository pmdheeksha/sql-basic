--Find the total sales across all oredrs
--And the total sales for each product
--Additionally provide details such order Id,order date
SELECT
OrderID,
OrderDate,
Sales,
SUM(Sales) OVER() TotalSales
FROM Sales.Orders 

SELECT
	OrderID,
	OrderDate,
	Sales,
	ProductID,
	SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) SalesByProduct
FROM Sales.Orders 

 --Find the percentage contribution of each products sales to the total sales
SELECT
OrderID,
ProductID,
Sales,
SUM(Sales) OVER() TotalSales,
ROUND(CAST(Sales AS FLOAT)/SUM(Sales) OVER()*100,2) AS Percentageoftotal
FROM Sales.Orders 