USE Lira
GO

-- 1)
SELECT 
    FullName, 
    InstrumentType, 
    ModelName, 
    RentalStartDate 
FROM 
    Journal
    JOIN 
    Client ON Journal.ClientId = Client.Id
    JOIN
    Stock ON Journal.StockId = Stock.Id 
    JOIN
    Instrument ON Stock.InstrumentId = Instrument.Id
GO

-- 2)
SELECT *
FROM 
    Stock
    JOIN 
    Instrument ON Stock.InstrumentId = Instrument.Id
WHERE 
    DATEADD(day, InspectionPeriod, LastInspectionDate) <= GETDATE()
GO

-- 3)
SELECT 
    StockId AS DrumId, 
    ModelName, 
    FullName AS Client, 
    RentalStartDate
FROM 
    Journal
    JOIN 
    Client ON Journal.ClientId = Client.Id
    JOIN
    Stock ON Journal.StockId = Stock.Id 
    JOIN 
    Instrument ON Stock.InstrumentId = Instrument.Id
WHERE 
    InstrumentType = N'Барабаны'
GO

-- 4)
SELECT Id, ModelName
FROM Stock
WHERE RentalPrice >= 100 AND RentalPrice <= 200
GO

-- 5)
SELECT 
    Stock.Id AS InstrumentId, 
    InstrumentType, 
    RentalPrice, 
    InspectionPeriod, 
    LastInspectionDate
FROM
    Journal
    JOIN
    Stock ON Journal.StockId = Stock.Id
    JOIN
    Instrument ON Instrument.Id = Stock.InstrumentId
GO

-- 6)
SELECT 
    FullName, 
    ResidenceAddress, 
    PhoneNumber
FROM
    Journal
    JOIN
    Client ON Journal.ClientId = Client.Id
WHERE 
    DATEADD(day, Tenancy, RentalStartDate) > GETDATE()
GO

-- 7)
SELECT Id
FROM Stock
WHERE InStock = 1

-- 8)
SELECT 
    ClientId, 
    SUM(RentalPrice * Tenancy) AS TotalCost
FROM 
    Journal
    JOIN
    Stock ON Journal.StockId = Stock.Id
    JOIN
    Instrument ON Instrument.Id = Stock.InstrumentId
GROUP BY 
    ClientId 
GO

-- 9)
SELECT 
    InstrumentId, 
    AVG(RentalPrice * Tenancy) AS AverageRevenue
FROM 
    Journal
    JOIN
    Stock ON Journal.StockId = Stock.Id
    JOIN
    Instrument ON Instrument.Id = Stock.InstrumentId
GROUP BY 
    InstrumentId 
GO

-- 10)
SELECT  
    InstrumentId, 
    COUNT(*) AS TimesInRent
FROM 
    Journal
    JOIN
    Stock ON Journal.StockId = Stock.Id
    JOIN
    Instrument ON Instrument.Id = Stock.InstrumentId
GROUP BY 
    InstrumentId 
GO
