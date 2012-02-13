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
  
  cells [ ^cells ]
  
  cells: value [ cells := value ]
  
  size [ ^size ]
  
  size: value [ size := value ]
  
  allEqual: comparator [
    ^cells conform: [ :cell | cell = comparator ]
  ]
  
  row: rowIndex allEqual: comparator [
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
  
  column: columnIndex allEqual: comparator [
    | rowIndex equal |
    equal := true.
    rowIndex := 1.
    [equal & (rowIndex < size)] whileTrue: [
      equal := comparator = (cells at: rowIndex * size + columnIndex).
      rowIndex := rowIndex + 1  
    ].
    ^equal
  ]
  
  diagonal1allEqual: comparator [
    | equal index |
    equal := true.
    index := 0.
    [equal & (index < size)] whileTrue: [
      equal := comparator = (cells at: index * size + index + 1).
      index := index + 1.
    ].
    ^equal
  ]
  
  diagonal2allEqual: comparator [
    | equal index |
    equal := true.
    index := 0.
    [equal & (index < size)] whileTrue: [
      equal := comparator = (cells at: index * size + (size - index)).
      index := index + 1.
    ].
    ^equal
  ]

]