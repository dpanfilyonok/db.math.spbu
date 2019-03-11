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
SELECT ChessmanId FROM ChessCore.Chessboard, ChessCore.Chessmen
WHERE ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
AND ChessColor = 'white'
AND ChessType = 'pawn'
GO