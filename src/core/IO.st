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
    input := inStream nextLine.
    input := input tokenize: ' '.
    input := input collect: [ :i | i asInteger ].
    (input size >= 2) ifTrue: [
      x := input at: 1.
      y := input at: 2.
    ] ifFalse: [
      x := 0.
      y := 0.
    ].
    ^Dictionary new
      add: #x -> x;
      add: #y -> y;
      yourself
  ]
  
  printBoard: board [
    board cells printOn: outStream.
  ]
  
]