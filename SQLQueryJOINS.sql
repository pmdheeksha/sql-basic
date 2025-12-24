USE MyDatabase

--BASIC
--NO JOIN
/* retrieve all data from customers and orders in
two different results*/
SELECT*FROM customers
SELECT*FROM orders
 

--INNER JOIN
 /* Get all customers along with their orders,
 but only for customers who have placed an order*/

 SELECT *FROM customers
 INNER JOIN orders
 ON id=customer_id

 SELECT
	 customers.id,
	 customers.first_name,
	 orders.order_id,
	 orders.sales
 FROM customers
 INNER JOIN orders
 ON id=customer_id

  SELECT
	 c.id,
	 c.first_name,
	 o.order_id,
	 o.sales
 FROM customers AS c
 INNER JOIN orders AS o
 ON id=customer_id


 --LEFT JOIN
/* Get all customers along with their orders,
including those without orders.*/
  SELECT
	 c.id,
	 c.first_name,
	 o.order_id,
	 o.sales
 FROM customers AS c
 LEFT JOIN orders AS o
 ON id=customer_id

  SELECT
	 c.id,
	 c.first_name,
	 o.order_id,
	 o.sales
 FROM orders AS o 
 LEFT JOIN customers AS c
 ON id=customer_id

 --RIGHT JOIN
 /*Get all customers along with their orders,
 including orders without matching customers*/
  SELECT
	 c.id,
	 c.first_name,
	 o.order_id,
	 o.sales
 FROM customers AS c
 RIGHT JOIN orders AS o
 ON id=customer_id 

 --FULL JOIN
 /* Get all customers and all orders ,even if there's no match*/
 SELECT*
 FROM customers
 FULL JOIN orders
 ON id=customer_id 


 --ADVANCED
 --LEFT ANTI JOIN
 /* Get all customers who haven't place any order*/
 SELECT*
 FROM customers AS c 
 LEFT JOIN orders AS o
 ON c.id=o.customer_id
 WHERE O.customer_id IS NULL

 --RIGHT ANTI JOIN
 /* Get all orers without matching customers*/
  SELECT*
 FROM customers AS c 
 RIGHT JOIN orders AS o
 ON c.id=o.customer_id
 WHERE c.id IS NULL


--FULL ANTI JOIN
SELECT*
FROM orders 
FULL JOIN customers 
ON id=customer_id
WHERE id IS NULL OR customer_id IS NULL 

--ANTI JOIN
/*Generate all possible combinations of customers and orders*/
SELECT *
FROM customers
CROSS JOIN orders 