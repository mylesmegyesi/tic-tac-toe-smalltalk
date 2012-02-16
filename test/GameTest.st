TestCase subclass: GameTest [
  | game io |
  
  setUp [
    io := MockIO new.
    game := Game io: io.
  ]

  testSetupCorrectly [
    self assert: game io = io.
    self assert: game currentPlayer class name = #Human.
    self assert: game currentPlayer io = io.
    self assert: game waitingPlayer class name = #Computer.
    self assert: game board class name = #Board.
    self assert: game board size = 3.
  ]
  
  testDetectsAGameOverAfterOneMove [
    game board: (Board from: 'XOXOO XXO' player1: #X player2: #O empty: #' ').
    io addMove: 6.
    game run.
    self assert: io gameOverCalledCount = 1.
    self assert: io gameOverState class name = #GameState.
    self assert: io gameOverState over = true.
    self assert: io gameOverState winner= nil.
  ]
  
  testDetectsAComputerWinOnDiagonal2 [
    io addMove: 1.
    io addMove: 4.
    io addMove: 2.
    game run.
    self assert: io gameOverCalledCount = 1.
    self assert: io gameOverState class name = #GameState.
    self assert: io gameOverState over = true.
    self assert: io gameOverState winner = #O.
  ]
  

  testPlaysAFullGame [
    | player2 |
    player2 := (Human marker: #O).
    game waitingPlayer: player2.
    player2 setIO: io.
    io addMove: 1.
    io addMove: 5.
    io addMove: 3.
    io addMove: 2.
    io addMove: 8.
    io addMove: 6.
    io addMove: 4.
    io addMove: 7.
    io addMove: 9.
    game run.
    self assert: io gameOverCalledCount = 1.
    self assert: io gameOverState class name = #GameState.
    self assert: io gameOverState over = true.
    self assert: io gameOverState winner = nil.
  ]
  
  testPrintsTheBoardOnEveryGameLoopATotalOf10TimesForAFullGame [
    | player2 |
    player2 := (Human marker: #O).
    game waitingPlayer: player2.
    player2 setIO: io.
    io addMove: 1.
    io addMove: 5.
    io addMove: 3.
    io addMove: 2.
    io addMove: 8.
    io addMove: 6.
    io addMove: 4.
    io addMove: 7.
    io addMove: 9.
    game run.
    self assert: io printBoardCalledCount = 10.
  ]

]
