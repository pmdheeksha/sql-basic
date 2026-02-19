--Standalone CTE
--Step1: Find the total Sales per customer
SELECT*FROM Sales.Orders

SELECT
	CustomerID,
	SUM(Sales) AS Totalsales
FROM Sales.Orders
GROUP BY CustomerID 


--CTE query
WITH CTE_Total_Sales AS
(
SELECT
	CustomerID,
	SUM(Sales) AS Totalsales
FROM Sales.Orders
GROUP BY CustomerID 
)
--Main query
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.Totalsales
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID=c.CustomerID  


WITH CTE_Total_Sales AS
(
SELECT
	CustomerID,
	SUM(Sales) AS Totalsales
FROM Sales.Orders
GROUP BY CustomerID 
)
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.Totalsales
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID=c.CustomerID  
ORDER BY CustomerID 


--Multiple Standalone CTE
--Step1: Find the total Sales per customer
--Step2: Find the last order date for each customer
WITH CTE_Total_Sales AS
(
SELECT
	CustomerID,
	SUM(Sales) AS Totalsales
FROM Sales.Orders
GROUP BY CustomerID 
)
,CTE_Last_Order AS
(
SELECT
 CustomerID,
 MAX(orderDate) AS Last_Order
FROM sales.Orders
GROUP BY CustomerID
)
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.Totalsales,
clo.Last_Order
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID=c.CustomerID 
LEFT JOIN CTE_Last_Order clo
ON clo.CustomerID=c.CustomerID 

--Nested CTE
--Step1: Find the total Sales per customer
--Step2: Find the last order date for each customer
--Step3: Rank Customers based on total sales per customers.
WITH CTE_Total_Sales AS
(
SELECT
	CustomerID,
	SUM(Sales) AS Totalsales
FROM Sales.Orders
GROUP BY CustomerID 
)
,CTE_Last_Order AS
(
SELECT
 CustomerID,
 MAX(orderDate) AS Last_Order
FROM sales.Orders
GROUP BY CustomerID
)
,CTE_Customer_Rank AS
(
SELECT
CustomerID,
TotalSales,
RANK() OVER(ORDER BY Totalsales DESC) AS CustomerRank
FROM CTE_Total_Sales
)

SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.Totalsales,
clo.Last_Order,
ccr.CustomerRank
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID=c.CustomerID 
LEFT JOIN CTE_Last_Order clo
ON clo.CustomerID=c.CustomerID 
LEFT JOIN CTE_Customer_Rank ccr
ON ccr.CustomerID=c.CustomerID


--Step1: Find the total Sales per customer
--Step2: Find the last order date for each customer
--Step3: Rank Customers based on total sales per customers.
--step4:Segment customers based on their total sales.
WITH CTE_Total_Sales AS
(
SELECT
	CustomerID,
	SUM(Sales) AS Totalsales
FROM Sales.Orders
GROUP BY CustomerID 
)
,CTE_Last_Order AS
(
SELECT
 CustomerID,
 MAX(orderDate) AS Last_Order
FROM sales.Orders
GROUP BY CustomerID
)
,CTE_Customer_Rank AS
(
SELECT
CustomerID,
TotalSales,
RANK() OVER(ORDER BY Totalsales DESC) AS CustomerRank
FROM CTE_Total_Sales
)
,CTE_Customer_Segments AS
(
SELECT
CustomerID,
CASE WHEN Totalsales>100 THEN 'High'
     WHEN Totalsales>80 THEN 'Medium'
	 ELSE 'Low'
END CustomerSegments
FROM CTE_Total_Sales
)
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.Totalsales,
clo.Last_Order,
ccr.CustomerRank,
ccs.CustomerSegments
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID=c.CustomerID 
LEFT JOIN CTE_Last_Order clo
ON clo.CustomerID=c.CustomerID 
LEFT JOIN CTE_Customer_Rank ccr
ON ccr.CustomerID=c.CustomerID
LEFT JOIN CTE_Customer_Segments ccs
ON ccs.CustomerID=c.CustomerID 