USE Lira
GO

IF OBJECT_ID('Journal', 'U') IS NOT NULL
    DROP TABLE Journal
GO
IF OBJECT_ID('Stock', 'U') IS NOT NULL
    DROP TABLE Stock
GO
IF OBJECT_ID('Instrument', 'U') IS NOT NULL
    DROP TABLE Instrument
GO
IF OBJECT_ID('Client', 'U') IS NOT NULL
    DROP TABLE Client
GO

CREATE TABLE Instrument 
(
    Id INT PRIMARY KEY IDENTITY,
    InstrumentType NVARCHAR(20) NOT NULL UNIQUE,
    InspectionPeriod INT NOT NULL CHECK(InspectionPeriod > 0) -- в днях
)
GO

CREATE TABLE Stock
(
    Id INT PRIMARY KEY IDENTITY,
    ModelName NVARCHAR(40) NOT NULL,
    InstrumentId INT NOT NULL REFERENCES Instrument(Id),
    RentalPrice INT NOT NULL CHECK(RentalPrice > 1), -- в день
    LastInspectionDate DATE NOT NULL DEFAULT GETDATE(),
    InStock BIT NOT NULL DEFAULT 1
)
GO

CREATE TABLE Client
(
    Id INT PRIMARY KEY IDENTITY, 
    FullName NVARCHAR(40) NOT NULL, 
    ResidenceAddress NVARCHAR(40) NOT NULL,
    PhoneNumber NVARCHAR(40) NOT NULL CHECK(PhoneNumber NOT LIKE '%[A-Za-z]%')
)
GO

CREATE TABLE Journal
(
    RecordId INT PRIMARY KEY IDENTITY,
    ClientId INT NOT NULL REFERENCES Client(Id),
    StockId INT NOT NULL REFERENCES Stock(Id),
    RentalStartDate DATETIME NOT NULL DEFAULT GETDATE(),
    Tenancy INT NOT NULL CHECK (Tenancy > 0)
)
GO