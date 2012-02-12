TestCase subclass: BoardTest [

  testThrowsIfTheLengthOfTheGivenStringIsNotAPerfectSquare [
    self should: [Board from: '   '] raise: Error
  ]
  
  testDoesNotThrowIfTheLengthOfTheGivenStringIsAPerfectSquare [
    self shouldnt: [Board from: '    '] raise: Error
  ]
  
  testCreatesACellForEachCharacterGiven [
    | board cells |
    board := Board from: 'XXXX'.
    cells := board cells.
    self assert: cells size = 4.
    cells do: [ :cell |
      self assert: cell = #X
    ]
  ]
  
  testStoresTheBoardSize [
    | board |
    board := Board from: 'XXXX'.
    self assert: board size = 2.
    board := Board from: 'XOXOXOXOX'.
    self assert: board size = 3.
  ]
  
  testIteratesOverTheCorrectAmountOfRowsForABoardSize2 [
    | board counter |
    board := Board from: 'XXXX'.
    counter := 0.
    board eachRow: [ :row |
      counter := counter + 1.
    ].
    self assert: counter = 2
  ]
  
  testIteratesOverTheCorrectAmountOfRowsForABoardSize3 [
    | board counter |
    board := Board from: 'XXXXXXXXX'.
    counter := 0.
    board eachRow: [ :row |
      counter := counter + 1.
    ].
    self assert: counter = 3
  ]
  
  testIteratesOverTheContentOfTheRows [
    | board rows |
    board := Board from: 'XXXOOO   '.
    rows := OrderedCollection new.
    board eachRow: [ :row |
      rows add: row
    ].
    (rows at: 1) do: [ :cell | self assert: cell = #X ].
    (rows at: 2) do: [ :cell | self assert: cell = #O ].
    (rows at: 3) do: [ :cell | self assert: cell = #' ' ]
  ]
  
  testIteratesOverTheCorrectAmountOfColumnsForABoardSize2 [
    | board counter |
    board := Board from: 'XXXX'.
    counter := 0.
    board eachColumn: [ :column |
      counter := counter + 1.
    ].
    self assert: counter = 2
  ]
  
  testIteratesOverTheCorrectAmountOfColumnsForABoardSize3 [
    | board counter |
    board := Board from: 'XXXXXXXXX'.
    counter := 0.
    board eachColumn: [ :column |
      counter := counter + 1.
    ].
    self assert: counter = 3
  ]
  
  testIteratesOverTheContentOfTheColumns [
    | board columns |
    board := Board from: 'XO XO XO '.
    columns := OrderedCollection new.
    board eachColumn: [ :column |
      columns add: column
    ].
    (columns at: 1) do: [ :cell | self assert: cell = #X ].
    (columns at: 2) do: [ :cell | self assert: cell = #O ].
    (columns at: 3) do: [ :cell | self assert: cell = #' ' ]
  ]
]