TestCase subclass: GameStateTest [
  | state board |
  
  tearDown [
    state := nil.
    board := nil.
  ]
  
  testReturnsP1WinOnRow1 [
    board := Board from: 'XXX      ' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player1won
  ]
  
  testReturnsP1WinOnRow2 [
    board := Board from: '   XXX   ' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player1won
  ]
  
  testReturnsP1WinOnRow3 [
    board := Board from: '      XXX' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player1won
  ]
  
  testReturnsP2WinOnRow1 [
    board := Board from: 'OOO      ' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player2won
  ]
  
  testReturnsP2WinOnRow2 [
    board := Board from: '   OOO   ' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player2won
  ]
  
  testReturnsP2WinOnRow3 [
    board := Board from: '      OOO' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player2won
  ]
  
  testReturnsP1WinOnColumn1 [
    board := Board from: 'X  X  X  ' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player1won
  ]
  
  testReturnsP1WinOnColumn2 [
    board := Board from: ' X  X  X ' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player1won
  ]
  
  testReturnsP1WinOnColumn3 [
    board := Board from: '  X  X  X' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player1won
  ]
  
  testReturnsP2WinOnColumn1 [
    board := Board from: 'O  O  O  ' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player2won
  ]
  
  testReturnsP2WinOnColumn2 [
    board := Board from: ' O  O  O ' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player2won
  ]
  
  testReturnsP2WinOnColumn3 [
    board := Board from: '  O  O  O' width: 3 height: 3.
    state := GameState board: board player1: #X player2: #O.
    self assert: state = #player2won
  ]

]