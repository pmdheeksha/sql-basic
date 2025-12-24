--Rank the orders based on their sales from highest to lowest(ROW_NUMBER)
SELECT
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) AS SalesRank
FROM Sales.Orders

SELECT
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales ASC) AS SalesRank
FROM Sales.Orders 

--using rank()
SELECT
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) AS SalesRank_Row,
	RANK() OVER(ORDER BY Sales DESC) AS SalesRank_Rank
FROM Sales.Orders

--DENSE_RANK
SELECT
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) AS SalesRank_Row,
	RANK() OVER(ORDER BY Sales DESC) AS SalesRank_Rank,
	DENSE_RANK() OVER(ORDER BY Sales DESC) AS SalesRank_Dense
FROM Sales.Orders

--Find the top highest sales for each product
SELECT
OrderID,
ProductID,Sales,
ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) AS RankbyProductID
FROM Sales.Orders 


SELECT*
FROM(
SELECT
OrderID,
ProductID,Sales,
ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) AS RankbyProductID
FROM Sales.Orders
) t WHERE RankbyProductID=1

--Find the lowest 2 customers based on their total sales
SELECT*
FROM(
	SELECT
	CustomerID,
	SUM(Sales) AS TotalSales,
	ROW_NUMBER() OVER(ORDER BY SUM(Sales) ASC) RankCustomers
FROM sales.Orders
GROUP BY CustomerID
)t WHERE RankCustomers<3