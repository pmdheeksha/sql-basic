--calculate moving average of sales for each product over time
--calculate moving average of sales for each product over time,including only thw next order

SELECT
	orderID,
	productID,
	OrderDate,
	Sales,
AVG(Sales) OVER(PARTITION BY ProductID) AgBYPrroduct,
AVG(Sales)OVER(PARTITION BY ProductID ORDER BY OrderDate) MovingAvg,
AVG(Sales)OVER(PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) RollingAVG
FROM Sales.Orders 