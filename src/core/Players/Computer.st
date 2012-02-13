Player subclass: Computer [
  | otherPlayer empty |

  
  Computer class >> marker: marker otherPlayer: otherPlayer empty: empty [
    ^(super marker: marker)
      otherPlayer: otherPlayer;
      empty: empty;
      yourself
  ]
  
  otherPlayer: value [ otherPlayer := value ]
  
  empty: value [ empty := value ]
  
  getOtherPlayer: player [
    (player = marker) ifTrue: [
      ^otherPlayer
    ] ifFalse: [
      ^marker
    ]
  ]
  
  emptyCoordinates: board [
    ^board coordinatesWhere: [ :cell | cell = empty ]
  ]

  makeMove: board [
    | otherPlayer bestCoord bestScore results score |
    otherPlayer := self getOtherPlayer: marker.
    bestScore := FloatD negativeInfinity.
    results := (self emptyCoordinates: board) collect: [ :coordinate |
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
    otherPlayer := self getOtherPlayer: player.
    state := GameState board: board player1: player player2: otherPlayer empty: empty.
    (state over) ifTrue: [
      ^(state scoreFor: player) + depth
    ] ifFalse: [
      newAlpha := alpha.
      (self emptyCoordinates: board) do: [ :coordinate |
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