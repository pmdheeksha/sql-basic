--Tip 1: Select Only what you need

--Bad Practice
SELECT * FROM Sales.Customers

--Good Practice
SELECT CustomerID,FirstName,LastName FROM Sales.Customers


--Tip 2 : Avoid unnecessary DISTINCT & ORDER BY

--Bad Practice
SELECT DISTINCT
	FirstName
FROM Sales.Customers
ORDER BY FirstName

--Good Practice
SELECT FirstName
FROM Sales.Customers

--Tip 3: For Exploration Purpose ,Limit Rows!
--Bad Practice
SELECT 
	OrderID,sales
FROM Sales.Orders

--Good Practice
SELECT TOP 10
	OrderID,
	Sales
FROM Sales.Orders

--Tip 4:Create nonclustered Index on frequently used columns in WHERE clause

SELECT * FROM Sales.Orders WHERE orderStatus = 'Delivered'
CREATE NONCLUSTERED INDEX Idx_Orders_OrderStatus ON Sales.Orders(OrderStatus)

--Tip 5: Avoid applying functions to column in WHERE clauses

SELECT * FROM Sales.Orders
WHERE LOWER(OrderStatus)='delivered'

--Bad Practice
SELECT *
FROM Sales.Orders
WHERE YEAR(OrderDate) = 2025

--Good Practice
SELECT *
FROM Sales.Orders
WHERE OrderDate BETWEEN '2025-01-01' AND '2025-12-31'


--Tip 6:Avoid leading wildcards as they prevent index usage
--Bad Practice
SELECT *
FROM Sales.Customers
WHERE LastName LIKE '%Gold%'

--Good Practice
SELECT *
FROM Sales.Customers
WHERE LastName LIKE 'Gold%'

--Tip 7: Use IN instead of multiple OR
--Bad Practice
SELECT *
FROM Sales.Orders
WHERE CustomerID = 1 OR CustomerID = 2 OR CustomerID = 3

--Good Practice
SELECT *
FROM Sales.Orders
WHERE CustomerID IN (1,2,3)

--Tip 8: Understand the speed of joins & use inner join when possible
--Best Performance
SELECT c.FirstName,o.OrderID FROM Sales.Customers c 
INNER JOIN Sales.Orders o ON c.CustomerID = o.CustomerID

--Slightly Slower Performance
SELECT c.FirstName,o.OrderID FROM Sales.Customers c 
RIGHT JOIN Sales.Orders o ON c.CustomerID = o.CustomerID

SELECT c.FirstName,o.OrderID FROM Sales.Customers c 
LEFT JOIN Sales.Orders o ON c.CustomerID = o.CustomerID

--Worst Performance
SELECT c.FirstName,o.OrderID FROM Sales.Customers c 
OUTER JOIN Sales.Orders o ON c.CustomerID = o.CustomerID

--Tip 9: Use Explicit Join (ANSI Join) Instead of Implicit Join (non-ANSI join)
--Bad Practice 
SELECT o.OrderID,c.FirstName
FROM Sales.Customers c,Sales.Orders o
WHERE c.CustomerID = o.CustomerID

--Good Practice
SELECT o.OrderID,c.FirstName
FROM Sales.Customers c
INNER JOIN sales.Orders o
ON c.CustomerID = o.CustomerID

--Tip 10: Make sure to Index the columns used in the ON clause

SELECT c.FirstName,o.OrderID
FROM Sales.Orders o
INNER JOIN Sales.Customers c
ON c.CustomerID = o.CustomerID

CREATE NONCLUSTERED INDEX IX_Orders_CustomerID ON Sales.Orders(CustomerID)

--Tip 11:Filter Before Joining(Big Tables)
--Filter After join(Where)
SELECT c.FirstName,o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderStatus = 'Delivered'

--Filter During Join(ON)
SELECT c.FirstName,o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
AND o.OrderStatus = 'Delivered'

--Filter Before Join(SUBQUERY)
SELECT c.FirstName,o.OrderID
FROM Sales.Customers c
INNER JOIN (SELECT OrderID,CustomerID FROM Sales.Orders WHERE OrderStatus = 'Delivered') o
ON c.CustomerID = o.CustomerID



--Tip 12: Aggregate Before Joining(Big Tables)

--Grouping and Joining
SELECT c.CustomerID,c.FirstName,COUNT(o.OrderID) AS Ordercount
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName

