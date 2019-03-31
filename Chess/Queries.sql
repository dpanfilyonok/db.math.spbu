USE Chess
GO

/*
AF = статистическая функция (среда CLR);
C = ограничение CHECK;
D = DEFAULT (ограничение или изолированный);
F = ограничение FOREIGN KEY;
PK = ограничение PRIMARY KEY;
P = хранимая процедура SQL;
PC = хранимая процедура сборки (среда CLR);
FN = скалярная функция SQL;
FS = скалярная функция сборки (среда CLR);
FT = возвращающая табличное значение функция сборки (среда CLR);
R = правило (старый стиль, изолированный);
RF = процедура фильтра репликации;
S = системная базовая таблица;
SN = синоним;
SQ = очередь обслуживания;
TA = триггер DML сборки (среда CLR);
TR = триггер DML SQL; 
IF = встроенная возвращающая табличное значение функция SQL;
TF = возвращающая табличное значение функция SQL;
U = таблица (пользовательская);
UQ = ограничение UNIQUE;
V = представление;
X = расширенная хранимая процедура;
IT = внутренняя таблица
*/
SELECT * FROM sys.objects
WHERE type = 'TR'
GO

SELECT * FROM sys.schemas
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
SELECT ChessmanId FROM ChessCore.ChessSummary
WHERE ChessColor = 'white' AND ChessType = 'pawn'
GO

-- 5)
SELECT ChessType, ChessColor FROM ChessCore.ChessSummary
WHERE ASCII(X) - ASCII(Y) = ASCII('a') - ASCII('1')

-- 6)
SELECT ChessColor, Count(*) AS FigureAmount FROM ChessCore.ChessSummary
GROUP BY ChessColor
GO

-- 7)
SELECT DISTINCT ChessType FROM ChessCore.ChessSummary
WHERE ChessColor = 'black'
GO

-- 8)
SELECT DISTINCT ChessType, Count(*) AS FigureAmount FROM ChessCore.ChessSummary
WHERE ChessColor = 'black'
GROUP BY ChessType
GO

-- 9)
SELECT DISTINCT ChessType FROM ChessCore.ChessSummary
GROUP BY ChessType
HAVING COUNT(*) >= 2

-- 10)
SELECT TOP 1 WITH TIES ChessColor FROM ChessCore.ChessSummary
GROUP BY ChessColor
ORDER BY COUNT(*)
GO

-- 11)
SELECT DISTINCT ChessType, ChessColor FROM Tasks.GetFigureCoordinates('rook', 'white') coord
CROSS APPLY Tasks.GetFigureOnRookWay(coord.X, coord.Y)
GO

-- 12)
SELECT ChessColor FROM ChessCore.ChessSummary
WHERE ChessType = 'pawn'
GROUP BY ChessColor 
HAVING COUNT(*) = 8
GO

-- 14)
DECLARE @blackKingCoords Tasks.Coordinates
INSERT INTO @blackKingCoords
    SELECT * FROM Tasks.GetFigureCoordinates('king', 'black')
DECLARE @x NCHAR, @y NCHAR
SET @x = (SELECT TOP 1 X FROM @blackKingCoords)
SET @y = (SELECT TOP 1 Y FROM @blackKingCoords)

SELECT * FROM ChessCore.ChessSummary
WHERE ABS(ASCII(@x) - ASCII(X)) <= 2 
AND ABS(ASCII(@y) - ASCII(Y)) <= 2
GO

-- 15)
DECLARE @whiteKingCoords Tasks.Coordinates
INSERT INTO @whiteKingCoords
    SELECT * FROM Tasks.GetFigureCoordinates('king', 'white')
DECLARE @x NCHAR, @y NCHAR
SET @x = (SELECT TOP 1 X FROM @whiteKingCoords)
SET @y = (SELECT TOP 1 Y FROM @whiteKingCoords)

SELECT TOP 1 WITH TIES *, Tasks.L1Distance(@x, @y, X, Y) AS Distance FROM ChessCore.ChessSummary
WHERE Tasks.L1Distance(@x, @y, X, Y) > 0
ORDER BY Distance
GO