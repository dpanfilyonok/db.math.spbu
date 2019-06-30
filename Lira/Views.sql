USE Lira
GO

IF object_id('JournalStockInstrument', 'V') IS NOT NULL
    DROP VIEW JournalStockInstrument
GO
CREATE VIEW JournalStockInstrument  
AS
    SELECT 
        RecordId, 
        ClientId,
        StockId,
        RentalStartDate,
        Tenancy,
        ModelName, 
        InstrumentId,
        RentalPrice,
        LastInspectionDate,
        InStock,
        InstrumentType,
        InspectionPeriod
    FROM
        Journal
        JOIN
        Stock ON Journal.StockId = Stock.Id
        JOIN
        Instrument ON Instrument.Id = Stock.InstrumentId
GO