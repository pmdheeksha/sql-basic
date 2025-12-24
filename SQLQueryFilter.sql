--How many orders were placed each year?
SELECT
YEAR(OrderDate),
COUNT(*) AS NoOFOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)

--How many orders were placed each month?
SELECT
DATENAME(MONTH,OrderDate) AS OrderDate,
COUNT(*) AS NoOFOrders
FROM Sales.Orders
GROUP BY DATENAME(MONTH,OrderDate)

--DATA FILTERING
SELECT
*
FROM Sales.Orders
WHERE MONTH(OrderDate)=2
