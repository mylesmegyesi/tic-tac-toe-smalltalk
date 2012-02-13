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
  
  testAllEqualReturnsTrueIfAllItemsInDiagonal1IsEqualToTheGivenComparator [
    board := Board from: 'X   X   X'.
    self assert: (board diagonal1allEqual: #X)
  ]
  
  testAllEqualReturnsFalseIfAllItemsInDiagonal1AreNotEqualToTheGivenComparator [
    board := Board from: 'X   X   O'.
    self deny: (board diagonal1allEqual: #X)
  ]
  
  testAllEqualReturnsTrueIfAllItemsInDiagonal2IsEqualToTheGivenComparator [
    board := Board from: '  X X X  '.
    self assert: (board diagonal2allEqual: #X)
  ]
  
  testAllEqualReturnsFalseIfAllItemsInDiagonal2AreNotEqualToTheGivenComparator [
    board := Board from: '  X X O  '.
    self deny: (board diagonal2allEqual: #X)
  ]
  
  testAllEqualReturnsTrueIfEveryCellIsEqualToTheGivenComparator [
    board := Board from: '         '.
    self assert: (board allEqual: #' ')
  ]
  
  testAllEqualReturnsFalseIfEveryCellIsNotEqualToTheGivenComparator [
    board := Board from: '        X'.
    self deny: (board allEqual: #' ')
  ]
]