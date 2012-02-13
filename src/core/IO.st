Object subclass: IO [
  | inStream outStream getMovePrompt | 
  
  IO class >> in: inStream out: outStream [
    ^self new
      inStream: inStream;
      outStream: outStream;
      getMovePrompt: '';
      yourself
  ]
  
  inStream: value [ inStream := value ]
  inStream [ ^inStream ]
  
  outStream: value [ outStream := value ]
  outStream [ ^outStream ]
  
  getMovePrompt: value [ getMovePrompt := value ]
  
  getMove [
    | input x y |
    outStream nextPutAll: getMovePrompt.
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
  
]