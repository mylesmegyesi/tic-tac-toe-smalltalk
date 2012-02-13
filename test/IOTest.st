TestCase subclass: IOTest [
  | input output io move |
  
  setUp [

  ]
  
  testGetMoveReadsFromIn [
    input := ReadStream on: '1 2'.
    output := WriteStream on: String new.
    io := IO in: input out: output.
    move := io getMove: ''.
    self assert: move = (Dictionary new add: #x -> 1; add: #y -> 2; yourself).
  ]
  
  testWritesThePromptToOutput [
    input := ReadStream on: ''.
    output := WriteStream on: String new.
    io := IO in: input out: output.
    move := io getMove: 'here i am'.
    self assert: output contents = 'here i am'
  ]
  
  testGetMoveHandlesBadInput1 [
    input := ReadStream on: ('a b').
    output := WriteStream on: String new.
    io := IO in: input out: output.
    move := io getMove: ''.
    self assert: move = (Dictionary new add: #x -> 0; add: #y -> 0; yourself).
  ]
  
  testGetMoveHandlesBadInput2 [
    input := ReadStream on: ('asdf', Character cr asString).
    output := WriteStream on: String new.
    io := IO in: input out: output.
    move := io getMove: ''.
    self assert: move = (Dictionary new add: #x -> 0; add: #y -> 0; yourself).
  ]
  
  testGetMoveHandlesBadInput3 [
    input := ReadStream on: ('asdf asdf asdf asdf asdf', Character cr asString).
    output := WriteStream on: String new.
    io := IO in: input out: output.
    move := io getMove: ''.
    self assert: move = (Dictionary new add: #x -> 0; add: #y -> 0; yourself).
  ]

]