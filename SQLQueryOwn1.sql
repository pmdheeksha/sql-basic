CREATE DATABASE student;

USE student; 
CREATE TABLE details(
id INT,
Name VARCHAR(50),
Dept VARCHAR(50),
Age INT,
Marks INT
)

INSERT INTO details(id,Name,Dept,Age,Marks) VALUES
(1,'Yawn','AIDS',20,98),
(2,'Shawn','CSE',19,78),
(3,'Ruhi','AIDS',20,87),
(4,'Deevan','CSE',20,60),
(5,'Shan','CSE',19,89);

SELECT*FROM details 

SELECT 
	Dept,
	Age,
	Marks
FROM details 


SELECT *FROM details
WHERE Marks>85

SELECT 
Name,Marks
FROM details
WHERE Marks>85

SELECT *
FROM details
ORDER BY Marks ASC 

SELECT *
FROM details
ORDER BY Marks DESC


SELECT 
Dept,
COUNT(Age) AS same_age_tot
FROM details
GROUP BY Dept  

SELECT 
Dept,
AVG(Marks) AS dept_Avg
FROM details
GROUP BY dept
HAVING AVG(Marks)>30


SELECT 
DISTINCT Age
FROM details


SELECT TOP 3 * FROM details 

SELECT TOP 2 * FROM details ORDER BY Marks DESC