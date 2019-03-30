USE Chess
GO

IF type_id('Tasks.Coordinates') IS NOT NULL
    DROP TYPE Tasks.Coordinates
GO
CREATE TYPE Tasks.Coordinates AS TABLE
(
    X NCHAR NOT NULL CHECK(X >= 'a' AND X <= 'h'),
    Y NCHAR NOT NULL CHECK(Y >= '1' AND Y <= '8')
)
GO