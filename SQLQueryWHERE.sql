USE MyDatabase  

SELECT*FROM customers
--COMPARISON OPERATOR
--retrieve all customers from Germany

SELECT*
FROM customers
WHERE country='Germany'

--retrieve all customers who are not from Germany
SELECT*
FROM customers
WHERE country!='Germany'

--retrieve all customers with a score greater than 500
SELECT*FROM customers
WHERE score>400

--retrieve all customers greater than or equal to value
SELECT*FROM customers
WHERE score>=500 

--retrieve values is less than another value
SELECT*FROM customers
WHERE score<400
 
 --retrieve values is less than or equal
 SELECT*FROM customers
WHERE score<=600

--LOGICAL OPERATOR
--Retrieve all customers who are form the USA have a score greater than 500
SELECT *FROM customers
WHERE country='USA' AND score>500 

--Retrieve all customers who are either from UK or have a score greater than 500
SELECT*FROM customers
WHERE country='UK' or score>=500 

--retrieve all customers with a score not less than 500
SELECT * FROM customers 
WHERE NOT score>500 

--RANGE OPERATOR
 --retrieve all customers whose score falls in the range between 100 and 500
 SELECT*FROM customers
 WHERE score BETWEEN 100 AND 500

 --MEMBERSHIP OPERATOR
 --retrive all customers from either Germany or USA
 SELECT * FROM customers
 WHERE country IN('Germany','USA')

  SELECT * FROM customers
 WHERE country NOT IN('Germany','USA')


 --SEARCH OPERATOR
 --Find all customers whose first name  starts 'M'
SELECT*FROM customers
WHERE first_name LIKE 'M%'

--Find all customers whose first name ends with 'n'
SELECT*FROM customers
WHERE first_name LIKE '%n'

--Find all customers whose first name contains 'r'
SELECT*FROM customers
WHERE first_name LIKE '%r%'

--Find all customers whose first name has 'r' in the 3rd position
SELECT *FROM customers
WHERE first_name LIKE '__r%'