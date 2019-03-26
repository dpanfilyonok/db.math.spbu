USE Chess
GO

IF object_id('ChessCore.GetFigureCoordinates', 'IF') IS NOT NULL
    DROP FUNCTION ChessCore.GetFigureCoordinates
GO

CREATE FUNCTION ChessCore.GetFigureCoordinates(@chessType NVARCHAR(40), @chessColor NVARCHAR(40))
RETURNS TABLE AS
RETURN (
    SELECT X, Y FROM ChessSummary
    WHERE ChessType = @chessType AND ChessColor = @chessColor
)
GO

IF object_id('ChessCore.GetFigureOnRookWay', 'IF') IS NOT NULL
    DROP FUNCTION ChessCore.GetFigureOnRookWay
GO

CREATE FUNCTION ChessCore.GetFigureOnRookWay(@x NCHAR, @y NCHAR)
RETURNS TABLE AS 
RETURN (
    SELECT ChessType, ChessColor FROM ChessSummary
    WHERE X = @x OR Y = @y
)
GO

IF object_id('L1Distance', 'FN') IS NOT NULL
    DROP FUNCTION L1Distance
GO

CREATE FUNCTION L1Distance(@p1x NCHAR, @p1y NCHAR, @p2x NCHAR, @p2y NCHAR)
RETURNS INT AS
BEGIN    
    RETURN ABS(ASCII(@p1X) - ASCII(@p2x)) + ABS(ASCII(@p1y) - ASCII(@p2y))
END
GO

IF object_id('GetFiguresInNeighbourhood', 'IF') IS NOT NULL
    DROP FUNCTION GetFiguresInNeighbourhood
GO

CREATE FUNCTION GetFiguresInNeighbourhood(@xCenter NCHAR, @yCenter NCHAR, @radius INT)
RETURNS TABLE AS
RETURN (
    SELECT *, dbo.L1Distance(@xCenter, @yCenter, X, Y) AS Distance FROM ChessSummary
    WHERE dbo.L1Distance(@xCenter, @yCenter, X, Y) <= @radius
)  
GO
