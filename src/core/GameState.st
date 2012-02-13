Object subclass: GameState [
  
  GameState class >> board: board player1: p1 player2: p2 empty: empty [
    
    1 to: board size do: [ :index |
      (board row: index allEqualTo: p1) | (board column: index allEqualTo: p1) ifTrue: [
        ^#player1won
      ] ifFalse: [
        (board row: index allEqualTo: p2) | (board column: index allEqualTo: p2) ifTrue: [
          ^#player2won
        ]  
      ]
    ].
    
    (board diagonal1allEqualTo: p1) | (board diagonal2allEqualTo: p1) ifTrue: [
      ^#player1won
    ] ifFalse: [
      (board diagonal1allEqualTo: p2) | (board diagonal2allEqualTo: p2) ifTrue: [
        ^#player2won
      ]
    ].
    
    (board allNotEqualTo: empty) ifTrue:[
      ^#draw
    ] ifFalse: [
      ^#playing
    ]
    
  ]

]