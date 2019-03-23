USE Chess
GO

DROP FUNCTION IF EXISTS GetFigureCoordinates
GO

CREATE FUNCTION GetFigureCoordinates(@chessType NVARCHAR(40), @chessColor NVARCHAR(40))
RETURNS TABLE AS
RETURN (
    SELECT X, Y FROM ChessSummary
    WHERE ChessType = @chessType AND ChessColor = @chessColor
)
GO

DROP FUNCTION IF EXISTS GetFigureOnRookWay
GO

CREATE FUNCTION GetFigureOnRookWay(@x NCHAR, @y NCHAR)
RETURNS TABLE AS 
RETURN (
    SELECT ChessType, ChessColor FROM ChessSummary
    WHERE X = @x OR Y = @y
)
GO