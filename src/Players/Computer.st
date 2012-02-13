Player subclass: Computer [

  makeMove: board [
    | otherPlayer bestCoord bestScore results score |
    otherPlayer := board otherPlayer: marker.
    bestScore := FloatD negativeInfinity.
    results := board emptyCells collect: [ :coordinate |
        score := (self minimax: (board copy placeMarker: marker coord: coordinate) player: otherPlayer alpha: FloatD negativeInfinity beta: FloatD infinity depth: 0) negated.
        score > bestScore ifTrue: [
          bestScore := score.
          bestCoord := coordinate.
        ]
    ].
    board placeMarker: marker coord: bestCoord.
  ]
  
  minimax: board player: player alpha: alpha beta: beta depth: depth [
    | state otherPlayer newAlpha score |
    otherPlayer := board otherPlayer: player.
    state := GameState board: board.
    (state over) ifTrue: [
      ^(state scoreFor: player) + depth
    ] ifFalse: [
      newAlpha := alpha.
      board emptyCells do: [ :coordinate |
        score := (self minimax: (board copy placeMarker: player coord: coordinate) player: otherPlayer alpha: (beta negated) beta: (newAlpha negated) depth: (depth + 1)) negated.
        newAlpha := score max: newAlpha.
        newAlpha >= beta ifTrue: [
          ^newAlpha
        ]
      ].
      ^newAlpha
    ]
  ]

]