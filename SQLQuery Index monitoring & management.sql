--List all indexce on a specific table

sp_helpindex 'Sales.DBCustomers'


--Mointoring Index Usage

SELECT * FROM sys.indexes



SELECT 
   tb1.name AS TableName,
   idx.name AS IndexName,
   idx.type_desc AS IndexType,
   idx.is_primary_key AS IsPrimaryKey,
   idx.is_unique AS IsUnique,
   idx.is_disabled AS IsDisabled
FROM sys.indexes idx
JOIN sys.tables tb1
ON idx.object_id = tb1.object_id

ORDER BY tb1.name,idx.name