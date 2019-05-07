USE Chess
GO

IF object_id('Tasks.GetFigureCoordinates', 'IF') IS NOT NULL
    DROP FUNCTION Tasks.GetFigureCoordinates
GO
CREATE FUNCTION Tasks.GetFigureCoordinates(@chessType NVARCHAR(40), @chessColor NVARCHAR(40))
RETURNS TABLE AS
RETURN (
    SELECT X, Y FROM ChessCore.ChessSummary
    WHERE ChessType = @chessType AND ChessColor = @chessColor
)
GO

IF object_id('Tasks.GetFigureOnRookWay', 'IF') IS NOT NULL
    DROP FUNCTION Tasks.GetFigureOnRookWay
GO
CREATE FUNCTION Tasks.GetFigureOnRookWay(@xRookCoord NCHAR, @yRookCoord NCHAR)
RETURNS TABLE AS 
RETURN (
    SELECT ChessType, ChessColor FROM ChessCore.ChessSummary
    WHERE X = @xRookCoord OR Y = @yRookCoord
)
GO

IF object_id('Tasks.L1Distance', 'FN') IS NOT NULL
    DROP FUNCTION Tasks.L1Distance
GO
CREATE FUNCTION Tasks.L1Distance(@p1x NCHAR, @p1y NCHAR, @p2x NCHAR, @p2y NCHAR)
RETURNS INT AS
BEGIN    
    RETURN ABS(ASCII(@p1X) - ASCII(@p2x)) + ABS(ASCII(@p1y) - ASCII(@p2y))
END
GO

IF object_id('Tasks.GetFiguresInNeighbourhood', 'IF') IS NOT NULL
    DROP FUNCTION Tasks.GetFiguresInNeighbourhood
GO
CREATE FUNCTION Tasks.GetFiguresInNeighbourhood(@xCenter NCHAR, @yCenter NCHAR, @radius INT)
RETURNS TABLE AS
RETURN (
    SELECT *, Tasks.L1Distance(@xCenter, @yCenter, X, Y) AS Distance FROM ChessCore.ChessSummary
    WHERE Tasks.L1Distance(@xCenter, @yCenter, X, Y) <= @radius
)  
GO
