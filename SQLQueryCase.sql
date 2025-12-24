/* Create report showing total sales for each of the following categories:
High (sales over 50),Medium(sales 21-50) and low (sales 20 or less)
Sort the categories from highest sales to lowest*/

SELECT
OrderID,
Sales,
CASE 
WHEN Sales>50 THEN 'High'
WHEN Sales>20 THEN 'Medium'
ELSE 'Low'
END
FROM Sales.Orders


SELECT
	Category,
	SUM(Sales) AS TotalSales
FROM(
	SELECT
	OrderID,
	Sales,
	CASE 
		WHEN Sales>50 THEN 'High'
		WHEN Sales>20 THEN 'Medium'
		ELSE 'Low'
	END category
	FROM Sales.Orders
)AS T
GROUP BY Category

SELECT
	Category,
	SUM(Sales) AS TotalSales
FROM(
	SELECT
	OrderID,
	Sales,
	CASE 
		WHEN Sales>50 THEN 'High'
		WHEN Sales>20 THEN 'Medium'
		ELSE 'Low'
	END category
	FROM Sales.Orders
)AS T
GROUP BY Category
ORDER BY TotalSales DESC

--THEN and ELSE should same data type
SELECT
	Category,
	SUM(Sales) AS TotalSales
FROM(
	SELECT
	OrderID,
	Sales,
	CASE 
		WHEN Sales>50 THEN 1
		WHEN Sales>20 THEN 'Medium'
		ELSE 'Low'
	END category
	FROM Sales.Orders
)AS T
GROUP BY Category
ORDER BY TotalSales DESC

 --Retrive employee details with gender displayed as full text
SELECT
EmployeeID,
FirstName,
LastName,
Gender,
CASE
	WHEN Gender='F' THEN 'Female'
	WHEN Gender='M' THEN 'Male'
	ELSE 'Not Available'
END GenderFullText
FROM Sales.Employees

--Retrieve customer details with abbreviated country code
 SELECT
 CustomerID,
 FirstName,
 LastName,
 Country,
 CASE
	WHEN Country='Germany' THEN 'DE'
	WHEN Country='USA' THEN 'US'
	ELSE 'n/a'
END AS CountryABBR
 FROM Sales.Customers 

 SELECT DISTINCT Country
 FROM Sales.Customers
