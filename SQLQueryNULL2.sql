--sort the customers from lowest to highest scores 
--with nulls appearing last
SELECT
CustomerID,
Score
FROM Sales.Customers
ORDER BY Score ASC 

SELECT
CustomerID,Score,
CASE WHEN Score IS NULL THEN 1 ELSE 0 END FLAG
FROM Sales.Customers


SELECT 
CustomerID,score
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END,Score



--Find the sales price for each order by dividing sales by quantity
SELECT
OrderID,Sales,Quantity,
Sales/NULLIF(Quantity,0) AS Price
FROM Sales.Orders

--Basic of checking IS NULL
SELECT*
FROM sales.Customers
WHERE Score IS NULL

--List all customers who have scores
SELECT*
FROM sales.Customers
WHERE Score IS NOT NULL

--List all details for customers who have not placed any orders
SELECT
c.*,
o.OrderID
FROM Sales.Customers c
LEFT JOIN Sales.orders o
ON   c.CustomerID=o.CustomerID 
WHERE o.CustomerID IS NULL


SELECT
c.*,
o.OrderID
FROM Sales.Customers c
LEFT JOIN Sales.orders o
ON   c.CustomerID=o.CustomerID 
WHERE o.CustomerID IS NOT NULL


--NULL vs EMPTY vs SPACE
