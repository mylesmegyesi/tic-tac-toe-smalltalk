Object subclass: GameState [
  | over winner |
  
  GameState class >> board: board player1: p1 player2: p2 empty: empty [
    
    1 to: board size do: [ :index |
      (board row: index allEqualTo: p1) | (board column: index allEqualTo: p1) ifTrue: [
        ^self winner: p1
      ] ifFalse: [
        (board row: index allEqualTo: p2) | (board column: index allEqualTo: p2) ifTrue: [
          ^self winner: p2
        ]  
      ]
    ].
    
    (board diagonal1allEqualTo: p1) | (board diagonal2allEqualTo: p1) ifTrue: [
      ^self winner: p1
    ] ifFalse: [
      (board diagonal1allEqualTo: p2) | (board diagonal2allEqualTo: p2) ifTrue: [
        ^self winner: p2
      ]
    ].
    
    (board allNotEqualTo: empty) ifTrue:[
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
  
  score: player [
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