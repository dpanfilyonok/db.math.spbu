USE Chess
GO

SELECT * FROM ChessCore.Chessmen
GO

SELECT * FROM ChessCore.Chessboard
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
SELECT ChessmanId FROM ChessCore.Chessboard INNER JOIN ChessCore.Chessmen
ON ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
AND ChessColor = 'white'
AND ChessType = 'pawn'
GO

-- 5)


-- 6)
SELECT ChessColor, Count(*) AS FigureAmount FROM ChessCore.Chessboard INNER JOIN ChessCore.Chessmen
ON ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
GROUP BY ChessColor
GO

-- 7)
SELECT DISTINCT ChessType FROM ChessCore.Chessboard INNER JOIN ChessCore.Chessmen
ON ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
AND ChessColor = 'black'
GO

-- 8)
SELECT DISTINCT ChessType, Count(*) AS FigureAmount FROM ChessCore.Chessboard INNER JOIN ChessCore.Chessmen
ON ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
AND ChessColor = 'black'
GROUP BY ChessType
GO

-- 9)
SELECT DISTINCT ChessType FROM ChessCore.Chessboard INNER JOIN ChessCore.Chessmen
ON ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
GROUP BY ChessType
HAVING COUNT(*) >= 2

-- 10)
SELECT TOP 1 WITH TIES ChessColor  FROM ChessCore.Chessboard INNER JOIN ChessCore.Chessmen
ON ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
GROUP BY ChessColor
ORDER BY COUNT(*)
GO

-- 12)
