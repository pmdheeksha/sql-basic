SELECT*
FROM Customers
SELECT*
FROM OrderItems
SELECT*
FROM Orders
SELECT*
FROM Products

--Get all customers who live in Chennai.
SELECT
name,
city
FROM Customers
WHERE city='chennai'

--Find all products in the Electronics category.
SELECT
product_id,
product_name,
category
FROM Products
WHERE category='Electronics'

--List all orders placed after 2025-01-15
SELECT
order_date,
total_amount
FROM Orders
WHERE order_date='2025-02-15'

--Show all OrderItems where quantity is greater than 1.
SELECT
item_id,
quantity
FROM OrderItems
WHERE quantity>1

--Get all products priced below 10,000.
SELECT*
FROM Products
WHERE price<10000

--Get all customers whose names start with 'D'.
SELECT*
FROM Customers
WHERE name LIKE 'D%'


--Fetch orders made by customer_id = 101.
SELECT
customer_id
FROM Orders
WHERE order_id=101

--Find products that are not in Accessories category.
SELECT*
FROM Products
WHERE category != 'Accessories'

--Get products where category = 'Electronics' AND price > 20,000.
SELECT*FROM Products
WHERE category='Electronics' AND price >20000 

--Show orders where order_amount > 1000 OR order_date = '2025-01-01'.
SELECT*FROM Orders
WHERE total_amount>1000 OR order_date='2025-01-01'

--Find customers in Chennai OR Bangalore.
SELECT*FROM Customers
WHERE city='Chennai' OR city='Bangalore'

--Get OrderItems where product_id = 3 AND quantity = 2.
SELECT*FROM OrderItems
WHERE product_id=3 AND quantity = 2 

--Get products priced BETWEEN 2000 AND 20000.
SELECT*FROM Products
WHERE price BETWEEN 2000 AND 20000

--Show orders with order_id IN (102, 104, 105).
SELECT*FROM Orders
WHERE order_id IN (102,104,105)

--Find customers whose names LIKE '%a%'.
SELECT*FROM Customers
WHERE name LIKE '%a%'

--Show orders between 2025-01-01 and 2025-02-15.
SELECT*FROM Orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-02-15'

--List all orders with customer name where order_amount > 1000.
SELECT
name
FROM Orders AS o
FULL JOIN Customers AS c
ON c.customer_id=o.customer_id
WHERE total_amount>1000

--Show product name and quantity for OrderItems where quantity > 1.
SELECT
p.product_name,
o.quantity
FROM Products AS p
FULL JOIN OrderItems AS o 
ON p.product_id=o.product_id
WHERE quantity>1

--Get all customers who bought the product 'Laptop'.
SELECT
c.name,
p.product_name
FROM Customers AS c
FULL JOIN Products AS p
ON c.customer_id=p.product_id
WHERE product_name='Laptop'

--List all orders where the product category is 'Accessories'.
SELECT
o.order_id,
o.customer_id,
o.order_date,
o.total_amount,
p.category
FROM orders AS o
FULL JOIN products AS p
ON o.total_amount=p.price
WHERE category='Accessories'