--Pre aggregated Subquery
SELECT c.CustomerID,c.FirstName,o.OrderCount
FROM Sales.Customers c
INNER JOIN(
	SELECT CustomerID,COUNT(OrderID) AS OrderCount
	FROM Sales.Orders
	GROUP BY CustomerID
	) o
ON c.CustomerID = o.CustomerID

--Bad Practice
--Correlated Subquery
SELECT
	c.CustomerID,
	c.FirstName,
	(SELECT COUNT(o.OrderID)
	FROM Sales.Orders o
	WHERE o.CustomerID = c.CustomerID) AS OrderCount
FROM Sales.Customers c
 
--Tip 13 :Use Union Instead of OR in Joins
--Bad practice
SELECT o.OrderID,c.FirstName
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
OR c.CustomerID = o.SalesPersonID

--Good Practice
SELECT o.OrderID,c.FirstName
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
UNION
SELECT o.OrderID,c.FirstName
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID

--Tip 14:Check for Nested Loops and Use SQL HINTS

SELECT o.OrderID,c.FirstName
FROM Sales.customers c
INNER JOIN Sales.Orders o
ON c.CustomerID = o.customerID

--Good Practice for Having Big Table &Small Table
SELECT o.OrderID,c.FirstName
FROM Sales.customers c
INNER JOIN Sales.Orders o
ON c.CustomerID = o.customerID
OPTION (HASH JOIN)


--Tip 15: Use UNION ALL instead of using UNION |duplicates are acceptable
--Bad Practice
SELECT CustomerID FROM Sales.Orders
UNION 
SELECT CustomerID FROM Sales.OrdersArchive

--Good Practice
SELECT CustomerID FROM Sales.Orders
UNION ALL
SELECT CustomerID FROM Sales.OrdersArchive 

--Tip 16: Use UNION ALL + Distinct instead of using UNION |duplicates are not acceptable

--Bad practice
SELECT CustomerID FROM Sales.Orders
UNION 
SELECT CustomerID FROM Sales.OrdersArchive

--Good Practice
SELECT DISTINCT CustomerID FROM
(
    SELECT CustomerID FROM Sales.Orders
	UNION 
	SELECT CustomerID FROM Sales.OrdersArchive
) AS Combineddata

--Tip 17:Use columnstore Index for Aggreations on Large Table
SELECT CustomerID,COUNT(OrderID) AS OrderCount
FROM sales.Orders
GROUP BY CustomerID

CREATE CLUSTERED COLUMNSTORE INDEX Idx_Orders_Columnstore ON Sales.Orders

--Tip 18: Pre-Aggregate Data and Store it in new Table for Reporting
SELECT MONTH(OrderDate) OrderYear,SUM(sales) AS TotalSales
INTO Sales.SalesSummary
FROM Sales.Orders 
GROUP BY MONTH(Orderdate)

--Tip 19: Join vs Exists vs In
--Join(Best Practice:If the performance equals to EXISTS)
SELECT o.OrderID,o.Sales
FROM Sales.Orders o
INNER JOIN Sales.Customers c
ON o.CustomerID = c.CustomerID
WHERE c.Country = 'USA'

--Exists(Best Practice:Use it for Large Table)
SELECT o.OrderID,o.Sales
FROM Sales.Orders o
WHERE EXISTS (
	SELECT 1
	FROM Sales.Customers c
	WHERE c.CustomerID = o.CustomerID
	AND c.Country = 'USA'
)

--IN(Bad practice)
SELECT o.OrderID,o.Sales
FROM Sales.Orders o
WHERE o.CustomerID IN (
	SELECT CustomerID
	FROM Sales.Customers
	WHERE Country = 'USA'
)


--Tip 20: Avoid Redundant Logic in your Query
--Bad Practice
SELECT EmployeeID,FirstName,'Above Average' Status
FROM Sales.Employees
WHERE Salary > (SELECT AVG(Salary) FROM Sales.Employees)
UNION ALL 
SELECT EmployeeID,FirstName,'Below Average' Status
FROM Sales.Employees
WHERE Salary < (SELECT AVG(Salary) FROM Sales.Employees)

--Good Practice
SELECT
	EmployeeID,
	FirstName,
	CASE 
		WHEN Salary > AVG(Salary) OVER() THEN 'Above Average'
		WHEN Salary < AVG(Salary) OVER() THEN 'Below Average'
		ELSE 'Average'
	END AS Status
FROM Sales.Employees


