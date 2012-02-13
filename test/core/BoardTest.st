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
  
  testAllEqualToReturnsTrueIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XXXOOO   '.
    self assert: (board row: 1 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XXXOOOXXY'.
    self deny: (board row: 3 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsTrueIfAllItemsInAColumnEqualsTheGivenComparator [
    board := Board from: 'XOOXOOXOO'.
    self assert: (board column: 1 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XOOYOO   '.
    self deny: (board column: 3 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsTrueIfAllItemsInDiagonal1IsEqualToTheGivenComparator [
    board := Board from: 'X   X   X'.
    self assert: (board diagonal1allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInDiagonal1AreNotEqualToTheGivenComparator [
    board := Board from: 'X   X   O'.
    self deny: (board diagonal1allEqualTo: #X)
  ]
  
  testAllEqualToReturnsTrueIfAllItemsInDiagonal2IsEqualToTheGivenComparator [
    board := Board from: '  X X X  '.
    self assert: (board diagonal2allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInDiagonal2AreNotEqualToTheGivenComparator [
    board := Board from: '  X X O  '.
    self deny: (board diagonal2allEqualTo: #X)
  ]
  
  testAllNotEqualToReturnsTrueIfEveryCellIsEqualToTheGivenComparator [
    board := Board from: '         '.
    self assert: (board allNotEqualTo: #X)
  ]
  
  testAllNotEqualToReturnsFalseIfEveryCellIsNotEqualToTheGivenComparator [
    board := Board from: '        X'.
    self deny: (board allNotEqualTo: #X)
  ]
]