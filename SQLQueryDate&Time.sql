SELECT
OrderID,
OrderDate,
ShipDate,
CreationTime
FROM Sales.Orders 

SELECT
OrderID,
CreationTime,
GETDATE() Today
FROM Sales.Orders 

--DAY,MONTH,YEAR
SELECT
OrderID,
CreationTime,
YEAR(CreationTime) AS year,
MONTH(CreationTime) AS month,
DAY(CreationTime) AS Day
FROM Sales.Orders 

--DATEPART
SELECT
OrderID,CreationTime,
DATEPART(year,CreationTime) AS year_part
FROM Sales.Orders

SELECT
OrderID,CreationTime,
DATEPART(month,CreationTime) AS month_part,
DATEPART(day,CreationTime) AS day_part,
DATEPART(hour,CreationTime) AS hour_part,
DATEPART(second,CreationTime) AS second_part,
DATEPART(minute,CreationTime) AS minute_part
FROM Sales.Orders

--DATENAME
SELECT
OrderID,CreationTime,
DATENAME(month,CreationTime) AS Month_dn,
DATENAME(weekday,CreationTime) AS weekday_dn
FROM sales.Orders 

--DATETRUNC
SELECT
OrderID,
CreationTime,
DATETRUNC(minute,CreationTime) Minute_dt
FROM Sales.Orders 

SELECT
OrderID,
CreationTime,
DATETRUNC(day,CreationTime) Minute_dt
FROM Sales.Orders 

--EOMONTH
SELECT
OrderID,
CreationTime,
EOMONTH(CreationTime) AS  end_dt
FROM Sales.Orders