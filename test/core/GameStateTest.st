TestCase subclass: GameStateTest [
  | state board |
  
  tearDown [
    state := nil.
    board := nil.
  ]
  
  testReturnsP1WinOnRow1 [
    board := Board from: 'XXX      '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #X
  ]
  
  testReturnsP1WinOnRow2 [
    board := Board from: '   XXX   '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #X
  ]
  
  testReturnsP1WinOnRow3 [
    board := Board from: '      XXX'.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #X
  ]
  
  testReturnsP2WinOnRow1 [
    board := Board from: 'OOO      '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #O
  ]
  
  testReturnsP2WinOnRow2 [
    board := Board from: '   OOO   '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #O
  ]
  
  testReturnsP2WinOnRow3 [
    board := Board from: '      OOO'.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #O
  ]
  
  testReturnsP1WinOnColumn1 [
    board := Board from: 'X  X  X  '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #X
  ]
  
  testReturnsP1WinOnColumn2 [
    board := Board from: ' X  X  X '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #X
  ]
  
  testReturnsP1WinOnColumn3 [
    board := Board from: '  X  X  X'.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #X
  ]
  
  testReturnsP2WinOnColumn1 [
    board := Board from: 'O  O  O  '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #O
  ]
  
  testReturnsP2WinOnColumn2 [
    board := Board from: ' O  O  O '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #O
  ]
  
  testReturnsP2WinOnColumn3 [
    board := Board from: '  O  O  O'.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #O
  ]
  
  testReturnsP1WinOnDiagonal1 [
    board := Board from: 'X   X   X'.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #X
  ]
  
  testReturnsP1WinOnDiagonal2 [
    board := Board from: '  X X X  '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #X
  ]
  
  testReturnsP2WinOnDiagonal1 [
    board := Board from: 'O   O   O'.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #O
  ]
  
  testReturnsP2WinOnDiagonal2 [
    board := Board from: '  O O O  '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = #O
  ]
  
  testReturnsDrawForADraw [
    board := Board from: 'XOXXOOOXX'.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = true.
    self assert: state winner = nil
  ]
  
  testReturnsPlayingIFNoOneHasOneAndTheBoardIsNotFull [
    board := Board from: 'XOXXOOOX '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: state over = false.
  ]
  
  testScoreReturns1000IfGivenPlayerIsTheSameAsWinner [
    board := Board from: '  O O O  '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: (state scoreFor: #O) = 1000
  ]
  
  testScoreReturnsNegative1000IfGivenPlayerIsTheSameAsWinner [
    board := Board from: '  O O O  '.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: (state scoreFor: #X) = -1000
  ]
  
  testReturns0ForADraw [
    board := Board from: 'XOXXOOOXX'.
    state := GameState board: board player1: #X player2: #O empty: #' '.
    self assert: (state scoreFor: #O) = 0
  ]

]