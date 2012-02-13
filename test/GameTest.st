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
    io addMove: (Dictionary new add: #x -> 3; add: #y -> 2; yourself).
    game run.
    self assert: io gameOverCalledCount = 1.
    self assert: io gameOverState class name = #GameState.
    self assert: io gameOverState over = true.
    self assert: io gameOverState winner= nil.
  ]
  
  testDetectsAComputerWinOnDiagonal2 [
    io addMove: (Dictionary new add: #x -> 1; add: #y -> 1; yourself).
    io addMove: (Dictionary new add: #x -> 1; add: #y -> 2; yourself).
    io addMove: (Dictionary new add: #x -> 2; add: #y -> 1; yourself).
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
    io addMove: (Dictionary new add: #x -> 1; add: #y -> 1; yourself).
    io addMove: (Dictionary new add: #x -> 2; add: #y -> 2; yourself).
    io addMove: (Dictionary new add: #x -> 3; add: #y -> 1; yourself).
    io addMove: (Dictionary new add: #x -> 2; add: #y -> 1; yourself).
    io addMove: (Dictionary new add: #x -> 2; add: #y -> 3; yourself).
    io addMove: (Dictionary new add: #x -> 3; add: #y -> 2; yourself).
    io addMove: (Dictionary new add: #x -> 1; add: #y -> 2; yourself).
    io addMove: (Dictionary new add: #x -> 1; add: #y -> 3; yourself).
    io addMove: (Dictionary new add: #x -> 3; add: #y -> 3; yourself).
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
    io addMove: (Dictionary new add: #x -> 1; add: #y -> 1; yourself).
    io addMove: (Dictionary new add: #x -> 2; add: #y -> 2; yourself).
    io addMove: (Dictionary new add: #x -> 3; add: #y -> 1; yourself).
    io addMove: (Dictionary new add: #x -> 2; add: #y -> 1; yourself).
    io addMove: (Dictionary new add: #x -> 2; add: #y -> 3; yourself).
    io addMove: (Dictionary new add: #x -> 3; add: #y -> 2; yourself).
    io addMove: (Dictionary new add: #x -> 1; add: #y -> 2; yourself).
    io addMove: (Dictionary new add: #x -> 1; add: #y -> 3; yourself).
    io addMove: (Dictionary new add: #x -> 3; add: #y -> 3; yourself).
    game run.
    self assert: io printBoardCalledCount = 10.
  ]

]