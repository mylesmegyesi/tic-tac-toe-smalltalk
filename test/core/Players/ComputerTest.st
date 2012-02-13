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
  
  recurse: board [
    | p1Board p1State computer p2State |
    (board coordinatesWhere: [ :cell | 
      cell = #' ' ]) do: [ :coordinate |
      p1Board := board copy coord: coordinate marker: #X.
      p1State := GameState board: p1Board player1: #X player2: #O empty: empty.
      p1State over ifTrue: [
        self assert: p1State winner ~= #X
      ] ifFalse: [
        computer := Computer marker: #O otherPlayer: otherPlayer empty: empty.
        computer makeMove: p1Board.
        p2State := GameState board: p1Board player1: #X player2: #O empty: empty.
        p2State over ifTrue: [
          self assert: p2State winner ~= #X
        ] ifFalse: [
          self recurse: p1Board
        ]
      ]
    ]
  ]
  
  testDoesNotLose [
    self recurse: (Board from: '         ')
  ]
  
]