EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

EXEC sp_configure 'clr strict security', 0;
RECONFIGURE;

USE [master]
GO
ALTER LOGIN [sa] ENABLE
GO