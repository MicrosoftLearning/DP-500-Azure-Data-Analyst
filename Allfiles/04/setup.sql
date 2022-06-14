SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactInternetSales](
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
)

GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NULL,
	[CustomerAlternateKey] [nvarchar](15) NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[NameStyle] [bit] NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Suffix] [nvarchar](10) NULL,
	[Gender] [nvarchar](1) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[YearlyIncome] [money] NULL,
	[TotalChildren] [tinyint] NULL,
	[NumberChildrenAtHome] [tinyint] NULL,
	[EnglishEducation] [nvarchar](40) NULL,
	[SpanishEducation] [nvarchar](40) NULL,
	[FrenchEducation] [nvarchar](40) NULL,
	[EnglishOccupation] [nvarchar](100) NULL,
	[SpanishOccupation] [nvarchar](100) NULL,
	[FrenchOccupation] [nvarchar](100) NULL,
	[HouseOwnerFlag] [nchar](1) NULL,
	[NumberCarsOwned] [tinyint] NULL,
	[AddressLine1] [nvarchar](120) NULL,
	[AddressLine2] [nvarchar](120) NULL,
	[Phone] [nvarchar](20) NULL,
	[DateFirstPurchase] [date] NULL,
	[CommuteDistance] [nvarchar](15) NULL
)

GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDateAlternateKey] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[EnglishDayNameOfWeek] [nvarchar](10) NOT NULL,
	[SpanishDayNameOfWeek] [nvarchar](10) NOT NULL,
	[FrenchDayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[EnglishMonthName] [nvarchar](10) NOT NULL,
	[SpanishMonthName] [nvarchar](10) NOT NULL,
	[FrenchMonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [smallint] NOT NULL,
	[FiscalSemester] [tinyint] NOT NULL
)

GO
CREATE TABLE [dbo].[DimGeography](
	[GeographyKey] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceCode] [nvarchar](3) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[EnglishCountryRegionName] [nvarchar](50) NULL,
	[SpanishCountryRegionName] [nvarchar](50) NULL,
	[FrenchCountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[SalesTerritoryKey] [int] NULL,
	[IpAddressLocator] [nvarchar](15) NULL)

GO
CREATE TABLE [dbo].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductAlternateKey] [nvarchar](25) NULL,
	[ProductSubcategoryKey] [int] NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[SizeUnitMeasureCode] [nchar](3) NULL,
	[EnglishProductName] [nvarchar](50) NOT NULL,
	[SpanishProductName] [nvarchar](50) NOT NULL,
	[FrenchProductName] [nvarchar](50) NOT NULL,
	[StandardCost] [money] NULL,
	[FinishedGoodsFlag] [bit] NOT NULL,
	[Color] [nvarchar](15) NOT NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](50) NULL,
	[SizeRange] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[DaysToManufacture] [int] NULL,
	[ProductLine] [nchar](2) NULL,
	[DealerPrice] [money] NULL,
	[Class] [nchar](2) NULL,
	[Style] [nchar](2) NULL,
	[ModelName] [nvarchar](50) NULL,
	[LargePhoto] [varbinary](max) NULL,
	[EnglishDescription] [nvarchar](400) NULL,
	[FrenchDescription] [nvarchar](400) NULL,
	[ChineseDescription] [nvarchar](400) NULL,
	[ArabicDescription] [nvarchar](400) NULL,
	[HebrewDescription] [nvarchar](400) NULL,
	[ThaiDescription] [nvarchar](400) NULL,
	[GermanDescription] [nvarchar](400) NULL,
	[JapaneseDescription] [nvarchar](400) NULL,
	[TurkishDescription] [nvarchar](400) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](7) NULL)
WITH  
  (   
    CLUSTERED INDEX (ProductKey)  
  ); 
GO

CREATE TABLE [dbo].[DimProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryAlternateKey] [int] NULL,
	[EnglishProductCategoryName] [nvarchar](50) NOT NULL,
	[SpanishProductCategoryName] [nvarchar](50) NOT NULL,
	[FrenchProductCategoryName] [nvarchar](50) NOT NULL)

