USE Chess
GO

SELECT * FROM ChessCore.Chessmen
GO

SELECT * FROM ChessCore.Chessboard
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
SELECT DISTINCT ChessType, ChessColor FROM dbo.GetFigureCoordinates('rook', 'white') coord
CROSS APPLY dbo.GetFigureOnRookWay(coord.X, coord.Y)
GO