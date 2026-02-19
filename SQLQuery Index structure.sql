SELECT *
INTO Sales.DBCustomers 
FROM Sales.Customers

--CLUSTERED INDEX
CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID
ON sales.DBcustomers (CustomerID)



CREATE CLUSTERED INDEX idx_DBCustomers_FirstName
ON sales.DBcustomers (FirstName)


SELECT *
FROM Sales.DBCustomers
WHERE LastName = 'Brown'


--NON CLUSTERED INDEX
CREATE NONCLUSTERED INDEX idx_DBCustomers_LastName
ON Sales.DBCustomers (LastName)

CREATE  INDEX idx_DBCustomers_FirstName
ON sales.DBcustomers (FirstName)


SELECT *
FROM Sales.DBCustomers
WHERE Country = 'USA' AND Score>500

CREATE INDEX idx_DBCustomers_CountryScore
ON sales.DBCustomers (Country,Score) 
