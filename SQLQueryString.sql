--show a list of customers first names together with their country in the one column
SELECT*FROM customers 
--CONCAT
SELECT 
first_name,
country,
CONCAT(first_name,' ',country) AS full_name
FROM customers 

-- LOWER & UPPER
SELECT
first_name,
LOWER(first_name) AS low_name,
UPPER(first_name) AS up_name
FROM customers 

--TRIM

SELECT 
first_name,
TRIM(first_name) AS name
FROM customers

--REPLACE
--Removes dashes
 SELECT
 '123-456-7890' AS phone,
 REPLACE( '123-456-7890','-',' ') AS clean_phone

 --Replace File Extence from txt to csv
 SELECT
 'report.txt',
 REPLACE('report.txt','.txt','.csv') AS new_filename

 --LEN
 --Calculate the length of each customers first_name
 SELECT
 first_name,
 LEN(first_name) AS len_size
 FROM customers
--EXTRACTION
--LEFT AND RIGHT

--Retrieve the first two cahracters of each first name
SELECT 
first_name,
LEFT(first_name,2 )AS two_char
FROM customers 

--Retrieve the last two cahracters of each first name
SELECT 
first_name,
RIGHT(first_name,2 )AS two_char
FROM customers 

--SUBSTRING
--Retrieve a list of customers first name after removing the first character
SELECT
first_name,
SUBSTRING(first_name,3,2) AS sub_name
FROM customers 
