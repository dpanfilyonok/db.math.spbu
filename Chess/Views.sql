USE Chess
GO

DROP VIEW IF EXISTS dbo.ChessSummary
GO

CREATE VIEW ChessSummary AS 
SELECT * FROM ChessCore.Chessboard INNER JOIN ChessCore.Chessmen
ON ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
GO
