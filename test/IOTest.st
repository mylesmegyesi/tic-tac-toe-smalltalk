TestCase subclass: IOTest [
  | input output io move |
  
  testGetMoveReadsFromIn [
    input := ReadStream on: '1'.
    output := WriteStream on: String new.
    io := IO in: input out: output.
    move := io getMove: ''.
    self assert: move = 1.
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
    self assert: move = 0.
  ]
  
  testGetMoveHandlesBadInput2 [
    input := ReadStream on: ('asdf', Character cr asString).
    output := WriteStream on: String new.
    io := IO in: input out: output.
    move := io getMove: ''.
    self assert: move = 0.
  ]
  
  testGetMoveHandlesBadInput3 [
    input := ReadStream on: ('asdf asdf asdf asdf asdf', Character cr asString).
    output := WriteStream on: String new.
    io := IO in: input out: output.
    move := io getMove: ''.
    self assert: move = 0.
  ]

]
