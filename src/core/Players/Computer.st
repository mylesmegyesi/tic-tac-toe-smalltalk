Player subclass: Computer [
  | otherPlayer empty |
  
  Win := 1000.
  Lose := -1000.
  
  Computer class >> marker: marker otherPlayer: otherPlayer empty: empty [
    ^(super marker: marker)
      otherPlayer: otherPlayer;
      empty: empty;
      yourself
  ]
  
  otherPlayer: value [ otherPlayer := value ]
  
  empty: value [ empty := value ]
  
  getOtherPlayersMarker: currentMarker [
    (currentMarker = marker) ifTrue: [
      ^(otherPlayer marker)
    ] ifFalse: [
      ^marker
    ]
  ]
  
  emptyCells: board [
    ^board coordinatesWhere: [ :cell | cell = empty ]
  ]

  makeMove: board [
    | results bestCoord otherPlayer |
    otherPlayer := self getOtherPlayersMarker: marker.
    results := (self emptyCells: board) collect: [ :coordinate |
      Dictionary new
        add: #score -> (self minimax: (board copy coord: coordinate marker: marker) player: otherPlayer alpha: (FloatD negativeInfinity) beta: (FloatD infinity) depth: 0) negated;
        add: #coordinate -> coordinate;
        yourself.
    ].
    bestCoord := (results inject: (results at: 1) into: [ :best :result | (best at: #score) > (result at: #score) ifTrue: [best] ifFalse: [result]]) at: #coordinate.
    board coord: bestCoord marker: marker.
  ]
  
  minimax: board player: player alpha: alpha beta: beta depth: depth [
    | state otherPlayer newAlpha score |
    otherPlayer := self getOtherPlayersMarker: player.
    state := GameState board: board player1: player player2: otherPlayer empty: empty.
    (state over) ifTrue: [
      ^(state score: player) + depth
    ].
    newAlpha := alpha.
    (self emptyCells: board) do: [ :coordinate |
      score := (self minimax: (board copy coord: coordinate marker: player) player: otherPlayer alpha: (beta negated) beta: (newAlpha negated) depth: (depth + 1)) negated.
      newAlpha := score max: newAlpha.
      newAlpha >= beta ifTrue: [
        ^newAlpha
      ]
    ].
    ^newAlpha
  ]

]