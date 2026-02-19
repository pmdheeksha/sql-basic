SELECT* 
INTO #Orders12
FROM Sales.Orders

SELECT * FROM #Orders12

SELECT*FROM #Orders12
WHERE OrderStatus='Delivered'


DELETE #Orders12
WHERE OrderStatus='Delivered'

SELECT*FROM #Orders12



SELECT
*
INTO Sales.OrdersTest
FROM #Orders12