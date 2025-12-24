--Rules
--window fn can be used only in SELECT and ORDER BY clause
SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus) TotalSales
FROM Sales.Orders
ORDER BY SUM(Sales) OVER (PARTITION BY OrderStatus) DESC

--NESTING window function is not allowed
SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(SUM(Sales) OVER (PARTITION BY OrderStatus))OVER (PARTITION BY OrderStatus) TotalSales
FROM Sales.Orders

--SQL excute WINDOW fn after WHERE clause
SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	ProductID,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus) TotalSales
FROM Sales.Orders
WHERE ProductID IN(101,102)

/*window function can be used together with 
GROUP BY in the same query ONLY if the same column are used*/
SELECT
	CustomerID,
	SUM(Sales) TotalSales,
	RANK() OVER(ORDER BY SUM(Sales) DESC) Rankcustomers
FROM Sales.Orders
GROUP BY CustomerID


