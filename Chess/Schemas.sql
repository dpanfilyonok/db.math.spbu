USE Chess
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ChessCore')
BEGIN
    EXEC('CREATE SCHEMA ChessCore')
END
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Tasks')
BEGIN
    EXEC('CREATE SCHEMA Tasks')
END
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Logging')
BEGIN
    EXEC('CREATE SCHEMA Logging')
END
GO