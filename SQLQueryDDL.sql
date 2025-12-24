--DDL
--CREATE


CREATE TABLE Persons1(
  Id INT NOT NULL,
  Person_Name VARCHAR(60) NOT NULL,
  DOB DATE,
  Phone_No VARCHAR(15),
  CONSTRAINT Pk_Persons1 PRIMARY KEY(Id)
  )

  SELECT * FROM Persons
  --ALTER (add a new column called email to the persons table

   
 ALTER TABLE Persons1
 ADD Email VARCHAR(50) NOT NULL

 SELECT*FROM Persons1
 --DROP
 --Remove the column from the table
 ALTER TABLE Persons1
 DROP COLUMN Phone_No

 SELECT *
 FROM Persons1 
 --DROP
 DROP TABLE persons
 --TRUNCATE
 TRUNCATE TABLE details
 SELECT * FROM details 

 --RENAME
 EXEC sp_rename 'Persons1','People'