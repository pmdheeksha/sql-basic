--Analyze the month-over-month performance by finding the percentage change
--In sales between the current and previous months
SELECT 
	MONTH(OrderDate) OrderMonth,
	SUM(Sales) CurrentMonthSales,
	LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) PreviousMonthSales
FROM Sales.Orders
GROUP BY 
	MONTH(OrderDate)


SELECT *,
CurrentMonthSales-PreviousMonthsales AS MOM_Change
FROM(
SELECT 
	MONTH(OrderDate) OrderMonth,
	SUM(Sales) CurrentMonthSales,
	LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) PreviousMonthSales
FROM Sales.Orders
GROUP BY 
	MONTH(OrderDate)
)t 

SELECT *,
CurrentMonthSales-PreviousMonthsales AS MOM_Change,
ROUND(CAST((CurrentMonthSales-PreviousMonthsales) AS FLOAT)/PreviousMonthSales*100,1) AS MOM_Perc
FROM(
SELECT 
	MONTH(OrderDate) OrderMonth,
	SUM(Sales) CurrentMonthSales,
	LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) PreviousMonthSales
FROM Sales.Orders
GROUP BY 
	MONTH(OrderDate)
)t 



--In order to analyse customer loyalty,
--rank customers based on the average days between their orders
SELECT
OrderID,
CustomerID,
OrderDate CurrentOrder,
LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY orderDate) NextOrder
FROM Sales.Orders


SELECT
OrderID,
CustomerID,
OrderDate CurrentOrder,
LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY orderDate) NextOrder,
DATEDIFF(day,OrderDate,LEAD(OrderDate) OVER(PARTITION BY CustomerID Order BY OrderDate)) DaysUnitNextOrder
FROM Sales.Orders

SELECT
CustomerID,
AVG(DaysUnitNextOrder) AVGDays
FROM(
	SELECT
	OrderID,
	CustomerID,
	OrderDate CurrentOrder,
	LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY orderDate) NextOrder,
	DATEDIFF(day,OrderDate,LEAD(OrderDate) OVER(PARTITION BY CustomerID Order BY OrderDate)) DaysUnitNextOrder
	FROM Sales.Orders
)t
GROUP BY
CustomerID

SELECT
CustomerID,
AVG(DaysUnitNextOrder) AVGDays,
RANK() OVER(ORDER BY COALESCE(AVG(DaysUnitNextOrder),8999))RankAvg
FROM(
	SELECT
	OrderID,
	CustomerID,
	OrderDate CurrentOrder,
	LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY orderDate) NextOrder,
	DATEDIFF(day,OrderDate,LEAD(OrderDate) OVER(PARTITION BY CustomerID Order BY OrderDate)) DaysUnitNextOrder
	FROM Sales.Orders
)t
GROUP BY
CustomerID

--First_value & Last_value
--Find the lowest and highest sales for each product
SELECT
	OrderID,
	ProductID,
	Sales,
	FIRST_VALUE(sales) OVER(PARTITION BY ProductID ORDER BY Sales) LowestSales,
	LAST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) HighestSales
FROM Sales.Orders

SELECT
	OrderID,
	ProductID,
	Sales,
	FIRST_VALUE(sales) OVER(PARTITION BY ProductID ORDER BY Sales) LowestSales,
    FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales DESC) HighestSales
FROM Sales.Orders 



SELECT
	OrderID,
	ProductID,
	Sales,
	FIRST_VALUE(sales) OVER(PARTITION BY ProductID ORDER BY Sales) LowestSales,
    FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales DESC) HighestSales,
	MAX(Sales) OVER(PARTITION BY ProductID) HigestSales2
FROM Sales.Orders 