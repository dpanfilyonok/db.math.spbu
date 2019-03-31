USE Chess
GO

IF OBJECT_ID('ChessCore.LogPieceEatingOnChessboard', 'TR') IS NOT NULL
    DROP TRIGGER ChessCore.LogPieceEatingOnChessboard
GO
CREATE TRIGGER ChessCore.LogPieceEatingOnChessboard ON ChessCore.Chessboard
AFTER DELETE AS
    INSERT INTO Logging.MoveHistory (ChessmanId, MoveInfo)
        SELECT ChessmanId, ChessColor + ' ' + ChessType + ' on ' + deleted.X + deleted.Y + ' was eaten'
        FROM deleted CROSS JOIN ChessCore.Chessmen
GO

IF OBJECT_ID('ChessCore.LogMoveOnChessboard', 'TR') IS NOT NULL
    DROP TRIGGER ChessCore.LogMoveOnChessboard
GO
CREATE TRIGGER ChessCore.LogMoveOnChessboard ON ChessCore.Chessboard
AFTER UPDATE AS
    INSERT INTO Logging.MoveHistory (ChessmanId, MoveInfo)
        SELECT inserted.ChessmanId, deleted.X + deleted.Y + ' -> ' + inserted.X + inserted.Y
        FROM deleted CROSS JOIN inserted
GO
