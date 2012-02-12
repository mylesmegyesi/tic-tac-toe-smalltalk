TestCase subclass: GameStateTest [
  | board |

  "testReportsP1WinOnRow1 [
    | state |
    board := Board from: 'XXX      '.
    state := (GameState analyze: board player1: #X player2: #O).
    self assert: state = #player1won 
  ]
  
  testReportsP2WinOnRow1 [
    | state |
    board := Board from: 'XXX      '.
    state := (GameState analyze: board player1: #O player2: #X).
    self assert: state = #player2won 
  ]"
]