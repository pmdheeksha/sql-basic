--Find the average sales across all orders
--And find the average sales for each product
--Additionally provide details such order Id,order date
SELECT
OrderID,
OrderDate,
Sales,
ProductID,
AVG(Sales) OVER() AS AvgSales
FROM Sales.Orders

SELECT
OrderID,
OrderDate,
Sales,
ProductID,
AVG(Sales) OVER() AS AvgSales,
AVG(Sales) OVER(PARTITION BY ProductID) AvgSalesProduct
FROM Sales.Orders

--Case use in the null
SELECT 
CustomerID,
LastName,
Score,
COALESCE(Score,0) CustomerScore,
AVG(Score) OVER() AvgScore,
AVG(COALESCE(Score,0)) OVER() AvgScoreWithoutnull
FROM Sales.customers

--Find all orders where sales are higher than the average saes across all orders
SELECT
*
FROM(
	SELECT
	OrderID,
	ProductID,
	Sales,
	AVG(Sales) OVER() AvgSales
	FROM Sales.Orders
)t WHERE sales>AvgSales