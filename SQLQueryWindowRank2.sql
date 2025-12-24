--Assign unique IDs to the rows of the 'Orders Archive
SELECT
ROW_NUMBER() OVER(ORDER BY OrderID,OrderDate) UniqueID,
*
FROM Sales.OrdersArchive

--Identify duplicates rows in the table 'orderArchive' and return a clean result without any duplicates
SELECT*FROM(
SELECT
ROW_NUMBER() OVER(PARTITION BY OrderID ORDER BY CreationTime DESC) rn,
*
FROM Sales.OrdersArchive
)t WHERE rn=1

--NTILE()
SELECT
OrderID,
Sales,
NTILE(1) OVER(ORDER BY Sales DESC) AS OneBucket,
NTILE(2) OVER(ORDER BY Sales DESC) AS TwoBucket,
NTILE(3) OVER(ORDER BY Sales DESC) AS ThreeBucket,
NTILE(4) OVER(ORDER BY Sales DESC) AS FourBucket
FROM Sales.Orders 
--Segment all orders into 3 categories: high,medium and low sales
SELECT
*,
CASE WHEN Buckets=1 THEN 'High'
	 WHEN Buckets=2 THEN 'Medium'
	 WHEN Buckets=3 THEN 'Low'
END
FROM(
	SELECT
		OrderID,Sales,
		NTILE(3) OVER (ORDER BY sales DESC) Buckets
	FROM Sales.Orders
)t
--In order to export the data ,divide the orders into 2 group
SELECT
NTILE(4) OVER(ORDER BY ORderID) Buckets,
*
FROM sales.Orders  

--CUME_DIST() & PERCENT_RANK()
--Find the products that fall within thehighest 40% of the prices
SELECT  
	Product,
	Price,
	CUME_DIST() OVER(ORDER BY Price DESC) DistRank
FROM Sales.Products

SELECT*,
CONCAT(DistRank*100,'%') DistRankperc
FROM(
	SELECT  
	Product,
	Price,
	CUME_DIST() OVER(ORDER BY Price DESC) DistRank
    FROM Sales.Products
	)t
WHERE DistRank<=0.4

SELECT*,
CONCAT(DistRank*100,'%') DistRankperc
FROM(
	SELECT  
	Product,
	Price,
	PERCENT_RANK() OVER(ORDER BY Price DESC) DistRank
    FROM Sales.Products
	)t
WHERE DistRank<=0.4