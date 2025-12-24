--Find the total number of orders
SELECT
COUNT(*) AS tot_orders
FROM orders

--Find the total sales of all orders
SELECT
COUNT(*) AS tot_orders,
SUM(Sales) AS total_sales
FROM orders

--Find the average sales of all orders
SELECT
COUNT(*) AS tot_orders,
SUM(Sales) AS total_sales,
AVG(sales) AS avg_sales
FROM orders

--Find the max sales of all orders
SELECT
COUNT(*) AS tot_orders,
SUM(Sales) AS total_sales,
AVG(sales) AS avg_sales,
MAX(Sales) AS max_sales
FROM orders

--Find the min sales of all orders
SELECT
COUNT(*) AS tot_orders,
SUM(Sales) AS total_sales,
AVG(sales) AS avg_sales,
MAX(Sales) AS max_sales,
MIN(Sales) AS min_sales
FROM orders

