-- full backup
BACKUP DATABASE [HospitalDB] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB.bak' WITH NOFORMAT, NOINIT,  NAME = N'HospitalDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;


-- differential backup
BACKUP DATABASE [HospitalDB] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB.bak' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'HospitalDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;


-- transaction Log backup
BACKUP LOG [HospitalDB] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB.bak' WITH NOFORMAT, NOINIT,  NAME = N'HospitalDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;



