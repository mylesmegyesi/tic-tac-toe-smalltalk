Object subclass: Board [
  | cells size player1 player2 empty |

  Board class >> from: str player1: player1 player2: player2 empty: empty [
    | cells |
    cells := str asArray collect: [ :char | char asSymbol ].
    ^self new 
      cells: cells;
      size: cells size sqrt asInteger;
      player1: player1;
      player2: player2;
      empty: empty;
      yourself
  ]
  
  Board class >> new: size player1: player1 player2: player2 empty: empty [
    | cells |
    cells := OrderedCollection new.
    1 to: size * size do: [ :i |
      cells add: empty
    ].
    ^self new 
      cells: cells;
      size: size;
      player1: player1;
      player2: player2;
      empty: empty;
      yourself
  ]
  
  copy [
    ^super copy
      cells: cells copy;
      size: size;
      player1: player1;
      player2: player2;
      empty: empty;
      yourself
  ]
  
  cells [ ^cells ]
  cells: value [ cells := value ]
  
  size [ ^size ]
  size: value [ size := value ]
  
  player1 [ ^player1 ]
  player1: value [ player1 := value ]
  
  player2 [ ^player2 ]
  player2: value [ player2 := value ]
  
  empty [ ^empty ]
  empty: value [ empty := value ]
  
  full [
    ^cells conform: [ :cell | cell ~= empty ]
  ]
  
  otherPlayer: player [
    (player = player1) ifTrue: [
      ^player2
    ] ifFalse: [
      ^player1
    ]
  ]
  
  row: rowIndex allEqualTo: comparator [
    | columnIndex equal |
    equal := true.
    columnIndex := 1.
    [equal & (columnIndex <= size)] whileTrue: [
      equal := comparator = (self x: columnIndex y: rowIndex).
      columnIndex := columnIndex + 1  
    ].
    ^equal
  ]
  
  column: columnIndex allEqualTo: comparator [
    | rowIndex equal |
    equal := true.
    rowIndex := 1.
    [equal & (rowIndex <= size)] whileTrue: [
      equal := comparator = (self x: columnIndex y: rowIndex).
      rowIndex := rowIndex + 1  
    ].
    ^equal
  ]
  
  diagonal1allEqualTo: comparator [
    | index equal |
    equal := true.
    index := 1.
    [equal & (index <= size)] whileTrue: [
      equal := comparator = (self x: index y: index).
      index := index + 1.
    ].
    ^equal
  ]
  
  diagonal2allEqualTo: comparator [
    | index equal |
    equal := true.
    index := 1.
    [equal & (index <= size)] whileTrue: [
      equal := comparator = (self x: index  y: (size - index + 1)).
      index := index + 1.
    ].
    ^equal
  ]

  toIndex: x y: y [
    ^(y - 1 * size + x)
  ]
  
  x: x y: y [
    ^cells at: (self toIndex: x y: y).
  ]
  
  placeMarker: marker index: index [
    (cells at: index) ~= empty ifTrue: [
      self error: 'Coordinate is already taken'
    ].
    cells at: index put: marker.
  ]
  
  emptyCells [
    | coords |
    coords := OrderedCollection new.
    1 to: (cells size) do: [ :index | 
      (cells at: index) = empty ifTrue: [
        coords add: index
      ] 
    ].
    ^coords
  ]

]