GO
CREATE TABLE [dbo].[DimProductSubcategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubcategoryAlternateKey] [int] NULL,
	[EnglishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[SpanishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[FrenchProductSubcategoryName] [nvarchar](50) NOT NULL,
	[ProductCategoryKey] [int] NULL)
GO

CREATE TABLE [dbo].[DimSalesTerritory](
	[SalesTerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesTerritoryAlternateKey] [int] NULL,
	[SalesTerritoryRegion] [nvarchar](50) NOT NULL,
	[SalesTerritoryCountry] [nvarchar](50) NOT NULL,
	[SalesTerritoryGroup] [nvarchar](50) NULL,
	[SalesTerritoryImage] [varbinary](max) NULL)
WITH  
  (   
    CLUSTERED INDEX (SalesTerritoryKey)  
  ); 
GO


-- vDMPrep will be used as a data source by the other data mining views.  
-- Uses DW data at customer, product, day, etc. granularity and
-- gets region, model, year, month, etc.
CREATE VIEW [dbo].[vDMPrep]
AS
    SELECT
        pc.[EnglishProductCategoryName]
        ,Coalesce(p.[ModelName], p.[EnglishProductName]) AS [Model]
        ,c.[CustomerKey]
        ,s.[SalesTerritoryGroup] AS [Region]
        ,CASE
            WHEN Month(GetDate()) < Month(c.[BirthDate])
                THEN DateDiff(yy,c.[BirthDate],GetDate()) - 1
            WHEN Month(GetDate()) = Month(c.[BirthDate])
            AND Day(GetDate()) < Day(c.[BirthDate])
                THEN DateDiff(yy,c.[BirthDate],GetDate()) - 1
            ELSE DateDiff(yy,c.[BirthDate],GetDate())
        END AS [Age]
        ,CASE
            WHEN c.[YearlyIncome] < 40000 THEN 'Low'
            WHEN c.[YearlyIncome] > 60000 THEN 'High'
            ELSE 'Moderate'
        END AS [IncomeGroup]
        ,d.[CalendarYear]
        ,d.[FiscalYear]
        ,d.[MonthNumberOfYear] AS [Month]
        ,f.[SalesOrderNumber] AS [OrderNumber]
        ,f.SalesOrderLineNumber AS LineNumber
        ,f.OrderQuantity AS Quantity
        ,f.ExtendedAmount AS Amount  
    FROM
        [dbo].[FactInternetSales] f
    INNER JOIN [dbo].[DimDate] d
        ON f.[OrderDateKey] = d.[DateKey]
    INNER JOIN [dbo].[DimProduct] p
        ON f.[ProductKey] = p.[ProductKey]
    INNER JOIN [dbo].[DimProductSubcategory] psc
        ON p.[ProductSubcategoryKey] = psc.[ProductSubcategoryKey]
    INNER JOIN [dbo].[DimProductCategory] pc
        ON psc.[ProductCategoryKey] = pc.[ProductCategoryKey]
    INNER JOIN [dbo].[DimCustomer] c
        ON f.[CustomerKey] = c.[CustomerKey]
    INNER JOIN [dbo].[DimGeography] g
        ON c.[GeographyKey] = g.[GeographyKey]
    INNER JOIN [dbo].[DimSalesTerritory] s
        ON g.[SalesTerritoryKey] = s.[SalesTerritoryKey] 
;

GO
-- vTimeSeries view supports the creation of time series data mining models.
--      - Replaces earlier bike models with successor models.
--      - Abbreviates model names to improve readability in mining model viewer
--      - Concatenates model and region so that table only has one input.
--      - Creates a date field indexed to monthly reporting date for use in prediction.
CREATE VIEW [dbo].[vTimeSeries] 
AS
    SELECT 
        CASE [Model] 
            WHEN 'Mountain-100' THEN 'M200' 
            WHEN 'Road-150' THEN 'R250' 
            WHEN 'Road-650' THEN 'R750' 
            WHEN 'Touring-1000' THEN 'T1000' 
            ELSE Left([Model], 1) + Right([Model], 3) 
        END + ' ' + [Region] AS [ModelRegion] 
        ,(Convert(Integer, [CalendarYear]) * 100) + Convert(Integer, [Month]) AS [TimeIndex] 
        ,Sum([Quantity]) AS [Quantity] 
        ,Sum([Amount]) AS [Amount]
		,CalendarYear
		,[Month]
		,DATEFROMPARTS([CalendarYear], [Month], 25)
		as ReportingDate
    FROM 
        [dbo].[vDMPrep] 
    WHERE 
        [Model] IN ('Mountain-100', 'Mountain-200', 'Road-150', 'Road-250', 
            'Road-650', 'Road-750', 'Touring-1000') 
    GROUP BY 
        CASE [Model] 
            WHEN 'Mountain-100' THEN 'M200' 
            WHEN 'Road-150' THEN 'R250' 
            WHEN 'Road-650' THEN 'R750' 
            WHEN 'Touring-1000' THEN 'T1000' 
            ELSE Left(Model,1) + Right(Model,3) 
        END + ' ' + [Region] 
        ,(Convert(Integer, [CalendarYear]) * 100) + Convert(Integer, [Month])
		,CalendarYear
		,[Month]
		,DATEFROMPARTS([CalendarYear], [Month], 25);
GO
-- vTargetMail supports targeted mailing data model
-- Uses vDMPrep to determine if a customer buys a bike and joins to DimCustomer
CREATE VIEW [dbo].[vTargetMail] 
AS
    SELECT
        c.[CustomerKey], 
        c.[GeographyKey], 
        c.[CustomerAlternateKey], 
        c.[Title], 
        c.[FirstName], 
        c.[MiddleName], 
        c.[LastName], 
        c.[NameStyle], 
        c.[BirthDate], 
        c.[MaritalStatus], 
        c.[Suffix], 
        c.[Gender], 
        c.[EmailAddress], 
        c.[YearlyIncome], 
        c.[TotalChildren], 
        c.[NumberChildrenAtHome], 
        c.[EnglishEducation], 
        c.[SpanishEducation], 
        c.[FrenchEducation], 
        c.[EnglishOccupation], 
        c.[SpanishOccupation], 
        c.[FrenchOccupation], 
        c.[HouseOwnerFlag], 
        c.[NumberCarsOwned], 
        c.[AddressLine1], 
        c.[AddressLine2], 
        c.[Phone], 
        c.[DateFirstPurchase], 
        c.[CommuteDistance], 
        x.[Region], 
        x.[Age], 
        CASE x.[Bikes] 
            WHEN 0 THEN 0 
            ELSE 1 
        END AS [BikeBuyer]
    FROM
        [dbo].[DimCustomer] c INNER JOIN (
            SELECT
                [CustomerKey]
                ,[Region]
                ,[Age]
                ,Sum(
                    CASE [EnglishProductCategoryName] 
                        WHEN 'Bikes' THEN 1 
                        ELSE 0 
                    END) AS [Bikes]
            FROM
                [dbo].[vDMPrep] 
            GROUP BY
                [CustomerKey]
                ,[Region]
                ,[Age]
            ) AS [x]
        ON c.[CustomerKey] = x.[CustomerKey]
;

GO

/* vAssocSeqOrders supports assocation and sequence clustering data mmining models.
      - Limits data to FY2020.
      - Returns order case table.*/
CREATE VIEW [dbo].[vAssocSeqOrders]
AS
SELECT DISTINCT OrderNumber, CustomerKey, Region, IncomeGroup
FROM         dbo.vDMPrep
WHERE     (FiscalYear = 2020)
GO

/* vAssocSeqLineItems supports assocation and sequence clustering data mmining models.
      - Limits data to FY2020.
      - Returns line item nested table.*/
CREATE VIEW [dbo].[vAssocSeqLineItems]
AS
SELECT     OrderNumber, LineNumber, Model
FROM         dbo.vDMPrep
WHERE     (FiscalYear = 2020)
GO

CREATE TABLE [dbo].[FactResellerSales](
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[ResellerKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[DueDateKey] [int] NOT NULL,
	[ShipDateKey] [int] NULL,
	[EmployeeKey] [int] NOT NULL,
	[PromotionKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[SalesTerritoryKey] [int] NOT NULL,
	[OrderQuantity] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[ExtendedAmount] [money] NOT NULL,
	[UnitPriceDiscountPct] [decimal](7, 4) NOT NULL,
	[DiscountAmount] [money] NOT NULL,
	[ProductStandardCost] [money] NOT NULL,
	[TotalProductCost] [money] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[TaxAmount] [money] NOT NULL,
	[FreightAmount] [money] NOT NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[CustomerPONumber] [nvarchar](25) NULL,
	[RevisionNumber] [tinyint] NOT NULL)
GO

CREATE VIEW [dbo].[vFactSales]
AS
	SELECT
		CAST(N'Reseller' AS NVARCHAR(10)) AS [Channel]
		,CAST(RIGHT([SalesOrderNumber], (LEN([SalesOrderNumber]) - 2)) AS INT) AS [SalesOrderKey]
		,((CAST(RIGHT([SalesOrderNumber], (LEN([SalesOrderNumber]) - 2)) AS INT) * 1000) + [SalesOrderLineNumber]) AS [SalesOrderLineKey]
		,[SalesOrderNumber]
		,[SalesOrderLineNumber]
		,[ResellerKey]
		,CAST(-1 AS INT) AS [CustomerKey]
		,[ProductKey]
		,[OrderDateKey]
		,[DueDateKey]
		,[ShipDateKey]
		,[PromotionKey]
		,[CurrencyKey]
		,[SalesTerritoryKey]
		,[EmployeeKey]
		,[OrderQuantity]
		,[UnitPrice]
		,[ExtendedAmount]
		,[UnitPriceDiscountPct]
		,[DiscountAmount]
		,[ProductStandardCost]
		,[TotalProductCost]
		,[SalesAmount]
		,[TaxAmount]
		,[FreightAmount]
		,[CarrierTrackingNumber]
		,[CustomerPONumber]
		,[RevisionNumber]
	FROM
		[dbo].[FactResellerSales]
	UNION ALL
	SELECT
		CAST(N'Internet' AS NVARCHAR(10)) AS [Channel]
		,CAST(RIGHT([SalesOrderNumber], (LEN([SalesOrderNumber]) - 2)) AS INT) AS [SalesOrderKey]
		,((CAST(RIGHT([SalesOrderNumber], (LEN([SalesOrderNumber]) - 2)) AS INT) * 1000) + [SalesOrderLineNumber]) AS [SalesOrderLineKey]
		,[SalesOrderNumber]
		,[SalesOrderLineNumber]
		,CAST(-1 AS INT) AS [ResellerKey]
		,[CustomerKey]
		,[ProductKey]
		,[OrderDateKey]
		,[DueDateKey]
		,[ShipDateKey]
		,[PromotionKey]
		,[CurrencyKey]
		,[SalesTerritoryKey]
		,CAST(-1 AS INT) AS [EmployeeKey]
		,[OrderQuantity]
		,[UnitPrice]
		,[ExtendedAmount]
		,[UnitPriceDiscountPct]
		,[DiscountAmount]
		,[ProductStandardCost]
		,[TotalProductCost]
		,[SalesAmount]
		,[TaxAmount]
		,[FreightAmount]
		,[CarrierTrackingNumber]
		,[CustomerPONumber]
		,[RevisionNumber]
	FROM
		[dbo].[FactInternetSales];
GO

CREATE TABLE [dbo].[AdventureWorksDWBuildVersion](
	[DBVersion] [nvarchar](50) NULL,
	[VersionDate] [datetime] NULL
)
GO

CREATE TABLE [dbo].[DimAccount](
	[AccountKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentAccountKey] [int] NULL,
	[AccountCodeAlternateKey] [int] NULL,
	[ParentAccountCodeAlternateKey] [int] NULL,
	[AccountDescription] [nvarchar](50) NULL,
	[AccountType] [nvarchar](50) NULL,
	[Operator] [nvarchar](50) NULL,
	[CustomMembers] [nvarchar](300) NULL,
	[ValueType] [nvarchar](50) NULL,
	[CustomMemberOptions] [nvarchar](200) NULL)

GO
CREATE TABLE [dbo].[DimCurrency](
	[CurrencyKey] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyAlternateKey] [nchar](3) NOT NULL,
	[CurrencyName] [nvarchar](50) NOT NULL,
	[FormatString] [nvarchar](20) NULL)

GO
CREATE TABLE [dbo].[DimDepartmentGroup](
	[DepartmentGroupKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentDepartmentGroupKey] [int] NULL,
	[DepartmentGroupName] [nvarchar](50) NULL)

GO
CREATE TABLE [dbo].[DimEmployee](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentEmployeeKey] [int] NULL,
	[EmployeeNationalIDAlternateKey] [nvarchar](15) NULL,
	[ParentEmployeeNationalIDAlternateKey] [nvarchar](15) NULL,
	[SalesTerritoryKey] [int] NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[NameStyle] [bit] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[HireDate] [date] NULL,
	[BirthDate] [date] NULL,
	[LoginID] [nvarchar](256) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Phone] [nvarchar](25) NULL,
	[MaritalStatus] [nchar](1) NULL,
	[EmergencyContactName] [nvarchar](50) NULL,
	[EmergencyContactPhone] [nvarchar](25) NULL,
	[SalariedFlag] [bit] NULL,
	[Gender] [nchar](1) NULL,
	[PayFrequency] [tinyint] NULL,
	[BaseRate] [money] NULL,
	[VacationHours] [smallint] NULL,
	[SickLeaveHours] [smallint] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SalespersonFlag] [bit] NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[EmployeePhoto] [varbinary](max) NULL)
