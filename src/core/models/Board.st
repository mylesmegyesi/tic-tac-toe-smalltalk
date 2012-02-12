Object subclass: Board [
  | cells width height |

  Board class >> from: str width: width height: height [
    | cells |
    cells := str asArray collect: [ :char | char asSymbol ].
    ^self new 
      cells: cells;
      width: width;
      height: height;
      yourself
  ]
  
  cells [ ^cells ]
  
  cells: value [ cells := value ]
  
  width [ ^width ]
  
  width: value [ width := value ]
  
  height [ ^height ]
  
  height: value [ height := value ]
  
  row: rowIndex allEqual: comparator [
    | rowIndexZeroed columnIndex equal |
    equal := true.
    rowIndexZeroed := rowIndex - 1.
    columnIndex := 1.
    [equal & (columnIndex <= width)] whileTrue: [
      equal := comparator = (cells at: rowIndexZeroed * width + columnIndex).
      columnIndex := columnIndex + 1  
    ].
    ^equal
  ]
  
  column: columnIndex allEqual: comparator [
    | rowIndex equal |
    equal := true.
    rowIndex := 1.
    [equal & (rowIndex < height)] whileTrue: [
      equal := comparator = (cells at: rowIndex * width + columnIndex).
      rowIndex := rowIndex + 1  
    ].
    ^equal
  ]
  
  x: x y: y [
    ^cells at: y - 1 * width + x
  ]

]