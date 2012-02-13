Object subclass: GameState [
  
  GameState class >> board: board player1: p1 player2: p2 [
    
    1 to: board size do: [ :index |
      (board row: index allEqual: p1) | (board column: index allEqual: p1) ifTrue: [
        ^#player1won
      ] ifFalse: [
        (board row: index allEqual: p2) | (board column: index allEqual: p2) ifTrue: [
          ^#player2won
        ]  
      ]
    ].
    
    (board diagonal1allEqual: p1) | (board diagonal2allEqual: p1) ifTrue: [
      ^#player1won
    ] ifFalse: [
      (board diagonal1allEqual: p2) | (board diagonal2allEqual: p2) ifTrue: [
        ^#player2won
      ]
    ]
    
  ]

]