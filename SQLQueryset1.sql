--Order data are stored in separte tables(Orders and OrdersArchive).
--Combine all orders data into one report without duplicates
SELECT*FROM Sales.Orders
UNION 
SELECT*FROM Sales.OrdersArchive

SELECT
       'Order' AS Source_table,
       [OrderID]
      ,[ProductID]
      ,[CustomerID] 
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION 
SELECT
       'OrderArchive' AS Source_table,
       [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID ASC 