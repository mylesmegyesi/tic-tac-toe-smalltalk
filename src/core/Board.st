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
  
  rowAt: rowIndex do: block [
    | rowIndexZeroed |
    rowIndexZeroed := rowIndex - 1.
    1 to: width do: [ :columnIndex |
      block value: (cells at: rowIndexZeroed * width + columnIndex)
    ]
  ]
  
  columnAt: columnIndex do: block [
    0 to: height - 1 do: [ :rowIndex |
      block value: (cells at: rowIndex * width + columnIndex)
    ]
  ]

]