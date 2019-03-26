USE Chess
GO

IF type_id('ChessCore.Coordinates') IS NOT NULL
        DROP TYPE ChessCore.Coordinates

CREATE TYPE ChessCore.Coordinates AS TABLE
(
    X NCHAR NOT NULL CHECK(X >= 'a' AND X <= 'h'),
    Y NCHAR NOT NULL CHECK(Y >= '1' AND Y <= '8')
)
GO