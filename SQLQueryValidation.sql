--CALCULATION
--DATEADD()
SELECT
OrderID,
OrderDate,
DATEADD(year, 2, OrderDate) AS[TwoYearsLater],
DATEADD(month, 4, OrderDate) AS[TwoYearsLater],
DATEADD(dd, 5, OrderDate) AS[TwoYearsLater],
DATEADD(year, -2, OrderDate) AS[TwoYearsLater],
DATEADD(month, -3, OrderDate) AS[TwoYearsLater],
DATEADD(dd, -4, OrderDate) AS[TwoYearsLater]
FROM Sales.Orders

--DATEDIFF
SELECT
EmployeeID,Birthdate,
DATEDIFF(year, Birthdate,GETDATE()) AS Age
FROM Sales.Employees

--Find the average shipping duration in days for each month
SELECT
OrderID,
OrderDate,
ShipDate,
DATEDIFF(DAY, OrderDate, ShipDate) AS daysship
FROM Sales.Orders

--Time Gap Analysis
--Find the number of days between each order and the previous order
SELECT
OrderID,
OrderDate AS curerntOrderdate,
LAG(Orderdate) OVER (ORDER BY OrderDate) PreviousOrderDate
FROM Sales.Orders

--validation
--ISDATE
SELECT
ISDATE ('2025-08-23') Datecheck,
ISDATE ('20-08-2023') Datecheck,
ISDATE('2025') Datecheck