TestCase subclass: ComputerTest [
  | board player otherPlayer empty |
  
  setUp [
    otherPlayer := Player marker: #X.
    empty := #' '.
  ]
  
  tearDown [
    board := nil
  ]
  
  testGetsTheOtherPlayersMarker [
    player := Computer marker: #O otherPlayer: otherPlayer empty: empty.
    self assert: (player getOtherPlayersMarker: #O) = #X.
    self assert: (player getOtherPlayersMarker: #X) = #O
  ]
  
  testBlocksOnColumns [
    board := Board from: 'X O OXX O'.
    player := Computer marker: #O otherPlayer: otherPlayer empty: empty.
    player makeMove: board.
    self assert: (board x: 1 y: 2) = #O
  ]
  
  testBlocksOnDiagonal1 [ 
    board := Board from: 'X   X    '.
    player := Computer marker: #O otherPlayer: otherPlayer empty: empty.
    player makeMove: board.
    self assert: (board x: 3 y: 3) = #O
  ]
  
  testBlocksOnDiagonal2 [ 
    board := Board from: '  XOXX  O'.
    player := Computer marker: #O otherPlayer: otherPlayer empty: empty.
    player makeMove: board.
    self assert: (board x: 1 y: 3) = #O
  ]
  
  testPicksMoreImmediateMoves [
    board := Board from: '    X  XO'.
    player := Computer marker: #O otherPlayer: otherPlayer empty: empty.
    player makeMove: board.
    self assert: (board x: 2 y: 1) = #O
  ]
  
]