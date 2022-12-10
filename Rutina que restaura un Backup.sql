USE AdventureWorks2019
go

use master
go

RESTORE FILELISTONLY FROM DEV_AdventureWorks
GO


IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'Restore_Backup' 
)
   DROP PROCEDURE dbo.Res_Backup
GO

CREATE PROCEDURE dbo.Res_Backup
	@File smallint
AS
	RESTORE DATABASE AdventureWorks2019
	FROM  DEV_AdventureWorks 
WITH FILE = @File,  
	MOVE N'AdventureWorks2017' 
	TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AwExamenBDII_Restore.mdf',
	Move N'AdventureWorks2017_log' 
	TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AwExamenBDII_Restore_lg.ldf',
	NOUNLOAD,  
	REPLACE,
	STATS = 10

GO


EXECUTE dbo.Res_Backup 6
GO
