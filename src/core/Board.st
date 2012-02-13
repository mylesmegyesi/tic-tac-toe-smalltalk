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
    | rowIndexZeroed columnIndex equal |
    equal := true.
    rowIndexZeroed := rowIndex - 1.
    columnIndex := 1.
    [equal & (columnIndex <= size)] whileTrue: [
      equal := comparator = (cells at: rowIndexZeroed * size + columnIndex).
      columnIndex := columnIndex + 1  
    ].
    ^equal
  ]
  
  column: columnIndex allEqualTo: comparator [
    | rowIndex equal |
    equal := true.
    rowIndex := 0.
    [equal & (rowIndex < size)] whileTrue: [
      equal := comparator = (cells at: rowIndex * size + columnIndex).
      rowIndex := rowIndex + 1  
    ].
    ^equal
  ]
  
  diagonal1allEqualTo: comparator [
    | equal index |
    equal := true.
    index := 0.
    [equal & (index < size)] whileTrue: [
      equal := comparator = (cells at: index * size + index + 1).
      index := index + 1.
    ].
    ^equal
  ]
  
  diagonal2allEqualTo: comparator [
    | equal index |
    equal := true.
    index := 0.
    [equal & (index < size)] whileTrue: [
      equal := comparator = (cells at: index * size + (size - index)).
      index := index + 1.
    ].
    ^equal
  ]
  
  x: x y: y [
    ^cells at: y - 1 * size + x
  ]
  
  placeMarker: marker x: x y: y [
    cells at: y - 1 * size + x put: marker
  ]
  
  placeMarker: marker coord: coord [
    | x y |
    x := coord at: #x.
    y := coord at: #y.
    (self x: x y: y) ~= empty ifTrue: [
      self error: 'Coordinate is already taken'
    ].
    self placeMarker: marker x: x y: y.
    "cells at: (coord at: #y) - 1 * size + (coord at: #x) put: marker"
  ]
  
  emptyCells [
    | coords |
    coords := OrderedCollection new.
    1 to: size do: [ :rowIndex |
      1 to: size do: [ :columnIndex |
        (self x: rowIndex y: columnIndex) = empty ifTrue: [
          coords add: (Dictionary new add: #x -> rowIndex; add: #y -> columnIndex; yourself)
        ]
      ]
    ].
    ^coords
  ]

]