WITH  
  (   
    CLUSTERED INDEX (EmployeeKey)  
  ); 
GO
CREATE TABLE [dbo].[DimOrganization](
	[OrganizationKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentOrganizationKey] [int] NULL,
	[PercentageOfOwnership] [nvarchar](16) NULL,
	[OrganizationName] [nvarchar](50) NULL,
	[CurrencyKey] [int] NULL)

GO
CREATE TABLE [dbo].[DimPromotion](
	[PromotionKey] [int] IDENTITY(1,1) NOT NULL,
	[PromotionAlternateKey] [int] NULL,
	[EnglishPromotionName] [nvarchar](255) NULL,
	[SpanishPromotionName] [nvarchar](255) NULL,
	[FrenchPromotionName] [nvarchar](255) NULL,
	[DiscountPct] [float] NULL,
	[EnglishPromotionType] [nvarchar](50) NULL,
	[SpanishPromotionType] [nvarchar](50) NULL,
	[FrenchPromotionType] [nvarchar](50) NULL,
	[EnglishPromotionCategory] [nvarchar](50) NULL,
	[SpanishPromotionCategory] [nvarchar](50) NULL,
	[FrenchPromotionCategory] [nvarchar](50) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[MinQty] [int] NULL,
	[MaxQty] [int] NULL)
