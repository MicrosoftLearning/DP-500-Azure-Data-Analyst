USE [AdventureWorksDW2022-DP500];
GO

--Create the real-time table
IF NOT EXISTS(SELECT * FROM sys.tables WHERE [schema_id] = 1 AND [name] = N'FactInternetSalesRealTime')
BEGIN
	CREATE TABLE [dbo].[FactInternetSalesRealTime]
	(
		[SalesOrderNumber] [nvarchar](20) NOT NULL,
		[SalesOrderLineNumber] [tinyint] NOT NULL,
		[CustomerKey] [int] NOT NULL,
		[ProductKey] [int] NOT NULL,
		[OrderDateKey] [int] NOT NULL,
		[DueDateKey] [int] NOT NULL,
		[ShipDateKey] [int] NULL,
		[PromotionKey] [int] NOT NULL,
		[CurrencyKey] [int] NOT NULL,
		[SalesTerritoryKey] [int] NOT NULL,
		[OrderQuantity] [smallint] NOT NULL,
		[UnitPrice] [money] NOT NULL,
		[ExtendedAmount] [money] NOT NULL,
		[UnitPriceDiscountPct] [decimal](7, 4) NOT NULL,
		[DiscountAmount] [float] NOT NULL,
		[ProductStandardCost] [money] NOT NULL,
		[TotalProductCost] [money] NOT NULL,
		[SalesAmount] [money] NOT NULL,
		[TaxAmount] [money] NOT NULL,
		[FreightAmount] [money] NOT NULL,
		[CarrierTrackingNumber] [nvarchar](25) NULL,
		[CustomerPONumber] [nvarchar](25) NULL,
		[RevisionNumber] [tinyint] NOT NULL
	) ON [PRIMARY];
END;
GO