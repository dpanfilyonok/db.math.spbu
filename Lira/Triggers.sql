USE Lira
GO

IF OBJECT_ID('ChangeInStockStatusAfterInsertionInJournal', 'TR') IS NOT NULL
    DROP TRIGGER ChangeInStockStatusAfterInsertionInJournal
GO
CREATE TRIGGER ChangeInStockStatusAfterInsertionInJournal
    ON Journal
    AFTER INSERT 
AS
    UPDATE Stock
        SET InStock = 0
    WHERE 
        Id IN (SELECT StockId FROM inserted)
GO

IF OBJECT_ID('ThrowExceptionIfInStockAndMakeInspection', 'TR') IS NOT NULL
    DROP TRIGGER ThrowExceptionIfInStockAndMakeInspection
GO
CREATE TRIGGER ThrowExceptionIfInStockAndMakeInspection
    ON Stock
    INSTEAD OF UPDATE 
AS
    IF EXISTS (SELECT * FROM deleted WHERE InStock = 0)
        THROW 25891, 'Instrument in rent', 1 

    UPDATE Stock
        SET ModelName = inserted.ModelName,
            InstrumentId = inserted.InstrumentId,
            RentalPrice = inserted.RentalPrice,
            LastInspectionDate = inserted.LastInspectionDate,
            InStock = inserted.InStock
    FROM 
        inserted
    WHERE
        inserted.Id = Stock.Id
GO

DISABLE TRIGGER ThrowExceptionIfInStockAndMakeInspection ON Stock
GO