GO

CREATE TABLE [dbo].[DimReseller](
	[ResellerKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NULL,
	[ResellerAlternateKey] [nvarchar](15) NULL,
	[Phone] [nvarchar](25) NULL,
	[BusinessType] [varchar](20) NOT NULL,
	[ResellerName] [nvarchar](50) NOT NULL,
	[NumberEmployees] [int] NULL,
	[OrderFrequency] [char](1) NULL,
	[OrderMonth] [tinyint] NULL,
	[FirstOrderYear] [int] NULL,
	[LastOrderYear] [int] NULL,
	[ProductLine] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[AnnualSales] [money] NULL,
	[BankName] [nvarchar](50) NULL,
	[MinPaymentType] [tinyint] NULL,
	[MinPaymentAmount] [money] NULL,
	[AnnualRevenue] [money] NULL,
	[YearOpened] [int] NULL)
GO

CREATE TABLE [dbo].[DimSalesReason](
	[SalesReasonKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesReasonAlternateKey] [int] NOT NULL,
	[SalesReasonName] [nvarchar](50) NOT NULL,
	[SalesReasonReasonType] [nvarchar](50) NOT NULL)
GO

CREATE TABLE [dbo].[DimScenario](
	[ScenarioKey] [int] IDENTITY(1,1) NOT NULL,
	[ScenarioName] [nvarchar](50) NULL)
GO

CREATE TABLE [dbo].[FactCallCenter](
	[FactCallCenterID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[WageType] [nvarchar](15) NOT NULL,
	[Shift] [nvarchar](20) NOT NULL,
	[LevelOneOperators] [smallint] NOT NULL,
	[LevelTwoOperators] [smallint] NOT NULL,
	[TotalOperators] [smallint] NOT NULL,
	[Calls] [int] NOT NULL,
	[AutomaticResponses] [int] NOT NULL,
	[Orders] [int] NOT NULL,
	[IssuesRaised] [smallint] NOT NULL,
	[AverageTimePerIssue] [smallint] NOT NULL,
	[ServiceGrade] [float] NOT NULL)
GO

CREATE TABLE [dbo].[FactCurrencyRate](
	[CurrencyKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[AverageRate] [float] NOT NULL,
	[EndOfDayRate] [float] NOT NULL)
GO

CREATE TABLE [dbo].[FactFinance](
	[FinanceKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[OrganizationKey] [int] NOT NULL,
	[DepartmentGroupKey] [int] NOT NULL,
	[ScenarioKey] [int] NOT NULL,
	[AccountKey] [int] NOT NULL,
	[Amount] [money] NOT NULL
) 
GO

CREATE TABLE [dbo].[FactInternetSalesReason](
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[SalesReasonKey] [int] NOT NULL)
GO

CREATE TABLE [dbo].[FactProductInventory](
	[ProductKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[UnitsIn] [int] NOT NULL,
	[UnitsOut] [int] NOT NULL,
	[UnitsBalance] [int] NOT NULL)
GO

CREATE TABLE [dbo].[FactSalesQuota](
	[SalesQuotaKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[SalesAmountQuota] [money] NOT NULL)

GO
