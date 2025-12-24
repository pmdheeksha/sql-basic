--COUNT
--Find the total number of orders
--Additionally provide details such order Id,order date
SELECT
	OrderID,
	OrderDate,
	COUNT(*) OVER() TotalOrders
FROM Sales.Orders

--Find the total number of orders
--Find the total number of orders for each customers
--Additionally provide details such order Id,order date
SELECT
	OrderID,
	CustomerID,
	OrderDate,
	COUNT(*) OVER() TotalOrders,
	COUNT(*) OVER(PARTITION BY CustomerID) AS OrderbyCustomers
FROM Sales.Orders

--Find the total number of customers
--Additionally provide all customers Details
SELECT *,
COUNT(*) OVER () TotalCustomers
FROM Sales.Customers
--Find the total number of customers
--Find the total number of scores for the customers
--Additionally provide all customers Details
SELECT *,
COUNT(*) OVER () TotalCustomersStar,
COUNT(1) OVER () TotalCustomersOne,
COUNT(Score) OVER() TotalScores
FROM Sales.Customers

--check whether the table 'orders' contains any duplicates rows
SELECT 
	OrderID,
	COUNT(*) OVER(PARTITION BY OrderID) checkPK
FROM Sales.Orders

SELECT 
	OrderID,
	COUNT(*) OVER(PARTITION BY OrderID) checkPK
FROM Sales.OrdersArchive

SELECT*
FROM(
	SELECT 
	OrderID,
	COUNT(*) OVER(PARTITION BY OrderID) checkPK
FROM Sales.OrdersArchive
)t WHERE CheckPK>1