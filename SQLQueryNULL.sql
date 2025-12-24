--Find the Average scorse of the customers
SELECT
CustomerID,
Score,
AVG(Score) OVER () AvgScores,
AVG(COALESCE(Score,0)) OVER() AvgScores2
FROM Sales.Customers
 
SELECT
CustomerID,
Score,
AVG(ISNULL(Score,0)) OVER () AvgScores
FROM Sales.Customers


/*Display the full name of customers in a single field by merging
their first and last names,and add 10 bonus point to each customers score*/

SELECT
CustomerID,
FirstName,
LastName,

FirstName+ ' ' +COALESCE( LastName,'') AS FullName,
COALESCE(Score,0)+10 AS Bonus
FROM Sales.Customers
