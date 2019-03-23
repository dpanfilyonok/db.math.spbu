USE Chess
GO

SELECT * FROM ChessCore.Chessmen
GO

SELECT * FROM ChessCore.Chessboard
GO

CREATE VIEW ChessSummary AS 
SELECT * FROM ChessCore.Chessboard INNER JOIN ChessCore.Chessmen
ON ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
GO

SELECT ASCII('a');
SELECT ASCII('1');
GO

-- 1)
SELECT COUNT(*) AS ChessCount FROM ChessCore.Chessboard
GO

-- 2)
SELECT Id FROM ChessCore.Chessmen
WHERE ChessType LIKE 'k%'
GO

-- 3)
SELECT ChessType, Count(*) AS TypeCount FROM ChessCore.Chessmen
GROUP BY ChessType
ORDER BY TypeCount DESC
GO

-- 4)
SELECT ChessmanId FROM ChessSummary
WHERE ChessColor = 'white' AND ChessType = 'pawn'
GO

-- 5)
SELECT ChessType, ChessColor FROM ChessSummary
WHERE ASCII(X) - ASCII(Y) = ASCII('a') - ASCII('1')

-- 6)
SELECT ChessColor, Count(*) AS FigureAmount FROM ChessSummary
GROUP BY ChessColor
GO

-- 7)
SELECT DISTINCT ChessType FROM ChessSummary
WHERE ChessColor = 'black'
GO

-- 8)
SELECT DISTINCT ChessType, Count(*) AS FigureAmount FROM ChessSummary
WHERE ChessColor = 'black'
GROUP BY ChessType
GO

-- 9)
SELECT DISTINCT ChessType FROM ChessSummary
GROUP BY ChessType
HAVING COUNT(*) >= 2

-- 10)
SELECT TOP 1 WITH TIES ChessColor FROM ChessSummary
GROUP BY ChessColor
ORDER BY COUNT(*)
GO

-- 11)
CREATE FUNCTION GetFigureCoordinates(@chessType NVARCHAR(40), @chessColor NVARCHAR(40))
RETURNS TABLE AS
RETURN (
    SELECT X, Y FROM ChessSummary
    WHERE ChessType = @chessType AND ChessColor = @chessColor
)
GO

CREATE FUNCTION GetFigureOnRookWay(@x NCHAR, @y NCHAR)
RETURNS TABLE AS 
RETURN (
    SELECT ChessType, ChessColor FROM ChessSummary
    WHERE X = @x OR Y = @y
)
GO

SELECT DISTINCT ChessType, ChessColor FROM dbo.GetFigureCoordinates('rook', 'white') coord
CROSS APPLY dbo.GetFigureOnRookWay(coord.X, coord.Y)
GO