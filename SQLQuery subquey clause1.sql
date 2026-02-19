/*Task: Find the products that have a price higher
than the average price of all product*/

--Mainquery
SELECT*FROM
	--subquery
	(SELECT
	ProductID,
	Price,
	AVG(Price) OVER() Avgprice
	FROM Sales.Products)t
WHERE Price>Avgprice

SELECT*FROM
	(SELECT
	FirstName,
	Department,
	Salary,
	AVG(Salary) OVER() Avgsalary
	FROM Sales.Employees)t
WHERE Salary<Avgsalary 

--Rank Customers based on their total amount of sales
--Main query
SELECT*,
RANK() OVER(ORDER BY Totalsales DESC) CustomerRank
FROM
--sub query
  (SELECT
  CustomerID,
  SUM(Sales) AS Totalsales
  FROM Sales.Orders
  GROUP BY CustomerID)t
