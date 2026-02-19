--Step 1: Write a query
--For US Customers Find The Total Number of Customers and the Average Score

SELECT
    COUNT(*) TotalCustomers,
    AVG(Score) AvgScore
FROM Sales.Customers
WHERE Country = 'USA'

--Step 2: Turning the Query into a stored procedure
CREATE PROCEDURE GetCustomerSummary AS
BEGIN
SELECT
    COUNT(*) TotalCustomers,
    AVG(Score) AvgScore
FROM Sales.Customers
WHERE Country = 'USA'
END

--Excuting the stored procedure
EXEC GetCustomerSummary


--Parameters
--For Germany customers find the total number of customers and the average score
ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50)
AS
BEGIN
SELECT
    COUNT(*) TotalCustomers,
    AVG(Score) AvgScore
FROM Sales.Customers
WHERE Country = @Country
END



EXEC GetCustomerSummary @Country = 'Germany'
EXEC GetCustomerSummary @Country = 'USA'


--Multiple Statements
ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50)
AS
BEGIN
SELECT
    COUNT(*) TotalCustomers,
    AVG(Score) AvgScore
FROM Sales.Customers
WHERE Country = @Country


SELECT
     COUNT(OrderID) TotalOrders,
     SUM(Sales) TotalSales
FROM Sales.Orders o
JOIN Sales.Customers c
ON c.CustomerID = o.CustomerID
WHERE c.Country = @Country;

END
EXEC GetCustomerSummary @Country = 'Germany'

--Stored procedure variable
ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50)='USA'
AS
BEGIN
DECLARE @TotalCustomers INT, @AvgScore FLOAT;
SELECT
   @TotalCustomers = COUNT(*) ,
   @AvgScore = AVG(Score) 
FROM Sales.Customers
WHERE Country = @Country;

PRINT 'Total Customers from ' +@Country + ':' + CAST(@TotalCustomers AS NVARCHAR);
PRINT 'Average score from ' + @Country + ':' +CAST(@AvgScore AS NVARCHAR);



SELECT
     COUNT(OrderID) TotalOrders,
     SUM(Sales) TotalSales
FROM Sales.Orders o
JOIN Sales.Customers c
ON c.CustomerID = o.CustomerID
WHERE c.Country = @Country;

END

EXEC GetCustomerSummary