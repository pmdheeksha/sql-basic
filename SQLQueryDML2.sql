--Insert data from 'People' into 'detils'
USE student
INSERT INTO details
SELECT 
Id,
Person_name,
NULL,
'Unknown'
FROM People
SELECT *FROM details 