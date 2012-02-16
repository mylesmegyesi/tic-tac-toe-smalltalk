Object subclass: IO [
  | inStream outStream | 
  
  IO class >> in: inStream out: outStream [
    ^self new
      inStream: inStream;
      outStream: outStream;
      yourself
  ]
  
  inStream: value [ inStream := value ]
  inStream [ ^inStream ]
  
  outStream: value [ outStream := value ]
  outStream [ ^outStream ]
  
  getMove: prompt [
    | input x y |
    outStream nextPutAll: prompt.
    ^inStream nextLine asInteger.
  ]
  
  printBoard: board [
    outStream cr.
    1 to: board size do: [ :columnIndex |
      1 to: board size do: [ :rowIndex |
        outStream nextPutAll: ((Character space) asString, (board x: rowIndex y: columnIndex) asString, (Character space) asString). 
        rowIndex < board size ifTrue: [
          outStream nextPut: $|.
        ]
      ].
      outStream cr.
      columnIndex < board size ifTrue: [
        1 to: board size do: [ :rowIndex |
          outStream nextPutAll: ((Character space) asString, $- asString, (Character space) asString).
          outStream nextPut: (Character space).
        ] 
      ].
      outStream cr.
    ].
    outStream cr.
  ]
  
  gameOver: state [
    outStream cr.
    state winner isNil ifTrue: [
      outStream nextPutAll: 'Draw!'
    ] ifFalse: [
      outStream nextPutAll: 'Congratulations ', state winner, ', you won!'      
    ].
    outStream cr.
  ]
  
]
