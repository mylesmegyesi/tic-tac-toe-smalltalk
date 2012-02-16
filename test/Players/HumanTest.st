TestCase subclass: HumanTest [
  | IO player board |
  
  setUp [
    IO := MockIO new.
  ]
  
  testMakesAMoveFromTheIO [
    player := Human marker: #X.
    board := Board from: 'X OO' player1: #X player2: #O empty: #' '.
    IO addMove: 2.
    player setIO: IO.
    player makeMove: board.
    self assert: (board x: 2 y: 1) = #X
  ]
  
  testContinuesToAskTheUserForAMoveUntilAValidOneIsGiven [
    player := Human marker: #X.
    board := Board from: 'X OO' player1: #X player2: #O empty: #' '.
    IO addMove: 2.
    IO throwOnGetMove: true.
    player setIO: IO.
    player makeMove: board.
    self assert: IO getMoveCalledCount = 2.
    self assert: (board x: 2 y: 1) = #X.
  ]
  
]
