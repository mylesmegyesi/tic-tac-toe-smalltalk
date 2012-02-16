Player subclass: Computer [

  negInfinity := FloatD negativeInfinity.
  posInfinity := FloatD infinity.

  makeMove: board [
    | otherPlayer bestIndex bestScore newBoard results score |
    bestScore := negInfinity.
    otherPlayer := board otherPlayer: marker.
    results := board emptyCells do: [ :index |
        newBoard := board copy placeMarker: marker index: index.
        score := (self minimax: newBoard player: otherPlayer alpha: negInfinity beta: posInfinity depth: 0) negated.
        score > bestScore ifTrue: [
          bestScore := score.
          bestIndex := index.
        ]
    ].
    board placeMarker: marker index: bestIndex.
  ]
  
  minimax: board player: player alpha: alpha beta: beta depth: depth [
    | state otherPlayer newBoard newAlpha score |
    otherPlayer := board otherPlayer: player.
    state := GameState board: board.
    (state over) ifTrue: [
      ^(state scoreFor: player) + depth
    ] ifFalse: [
      newAlpha := alpha.
      board emptyCells do: [ :index |
        newBoard := board copy placeMarker: player index: index.
        score := (self minimax: newBoard player: otherPlayer alpha: (beta negated) beta: (newAlpha negated) depth: (depth + 1)) negated.
        newAlpha := score max: newAlpha.
        newAlpha >= beta ifTrue: [
          ^newAlpha
        ]
      ].
      ^newAlpha
    ]
  ]

]
