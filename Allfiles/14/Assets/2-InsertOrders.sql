USE [AdventureWorksDW2022-DP500];
GO

SET NOCOUNT ON;

--Determine the next order number to insert
DECLARE @OrderNumber INT = 51175;
DECLARE @DelaySeconds NCHAR(8);

--Insert new orders using the delay
WHILE (1 = 1)
BEGIN
	INSERT
		[dbo].[FactInternetSalesRealTime]
	SELECT
		*
	FROM
		[dbo].[FactInternetSales]
	WHERE
		[SalesOrderNumber] = CONCAT(N'SO', @OrderNumber);

	--Random delay 1-15 seconds
	SET @DelaySeconds = CONCAT(N'00:00:', FORMAT((ABS(CHECKSUM(NEWID()) % 15) + 1), N'00'));
	WAITFOR DELAY @DelaySeconds;

	SET @OrderNumber = @OrderNumber + 1;
END;
GO
