USE [AdventureWorksDW2022-DP500];
GO

--Insert an internet sales order for today
DECLARE @Today DATE = SYSDATETIME();
DECLARE
	@OrderDateKey INT = ((YEAR(@Today) * 10000) + (MONTH(@Today) * 100) + DAY(@Today))
	,@DueDateKey INT = ((YEAR(DATEADD(DAY, 10, @Today)) * 10000) + (MONTH(DATEADD(DAY, 10, @Today)) * 100) + DAY(DATEADD(DAY, 10, @Today)));

IF NOT EXISTS(SELECT * FROM [dbo].[FactInternetSales] WHERE [SalesOrderNumber] = N'SO99999')
BEGIN
	INSERT
		[dbo].[FactInternetSales]
	SELECT
		N'SO99999' AS [SalesOrderNumber]
		,1 AS [SalesOrderLineNumber]
		,18759 AS [CustomerKey]
		,225 AS [ProductKey]
		,@OrderDateKey AS [OrderDateKey]
		,@DueDateKey AS [DueDateKey]
		,NULL AS [ShipDateKey]
		,1 AS [PromotionKey]
		,100 AS [CurrencyKey]
		,6 AS [SalesTerritoryKey]
		,1 AS [OrderQuantity]
		,10000 AS [UnitPrice]
		,10000 AS [ExtendedAmount]
		,0 AS [UnitPriceDiscountPct]
		,0 AS [DiscountAmount]
		,9000 AS [ProductStandardCost]
		,9000 AS [TotalProductCost]
		,10000 AS [SalesAmount]
		,500 AS [TaxAmount]
		,0 AS [FreightAmount]
		,NULL AS [CarrierTrackingNumber]
		,NULL AS [CustomerPONumber]
		,1 AS [RevisionNumber];
END;
GO