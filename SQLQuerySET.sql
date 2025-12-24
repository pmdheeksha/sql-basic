--UNION

SELECT
FirstName,
LastName
FROM sales.customers 

UNION

SELECT
FirstName,
LastName
FROM sales.Employees 

SELECT
CustomerID,
LastName
FROM sales.customers 

UNION

SELECT
EmployeeID,
LastName
FROM sales.Employees

SELECT
CustomerID AS ID,
LastName
FROM sales.customers 

UNION

SELECT
EmployeeID AS ID,
LastName
FROM sales.Employees

--combiEmployeesne the data from employees and customers into one table
SELECT*FROM Sales.Customers
SELECT*FROM Sales.Employees
SELECT
FirstName,
LastName
FROM sales.customers 
UNION 
SELECT
FirstName,
LastName
FROM sales.Employees

--UNION ALL
--combine the data from customer and employees into one table ,including duplicates
SELECT
FirstName, 
LastName
FROM sales.customers 
UNION ALL
SELECT
FirstName,
LastName
FROM sales.Employees

--EXCEPT
--Find the employees who are not customers at the same time
SELECT
FirstName, 
LastName
FROM sales.Employees
EXCEPT
SELECT
FirstName,
LastName
FROM sales.customers 

--INTERSECT
--Find the Employees,who are also customers
SELECT
FirstName, 
LastName
FROM sales.Employees
INTERSECT
SELECT
FirstName,
LastName
FROM sales.customers 