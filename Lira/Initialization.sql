USE Lira
GO

-- instuments filling
INSERT Instrument (InstrumentType, InspectionPeriod) 
VALUES 
    (N'Лира', 60),
    (N'Электрогитара', 10),
    (N'Синтезатор', 30),
    (N'Барабаны', 50),
    (N'Флейта', 5)
GO

-- stock 
INSERT Stock (ModelName, InstrumentId, RentalPrice) 
VALUES 
    (N'Пентатоника, 7 струн', 1, 300),
    (N'Gibson SG', 2, 400),
    (N'PRS Custom 24', 2, 1000),
    (N'Aria pro 2, 7 струн', 2, 200),
    (N'Casio CTK-2400', 3, 500),
    (N'Roland TD-1DMK', 4, 1000),
    (N'Yamaha RDP2F5 (Black Glitter)', 4, 700),
    (N'Yamaha Venova ZY33700', 5, 100)
GO

-- client base
INSERT Client (FullName, ResidenceAddress, PhoneNumber)
VALUES 
    (N'Иванов Иван Иванович', N'Пушкина, 27', '559988'),
    (N'Илья Петрович Сидоров', N'Ленина, 17', '89456932288'),
    (N'Комаров Петр Александрович', N'Садовая, 5', '761541')
GO

-- first in journal
-- INSERT Journal (ClientId, StockId, Tenancy) 
-- VALUES 
--     (1, 1, 1),
--     (2, 2, 2),
--     (2, 7, 7)
-- GO
