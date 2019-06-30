USE Lira
GO

-- 1)
IF OBJECT_ID('MakeRental', 'P') IS NOT NULL
    DROP PROCEDURE MakeRental
GO
CREATE PROCEDURE MakeRental
    @clientName NVARCHAR(40), 
    @instrumentName NVARCHAR(40),
    @tenancy INT,
    @rentalStartDate DATE = NULL
AS
BEGIN
    IF @rentalStartDate IS NULL
        SET @rentalStartDate = GETDATE()
    
    IF (
        SELECT InStock
        FROM Stock
        WHERE ModelName = @instrumentName
    ) = 0
        THROW 54321, 'RENT_UNAVALIABLR: Model not in stock', 1

    DECLARE @clientId INT = (
        SELECT Id
        FROM Client
        WHERE FullName = @clientName
    )

    DECLARE @stockId INT = (
        SELECT Id
        FROM Stock
        WHERE ModelName = @instrumentName
    )

    INSERT Journal (ClientId, StockId, RentalStartDate, Tenancy)
    VALUES (@clientId, @stockId, @rentalStartDate, @tenancy)

    -- UPDATE Stock
    --     SET InStock = 0
    -- FROM Stock
    -- WHERE Id = @stockId

    DECLARE @rentalPrice INT = (
        SELECT RentalPrice * @tenancy
        FROM Stock
        WHERE ModelName = @instrumentName
    )

    RETURN @rentalPrice
END
GO

-- 2)
IF OBJECT_ID('CheckupInstruments', 'P') IS NOT NULL
    DROP PROCEDURE CheckupInstruments
GO
CREATE PROCEDURE CheckupInstruments 
    @dateOfCheck DATE 
AS
BEGIN
    UPDATE Stock
        SET LastInspectionDate = @dateOfCheck
    FROM 
        Stock
        JOIN 
        Instrument ON Stock.InstrumentId = Instrument.Id
    WHERE 
        InStock = 1 
        AND 
        DATEADD(day, InspectionPeriod, LastInspectionDate) <= @dateOfCheck                                         
END
GO