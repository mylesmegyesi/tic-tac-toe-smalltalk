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
  
  testAllEqualReturnsTrueIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XXXOOO   XXX' width: 3 height: 4.
    self assert: (board row: 1 allEqual: #X)
  ]
  
  testAllEqualReturnsFalseIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XXXOOO   XXY' width: 3 height: 4.
    self deny: (board row: 4 allEqual: #X)
  ]
  
  testAllEqualThrowsWhenRowDoesntExist [
    board := Board from: 'XXXOOO   XXX' width: 3 height: 4.
    self should: (board row: 4 allEqual: #X) raise: Error
  ]
  
  testAllEqualReturnsTrueIfAllItemsInAColumnEqualsTheGivenComparator [
    board := Board from: 'XOOXOOXOOXYY' width: 3 height: 4.
    self assert: (board column: 1 allEqual: #X)
  ]
  
  testAllEqualReturnsFalseIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XOOYOO   XXY' width: 3 height: 4.
    self deny: (board column: 4 allEqual: #X)
  ]
  
  testAllEqualThrowsWhenColumnDoesntExist [
    board := Board from: 'XXXOOO   XXX' width: 3 height: 4.
    self should: (board column: 5 allEqual: #X) raise: Error
  ]
  
  testXYGetsTheCellAtTheGivenPoint [
    board := Board from: 'XOY ' width: 2 height: 2.
    self assert: (board x: 1 y: 1) = #X.
    self assert: (board x: 2 y: 1) = #O.
    self assert: (board x: 1 y: 2) = #Y.
    self assert: (board x: 2 y: 2) = #' '
  ]
  
  testXYGetsTheCellAtTheGivenPointFurther [
    board := Board from: 'abcdefghijklmno' width: 5 height: 3.
    self assert: (board x: 1 y: 1) = #a.
    self assert: (board x: 2 y: 1) = #b.
    self assert: (board x: 3 y: 1) = #c.
    self assert: (board x: 4 y: 1) = #d.
    self assert: (board x: 5 y: 1) = #e.
    self assert: (board x: 1 y: 2) = #f.
    self assert: (board x: 2 y: 2) = #g.
    self assert: (board x: 3 y: 2) = #h.
    self assert: (board x: 4 y: 2) = #i.
    self assert: (board x: 5 y: 2) = #j.
    self assert: (board x: 1 y: 3) = #k.
    self assert: (board x: 2 y: 3) = #l.
    self assert: (board x: 3 y: 3) = #m.
    self assert: (board x: 4 y: 3) = #n.
    self assert: (board x: 5 y: 3) = #o.
  ]
]