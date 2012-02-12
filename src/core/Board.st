Object subclass: Board [
  | cells size |

  Board class >> from: str [
    | size isPerfectSquare cells cellsAsSymbols|
    size := str size sqrt.
    isPerfectSquare := size fractionPart = 0.0.
    isPerfectSquare ifFalse: [self error: 'String length must be a perfect square.'].
    size := size asInteger.
    cells := str asArray. 
    cellsAsSymbols := cells collect: [ :char | char asSymbol ].
    ^self new 
      cells: cellsAsSymbols;
      size: size;
      yourself
  ]
  
  cells [ ^cells ]
  
  cells: value [ cells := value ]
  
  size [
    ^size
  ]
  
  size: value [ size := value ]
  
  eachRow: block [
    0 to: size - 1 do: [ :rowIndex |
      | row |
      row := OrderedCollection new.
      0 to: size - 1 do: [ :columnIndex |
         row add: (cells at: rowIndex * size + columnIndex + 1)
      ].
      block value: row
    ]
  ]
  
  eachColumn: block [
    0 to: size - 1 do: [ :columnIndex |
      | column |
      column := OrderedCollection new.
      0 to: size - 1 do: [ :rowIndex |
         column add: (cells at: rowIndex * size + columnIndex + 1)
      ].
      block value: column
    ]
  ]

]