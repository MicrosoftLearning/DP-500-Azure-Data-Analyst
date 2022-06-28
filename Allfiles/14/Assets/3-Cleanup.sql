USE [AdventureWorksDW2022-DP500];
GO

--Drop the real-time table
IF EXISTS(SELECT * FROM sys.tables WHERE [schema_id] = 1 AND [name] = N'FactInternetSalesRealTime')
BEGIN
	DROP TABLE [dbo].[FactInternetSalesRealTime];
END;
GO
