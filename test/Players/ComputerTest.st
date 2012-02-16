TestCase subclass: ComputerTest [
  | board player otherPlayer |
  
  setUp [
    otherPlayer := #X.
  ]
  
  tearDown [
    board := nil
  ]
  
  testBlocksOnColumns [
    board := Board from: 'X O OXX O' player1: #X player2: #O empty: #' '.
    player := Computer marker: #O.
    player makeMove: board.
    self assert: (board x: 1 y: 2) = #O
  ]
  
  testBlocksOnDiagonal1 [ 
    board := Board from: 'X   X    ' player1: #X player2: #O empty: #' '.
    player := Computer marker: #O.
    player makeMove: board.
    self assert: (board x: 3 y: 3) = #O
  ]
  
  testBlocksOnDiagonal2 [ 
    board := Board from: '  XOXX  O' player1: #X player2: #O empty: #' '.
    player := Computer marker: #O.
    player makeMove: board.
    self assert: (board x: 1 y: 3) = #O
  ]
  
  testPicksMoreImmediateMoves [
    board := Board from: '    X  XO' player1: #X player2: #O empty: #' '.
    player := Computer marker: #O.
    player makeMove: board.
    self assert: (board x: 2 y: 1) = #O
  ]
  
  recurse: board [
    | p1Board p1State computer p2State |
    board emptyCells do: [ :index |
      p1Board := board copy placeMarker: #X index: index.
      p1State := GameState board: p1Board.
      p1State over ifTrue: [
        self assert: p1State winner ~= #X
      ] ifFalse: [
        computer := Computer marker: #O.
        computer makeMove: p1Board.
        p2State := GameState board: p1Board.
        p2State over ifTrue: [
          self assert: p2State winner ~= #X
        ] ifFalse: [
          self recurse: p1Board
        ]
      ]
    ]
  ]
  
  testDoesNotLose [
    self recurse: (Board from: '         ' player1: #X player2: #O empty: #' ')
  ]
  
]
