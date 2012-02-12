TestCase subclass: BoardTest [
  | board |
  
  testCreatesACellForEachCharacterGiven [
    | cells |
    board := Board from: 'XXXX' width: 2 height: 2.
    cells := board cells.
    self assert: cells size = 4.
    cells do: [ :cell |
      self assert: cell = #X
    ]
  ]
  
  testIteratesOverTheRowsOfA2x2Board [
    | incCounter counter | 
    board := Board from: 'XXXX' width: 2 height: 2.
    counter := 0.
    incCounter := [ :dummy | counter := counter + 1 ].
    board rowAt: 1 do: incCounter.
    board rowAt: 2 do: incCounter.
    self assert: counter = 4
  ]
  
  testIteratesOverTheRowsOfA3x3Board [
    | incCounter counter | 
    board := Board from: 'XXXXXXXXX' width: 3 height: 3.
    counter := 0.
    incCounter := [ :dummy | counter := counter + 1 ].
    board rowAt: 1 do: incCounter.
    board rowAt: 2 do: incCounter.
    board rowAt: 3 do: incCounter.
    self assert: counter = 9
  ]
  
  testIteratesOverTheRowsOfA4x3Board [
    | incCounter counter | 
    board := Board from: 'XXXXOOOO    ' width: 4 height: 3.
    counter := 0.
    incCounter := [ :dummy | counter := counter + 1 ].
    board rowAt: 1 do: incCounter.
    board rowAt: 2 do: incCounter.
    board rowAt: 3 do: incCounter.
    self assert: counter = 12
  ]
  
  testIteratesOverTheRowsOfA3x4Board [
    | incCounter counter | 
    board := Board from: 'XXXOOO   XXX' width: 3 height: 4.
    counter := 0.
    incCounter := [ :dummy | counter := counter + 1 ].
    board rowAt: 1 do: incCounter.
    board rowAt: 2 do: incCounter.
    board rowAt: 3 do: incCounter.
    board rowAt: 4 do: incCounter.
    self assert: counter = 12
  ]
  
  testIteratesOverTheContentOfTheRows [
    board := Board from: 'XXXXOOOO    ' width: 4 height: 3.
    board rowAt: 1 do: [ :cell | self assert: cell = #X ].
    board rowAt: 2 do: [ :cell | self assert: cell = #O ].
    board rowAt: 3 do: [ :cell | self assert: cell = #' ' ]
  ]
  
  testThrowsWhenRowDoesntExist [
    board := Board from: 'XO XO XO ' width: 3 height: 3.
    self should: [board roAt: 4 do: []] raise: Error
  ]
  
  testIteratesOverTheColumnsOfA2x2Board [
    | incCounter counter | 
    board := Board from: 'XXXX' width: 2 height: 2.
    counter := 0.
    incCounter := [ :dummy | counter := counter + 1 ].
    board columnAt: 1 do: incCounter.
    board columnAt: 2 do: incCounter.
    self assert: counter = 4
  ]
  
  testIteratesOverTheColumnsOfA3x3Board [
    | incCounter counter | 
    board := Board from: 'XXXXXXXXX' width: 3 height: 3.
    counter := 0.
    incCounter := [ :dummy | counter := counter + 1 ].
    board columnAt: 1 do: incCounter.
    board columnAt: 2 do: incCounter.
    board columnAt: 3 do: incCounter.
    self assert: counter = 9
  ]
  
  testIteratesOverTheColumnsOfA4x3Board [
    | incCounter counter | 
    board := Board from: 'XXXXOOOO    ' width: 4 height: 3.
    counter := 0.
    incCounter := [ :dummy | counter := counter + 1 ].
    board columnAt: 1 do: incCounter.
    board columnAt: 2 do: incCounter.
    board columnAt: 3 do: incCounter.
    board columnAt: 4 do: incCounter.
    self assert: counter = 12
  ]
  
  testIteratesOverTheColumnsOfA3x4Board [
    | incCounter counter | 
    board := Board from: 'XXXOOO   XXX' width: 3 height: 4.
    counter := 0.
    incCounter := [ :dummy | counter := counter + 1 ].
    board columnAt: 1 do: incCounter.
    board columnAt: 2 do: incCounter.
    board columnAt: 3 do: incCounter.
    self assert: counter = 12
  ]
  
  testIteratesOverTheContentOfTheColumns [
    board := Board from: 'XOY XOY XOY ' width: 4 height: 3.
    board columnAt: 1 do: [ :cell | self assert: cell = #X ].
    board columnAt: 2 do: [ :cell | self assert: cell = #O ].
    board columnAt: 3 do: [ :cell | self assert: cell = #Y ].
    board columnAt: 4 do: [ :cell | self assert: cell = #' ' ]
  ]
  
  testThrowsWhenColumnDoesntExist [
    board := Board from: 'XO XO XO ' width: 3 height: 3.
    self should: [board columnAt: 4 do: []] raise: Error
  ]
]