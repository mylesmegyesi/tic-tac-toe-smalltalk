Object subclass: GameState [
  
  GameState class >> board: board player1: p1 player2: p2 [
    
    "rows"
    1 to: board size do: [ :rowIndex |
      (board row: rowIndex allEqual: p1) ifTrue: [
        ^#player1won
      ] ifFalse: [
        (board row: rowIndex allEqual: p2) ifTrue: [
          ^#player2won
        ]  
      ]
    ].
    
    "columns"
    1 to: board size do: [ :columnIndex |
      (board column: columnIndex allEqual: p1) ifTrue: [
        ^#player1won
      ] ifFalse: [
        (board column: columnIndex allEqual: p2) ifTrue: [
          ^#player2won
        ]  
      ]
    ].
    
  ]

]