--Find the highest and lowest sales of all orders
--Find the highest and lowest sales for each product
--Additionally provide details such order Id,order date

SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	MAX(Sales) OVER() HighestSales,
	MIN(sales) OVER() LowestSales,
	MAX(Sales) OVER(PARTITION BY ProductID) HighestSales,
	MIN(sales) OVER(PARTITION BY ProductID) LowestSales
FROM Sales.Orders

--show the employees who have the highest salaries
SELECT
*
FROM(
	SELECT*,
	MAX(Salary) OVER() Highestsalary
	FROM sales.Employees
)t WHERE salary=Highestsalary

--Find the deviation of each sales from the minimum and maximimu sales amounts
SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	MAX(Sales) OVER() HighestSales,
	MIN(sales) OVER() LowestSales,
	Sales-MIN(sales) OVER() DeviationFromMin,
	MAX(Sales) OVER() -sales DeviationFromMax
FROM Sales.Orders