--Subquery categories
--Type 1 Result Type

--scalar subquery
SELECT 
AVG(Sales)
FROM Sales.Orders

SELECT 
COUNT(FirstName)
FROM Sales.Employees

--Row subquery
SELECT
CustomerID 
FROM Sales.Orders

SELECT
ProductID
FROM Sales.OrdersArchive

--Table subquery
SELECT
*
FROM Sales.Products

SELECT
Product,
Category
FROM Sales.Products 