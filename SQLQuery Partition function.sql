--step 1 :Create a Partition Function

CREATE PARTITION FUNCTION PartitionByYear(DATE)
AS RANGE LEFT FOR VALUES ('2023-12-31','2024-12-31','2025-12-31')

--Query lists all existing Partition Function
SELECT
    name,
    function_id,
    type,type_desc,
    boundary_value_on_right
    FROM sys.partition_functions


--Step 2: Create Filegroup
ALTER DATABASE SalesDB ADD FILEGROUP FG_2023;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2024;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2025;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2026;

--Query lists all existing Filegroups
SELECT *
FROM sys.filegroups
WHERE type = 'FG'

--Add data files(.ndf Files to Each Filegroup)
ALTER DATABASE SalesDB ADD FILE
(
NAME = P_2023,
FILENAME ='C:\sql learning dhee\P_2023.ndf'
) TO FILEGROUP FG_2023;

ALTER DATABASE SalesDB ADD FILE
(
NAME = P_2024,
FILENAME ='C:\sql learning dhee\P_2024.ndf'
) TO FILEGROUP FG_2024;

ALTER DATABASE SalesDB ADD FILE
(
NAME = P_2025,
FILENAME ='C:\sql learning dhee\P_2025.ndf'
) TO FILEGROUP FG_2025;


--create Partition Scheme
CREATE PARTITION SCHEME SchemePartitionByYear
AS PARTITION PartitionByYear
TO (FG_2023,FG_2024,FG_2025,FG_2026)





