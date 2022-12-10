USE AdventureWorks2019
go

use master
go

IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'backupsinprocess' 
)
   DROP PROCEDURE dbo.backupsinprocess
GO

CREATE PROCEDURE dbo.backupsinprocess
	@Name varchar(150) 
AS
	BACKUP DATABASE AdventureWorks2019 
	TO  DEV_AdventureWorks 
WITH 
	NOFORMAT, 
	NO_COMPRESSION,
	NOINIT,  
	NAME = @Name, 
	SKIP, 
	STATS = 10;

GO

EXEC backupsinprocess 'VIOLETT'
EXEC backupsinprocess 'YUMEKO'
EXEC backupsinprocess 'YAGAMI'
EXEC backupsinprocess 'SAKURA'