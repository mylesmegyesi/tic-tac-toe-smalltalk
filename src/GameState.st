Object subclass: GameState [
  | over winner |
  
  GameState class >> board: board[
    
    1 to: board size do: [ :index |
      (board row: index allEqualTo: board player1) | (board column: index allEqualTo: board player1) ifTrue: [
        ^self winner: board player1
      ] ifFalse: [
        (board row: index allEqualTo: board player2) | (board column: index allEqualTo: board player2) ifTrue: [
          ^self winner: board player2
        ]  
      ]
    ].
    
    (board diagonal1allEqualTo: board player1) | (board diagonal2allEqualTo: board player1) ifTrue: [
      ^self winner: board player1
    ] ifFalse: [
      (board diagonal1allEqualTo: board player2) | (board diagonal2allEqualTo: board player2) ifTrue: [
        ^self winner: board player2
      ]
    ].
    
    board full ifTrue:[
      ^self draw
    ] ifFalse: [
      ^self playing
    ]
    
  ]
  
  GameState class >> winner: marker [
    ^self new
      winner: marker;
      over: true;
      yourself
  ]
  
  GameState class >> draw [
    ^self new
      over: true;
      yourself
  ]
  
  GameState class >> playing [
    ^self new
      over: false;
      yourself
  ]
  
  winner: value [ winner := value ]
  winner [ ^ winner ]
  
  over: value [ over := value ]
  over [ ^over ]
  
  scoreFor: player [
    winner isNil ifTrue: [
      ^0
    ] ifFalse: [
      (player = winner) ifTrue: [
        ^1000
      ] ifFalse: [
      
        ^-1000
      ]
    ]
  ]

]