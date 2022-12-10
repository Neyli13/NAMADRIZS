USE AdventureWorks2019
go

use master
go

EXEC sp_addumpdevice 'Disk', 'DEV_AdventureWorks',
'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\DEV_AdventureWorks.bak';
GO

SELECT * FROM sys.backup_devices
GO

BACKUP DATABASE AdventureWorks2019
TO DEV_AdventureWorks
WITH FORMAT, INIT, NAME = N'AdventureWorks Full Backup'

RESTORE HEADERONLY FROM DEV_AdventureWorks

EXEC�sp_dropdevice�'AdventureWorksDevice',�'delfile' 
 GO