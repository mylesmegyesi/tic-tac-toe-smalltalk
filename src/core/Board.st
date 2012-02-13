Object subclass: Board [
  | cells size |

  Board class >> from: str [
    | cells |
    cells := str asArray collect: [ :char | char asSymbol ].
    ^self new 
      cells: cells;
      size: cells size sqrt asInteger;
      yourself
  ]
  
  copy [
    ^super copy
      cells: cells copy;
      yourself
  ]
  
  cells [ ^cells ]
  
  cells: value [ cells := value ]
  
  size [ ^size ]
  
  size: value [ size := value ]
  
  allNotEqualTo: comparator [
    ^cells conform: [ :cell | cell ~= comparator ]
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
  
  placeMarker: marker x: x y: y[
    cells at: y - 1 * size + x put: marker
  ]
  
  placeMarker: marker coord: coord [
    cells at: (coord at: #y) - 1 * size + (coord at: #x) put: marker
  ]
  
  coordinatesWhere: block [
    | coords |
    coords := OrderedCollection new.
    1 to: size do: [ :rowIndex |
      1 to: size do: [ :columnIndex |
        (block value: (self x: rowIndex y: columnIndex)) ifTrue: [
          coords add: (Dictionary new add: #x -> rowIndex; add: #y -> columnIndex; yourself)
        ]
      ]
    ].
    ^coords
  ]

]