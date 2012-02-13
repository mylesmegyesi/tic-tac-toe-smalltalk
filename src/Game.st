Object subclass: Game [
  | io currentPlayer waitingPlayer board |

  Game class >> io: io [
    | player1 |
    player1 := Human marker: #X.
    player1 setIO: io.
    ^self new
      io: io;
      currentPlayer: player1;
      waitingPlayer: (Computer marker: #O);
      board: (Board new: 3 player1: #X player2: #O empty: #' ');
      yourself
  ]
  
  io [ ^io ]
  io: value [ io := value ]
  
  currentPlayer [ ^currentPlayer ]
  currentPlayer: value [ currentPlayer := value ]
  
  waitingPlayer [ ^waitingPlayer ]
  waitingPlayer: value [ waitingPlayer := value ]
  
  board [ ^board ]
  board: value [ board := value ]
  
  run [
    | state playerTmp |
    io printBoard: board.
    state := GameState board: board.
    state over ifTrue: [
      io gameOver: state.
    ] ifFalse: [
      currentPlayer makeMove: board.
      playerTmp := currentPlayer.
      currentPlayer := waitingPlayer.
      waitingPlayer := playerTmp.
      self run
    ]
  ]

]
