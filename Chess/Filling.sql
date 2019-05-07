USE Chess;
GO

-- filling chessmen table
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'knight', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'knight', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'bishop', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'bishop', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'rook  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'rook  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'queen ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'king  ', N'white')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'pawn  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'knight', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'knight', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'bishop', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'bishop', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'rook  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'rook  ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'queen ', N'black')
GO
INSERT ChessCore.Chessmen (ChessType, ChessColor) VALUES (N'king  ', N'black')
GO

-- filling chessboard table
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (13, 'a', '1')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (14, 'h', '1')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (9, 'b', '1')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (10, 'g', '1')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (11, 'c', '1')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (12, 'f', '1')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (15, 'd', '1')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (16, 'e', '1')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (1, 'a', '2')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (2, 'b', '2')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (3, 'c', '2')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (4, 'd', '2')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (5, 'e', '2')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (6, 'f', '2')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (7, 'g', '2')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (8, 'h', '2')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (29, 'a', '8')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (30, 'h', '8')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (25, 'b', '8')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (26, 'g', '8')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (27, 'c', '8')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (28, 'f', '8')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (31, 'd', '8')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (32, 'e', '8')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (17, 'a', '7')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (18, 'b', '7')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (19, 'c', '7')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (20, 'd', '7')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (21, 'e', '7')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (22, 'f', '7')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (23, 'g', '7')
GO
INSERT ChessCore.Chessboard (ChessmanId, X, Y) VALUES (24, 'h', '7')
GO