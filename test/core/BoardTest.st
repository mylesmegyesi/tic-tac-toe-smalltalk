TestCase subclass: BoardTest [
  | board |
  
  testCreatesACellForEachCharacterGiven [
    | cells |
    board := Board from: 'XXXX'.
    cells := board cells.
    self assert: cells size = 4.
    cells do: [ :cell |
      self assert: cell = #X
    ]
  ]
  
  testAllEqualReturnsTrueIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XXXOOO   '.
    self assert: (board row: 1 allEqual: #X)
  ]
  
  testAllEqualReturnsFalseIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XXXOOOXXY'.
    self deny: (board row: 3 allEqual: #X)
  ]
  
  testAllEqualReturnsTrueIfAllItemsInAColumnEqualsTheGivenComparator [
    board := Board from: 'XOOXOOXOO'.
    self assert: (board column: 1 allEqual: #X)
  ]
  
  testAllEqualReturnsFalseIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XOOYOO   '.
    self deny: (board column: 3 allEqual: #X)
  ]
  
  testXYGetsTheCellAtTheGivenPoint [
    board := Board from: 'XOY '.
    self assert: (board x: 1 y: 1) = #X.
    self assert: (board x: 2 y: 1) = #O.
    self assert: (board x: 1 y: 2) = #Y.
    self assert: (board x: 2 y: 2) = #' '
  ]
  
  testXYGetsTheCellAtTheGivenPointFurther [
    board := Board from: 'abcdefghi'.
    self assert: (board x: 1 y: 1) = #a.
    self assert: (board x: 2 y: 1) = #b.
    self assert: (board x: 3 y: 1) = #c.
    self assert: (board x: 1 y: 2) = #d.
    self assert: (board x: 2 y: 2) = #e.
    self assert: (board x: 3 y: 2) = #f.
    self assert: (board x: 1 y: 3) = #g.
    self assert: (board x: 2 y: 3) = #h.
    self assert: (board x: 3 y: 3) = #i.
  ]
]