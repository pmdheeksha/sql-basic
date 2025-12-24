--Insert
INSERT INTO People (Id,Person_Name,DOB,Email,Mob_no)VALUES
(101,'Baraa','15-Apr-2000','baraa321@gmail.com',9867854321),
(102,'Tira','1-May-2001','tiranot32@gmail.com',8940546781),
(103,'Martin','27-Dec-2000','martinnnnn546@gmail.com',7865498007),
(104,'John','10-Feb-2001','johnnjo67@gmail.com',9786548912)
SELECT * FROM People
--UPDATE
UPDATE People
SET Mob_no=6327345670,
WHERE id=105
SELECT*FROM people

--DELETE
DELETE People
WHERE Id<4
SELECT *FROM People

