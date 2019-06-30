USE Lira
GO

--1)
DECLARE @price INT
EXEC @price = MakeRental N'Иванов Иван Иванович', N'Пентатоника, 7 струн', 8

SELECT * FROM Journal
SELECT * FROM Stock
SELECT CAST(@price as varchar(10))
GO

SELECT * FROM Stock

--3)
SELECT * FROM Stock
UPDATE Stock
    SET RentalPrice = 2 * RentalPrice
FROM (
    SELECT StockId
    FROM Journal t1
    WHERE (
            SELECT COUNT(*) 
            FROM Journal t2 
            WHERE t2.StockId = t1.StockId) > 1
) AS vib
WHERE Stock.Id = vib.StockId
SELECT * FROM Stock
GO

---
CREATE FUNCTION GetAmountInStock(@instrId INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM Stock
        WHERE InstrumentId = @instrId AND InStock = 1
    )
END
GO

CREATE FUNCTION GetIdOfInstr(@instName NVARCHAR(20)) RETURNS INT AS
BEGIN
    RETURN (
        SELECT Id FROM Instrument WHERE InstrumentType = @instName
    )
END
GO

SELECT 
    InstrumentType , 
    InStock, 
    dbo.GetAmountInStock(dbo.GetIdOfInstr(InstrumentType)) AS InStockAmount
FROM (
    SELECT InstrumentType, COUNT(*) AS InStock
    FROM 
        Instrument
        JOIN
        Stock ON Instrument.Id = Stock.InstrumentId
    GROUP BY InstrumentType
) AS vib

---
EXEC MakeRental N'Иванов Иван Иванович', N'Пентатоника, 7 струн', 8

DECLARE @price INT
EXEC @price = MakeRental N'Иванов Иван Иванович', N'Gibson SG', 5
SELECT @price

EXEC MakeRental N'Иванов Иван Иванович', N'Yamaha RDP2F5 (Black Glitter)', 10
EXEC MakeRental N'Иванов Иван Иванович', N'Roland TD-1DMK', 7


---
SELECT * FROM Stock
EXEC ReduceRentalCost
SELECT * FROM Stock

---
DECLARE @x DATE = DATEADD(day, 5, GETDATE())
EXEC CheckupInstruments @x
SELECT * FROM Stock

DECLARE @y DATE = DATEADD(day, 10, GETDATE())
EXEC CheckupInstruments @y
SELECT * FROM Stock

GO
-- EXEC MakeRental N'Иванов Иван Иванович', N'Gibson SG', 20

-- EXEC MakeRental N'Иванов Иван Иванович', N'Yamaha RDP2F5 (Black Glitter)', 10

SELECT * FROM Journal