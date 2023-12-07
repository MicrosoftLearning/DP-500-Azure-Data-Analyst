--Delete the inserted internet sales order
DELETE
	[dbo].[FactInternetSales]
WHERE
	[SalesOrderNumber] = N'SO99999';
GO
