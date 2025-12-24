--FORMAT

SELECT 
OrderID,
CreationTime,
FORMAT(CreationTime,'dd') AS dd,
FORMAT(CreationTime,'ddd') AS ddd,
FORMAT(CreationTime,'dddd') AS dddd,
FORMAT(CreationTime,'MM') AS MM,
FORMAT(CreationTime,'MMM') AS MMM,
FORMAT(CreationTime,'MMMM') AS MMMM
FROM Sales.Orders

SELECT
OrderID,CreationTime,
FORMAT(Creationtime,'MM-dd-yyyy') AS USA_Format,
FORMAT(Creationtime,'dd-MM-yyyy') AS Europe_Format
FROM Sales.Orders

 --show CreatioTime using the following format:
 --Day Wed Jan Q1 2025 12:34:56 PM

 SELECT
 OrderID,
 CreationTime,
 'Day ' + FORMAT(CreationTime,'ddd MMM') +
 ' Q' + DATENAME(quarter,CreationTime)+' ' +
 FORMAT(CreationTime,'yyyy hh:mm:ss tt')AS CustomerFormat
 FROM Sales.Orders

 SELECT 
 FORMAT (OrderDate, 'MMM yy') AS OrderDate,
 COUNT(*)
 FROM Sales.Orders
 GROUP BY FORMAT (OrderDate, 'MMM yy') 

 --CONVERT
 SELECT
 CONVERT(INT,'123') AS [String to Int],
 CONVERT(DATE,'2025-08-20')AS [String to date]

 SELECT 
CreationTime,
CONVERT(DATE,CreationTime) AS [Datetime to Data CONVERT],
CONVERT(VARCHAR,CreationTime,32) AS [USA Std. style:32],
CONVERT(VARCHAR,CreationTime,34) AS [Europe Std. style:34]
FROM Sales.Orders

--CAST
SELECT
CAST('123' AS INT) AS [String to Int],
CAST(123 AS VARCHAR) AS [Int to String],
CAST('2025-08-15' AS DATE) AS [String to Date]


 