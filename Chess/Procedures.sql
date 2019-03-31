USE Chess
GO

IF OBJECT_ID('ChessCore.MakeMove', 'P') IS NOT NULL
    DROP PROCEDURE ChessCore.MakeMove
GO
CREATE PROCEDURE ChessCore.MakeMove(
    @xFrom NCHAR, @yFrom NCHAR, 
    @xTo NCHAR, @yTo NCHAR
) AS
BEGIN
    DECLARE @fromId INT, @toId INT
    SET @fromId = (
            SELECT Id FROM ChessCore.ChessSummary
            WHERE X = @xFrom AND Y = @yFrom
        )
    SET @toId = (
            SELECT Id FROM ChessCore.ChessSummary
            WHERE X = @xTo AND Y = @yTo
        )

    IF @toId = NULL 
        UPDATE ChessCore.Chessboard
            SET X = @xTo, Y = @yTo
            WHERE ChessmanId = @fromId
    ELSE
        IF (SELECT ChessColor FROM ChessCore.ChessSummary WHERE Id = @fromId) = 
        (SELECT ChessColor FROM ChessCore.ChessSummary WHERE Id = @toId)
            THROW 50001, 'abc', 1
        ELSE
            DELETE FROM ChessCore.Chessboard WHERE ChessmanId = @toId
            UPDATE ChessCore.Chessboard
                SET X = @xTo, Y = @yTo
                WHERE ChessmanId = @fromId
END
GO
