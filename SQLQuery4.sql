--Retrieve customers with a score not equal to 0
SELECT *
FROM customers
WHERE score>=500


--Retrieve customers from germany
SELECT *
FROM customers
WHERE country='germany'

--Retrieve only first_name,country
SELECT
	first_name,
	country	
FROM customers
WHERE country='Germany'