
--UNIQUE
SELECT * FROM Sales.Products

CREATE UNIQUE NONCLUSTERED INDEX idx_Products_Category
ON Sales.Products (Category)

CREATE UNIQUE NONCLUSTERED INDEX idx_Products_product
ON Sales.Products (Product)


--FILTER
SELECT * FROM Sales.Customers

CREATE NONCLUSTERED INDEX idx_Customers_Country
ON Sales.Customers (Country)
WHERE Country = 'USA'