USE Chess;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ChessCore')
BEGIN
EXEC('CREATE SCHEMA ChessCore')
END

IF OBJECT_ID('ChessCore.Chessboard', 'U') IS NOT NULL
DROP TABLE ChessCore.Chessboard
GO

IF OBJECT_ID('ChessCore.Chessmen', 'U') IS NOT NULL
DROP TABLE ChessCore.Chessmen
GO

CREATE TABLE ChessCore.Chessmen
(
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    ChessType NVARCHAR(40) NOT NULL CHECK(ChessType IN ('king', 'queen', 'rook', 'bishop', 'knight', 'pawn')),
    ChessColor NVARCHAR(40) NOT NULL CHECK(ChessColor IN ('black', 'white'))
);
GO

CREATE TABLE ChessCore.Chessboard
(
    ChessmanId INT NOT NULL PRIMARY KEY REFERENCES ChessCore.Chessmen(Id),
    X NCHAR NOT NULL CHECK(X >= 'a' AND X <= 'h'),
    Y NCHAR NOT NULL CHECK(Y >= '1' AND Y <= '8'),
    UNIQUE(X, Y)
);
GO