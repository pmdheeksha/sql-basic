SELECT *
FROM customers

--Retrive only 3 customers
SELECT TOP 3
*
FROM customers 

--Retrieve the Top 3 customers with the highest scores
SELECT TOP 3*
FROM customers
ORDER BY score DESC

--Retrieve the lowest 2 customers based on the score
SELECT TOP 2*
FROM customers
ORDER BY score ASC

