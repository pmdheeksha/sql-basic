--Find the total Sales across all orders
SELECT
SUM(Sales) TotalSales
FROM Sales.Orders

--Find the total Sales across all orders
SELECT
ProductID,
SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID

/*Find the total sales for each product 
Additionally provide details such order ID,order date*/

SELECT 
OrderID,
OrderDate,
SUM(Sales) OVER()
FROM Sales.Orders--it give total for all the values


SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSales
FROM Sales.Orders

SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSales
FROM Sales.Orders

--Find the total sales across all orders
--Find the total sales for each product
--Find the total sales for each combination of product and order status
--Additionally provide details such order Id,order date
SELECT
OrderID,
OrderDate,
ProductID,
OrderStatus,
SUM(sales) OVER() TotalSales,
SUM(sales) OVER(PARTITION BY ProductID) TotalSalesProduct,
SUM(sales) OVER(PARTITION BY ProductID,OrderStatus) TotalSalesProductandStatus
FROM Sales.Orders

--Rank each order based on their sales from highest to lowest
--Additionally provide details such order ID,order date
SELECT
OrderID,
OrderDate,
Sales,
RANK() OVER(ORDER BY Sales DESC) RankSales
FROM Sales.Orders



