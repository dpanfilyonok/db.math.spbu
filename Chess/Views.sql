USE Chess
GO

IF object_id('ChessCore.ChessSummary', 'V') IS NOT NULL
    DROP VIEW ChessCore.ChessSummary
GO
CREATE VIEW ChessCore.ChessSummary AS 
    SELECT * FROM ChessCore.Chessboard INNER JOIN ChessCore.Chessmen
    ON ChessCore.Chessboard.ChessmanId = ChessCore.Chessmen.Id
GO
