USE Lira
GO

IF object_id('GetInfo', 'IF') IS NOT NULL
    DROP FUNCTION GetInfo
GO
CREATE FUNCTION GetInfo()
RETURNS TABLE AS
RETURN
(
    SELECT 
        StockId, 
        InstrumentType, 
        ModelName, 
        RentalPrice 
    FROM 
        JournalStockInstrument t1
    WHERE (
            SELECT COUNT(*) 
            FROM JournalStockInstrument t2 
            WHERE t2.StockId = t1.StockId) > 1
) 
GO

IF object_id('ReduceRentalCost', 'P') IS NOT NULL
    DROP PROCEDURE ReduceRentalCost
GO
CREATE PROCEDURE ReduceRentalCost
    @coefficient FLOAT = 0.7 
AS
BEGIN
    DECLARE @oldTable TABLE 
    (
        Id INT,
        InstrumentType NVARCHAR(20),
        InstrumentModel NVARCHAR(40), 
        OldPrice INT
    )
    INSERT INTO
        @oldTable
    SELECT * FROM dbo.GetInfo()

    UPDATE Stock
        SET RentalPrice = @coefficient * RentalPrice
    FROM (
        SELECT StockId
        FROM Journal t1
        WHERE (
                SELECT COUNT(*) 
                FROM Journal t2 
                WHERE t2.StockId = t1.StockId) > 1
    ) AS vib
    WHERE Stock.Id = vib.StockId

    DECLARE @newTable TABLE 
    (
        Id INT,
        InstrumentType NVARCHAR(20),
        InstrumentModel NVARCHAR(40), 
        NewPrice INT
    )
    INSERT INTO 
        @newTable
    SELECT * FROM dbo.GetInfo()

    SELECT DISTINCT
        old.Id, 
        old.InstrumentType, 
        old.InstrumentModel, 
        OldPrice, 
        NewPrice
    FROM
        @oldTable AS old
        JOIN
        @newTable AS new ON old.Id = new.Id
END
GO
