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
  
  testCopiesItself [
    | newBoard |
    board := Board from: 'XXXX'.
    newBoard := board copy.
    board placeMarker: #O x: 1 y: 1.
    self assert: (newBoard x: 1 y: 1) = #X
  ]
  
  testAllEqualToReturnsTrueIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XXXOOO   '.
    self assert: (board row: 1 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInARowDoNotEqualTheGivenComparator [
    board := Board from: 'XXXOOOXXY'.
    self deny: (board row: 3 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsTrueIfAllItemsInAColumnEqualsTheGivenComparator [
    board := Board from: 'XOOXOOXOO'.
    self assert: (board column: 1 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInAColumnTheGivenComparator [
    board := Board from: 'X   O XO '.
    self deny: (board column: 2 allEqualTo: #O)
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
  
  testCoordinatesWhereReturnsTheCoordinatesWhereTheGivenBlockReturnTrue [
    | coords |
    board := Board from: 'X X '.
    coords := board coordinatesWhere: [ :cell | cell = #' '].
    self assert: coords size = 2.
    self assert: (coords at: 1) = (Dictionary new add: #x -> 2; add: #y -> 1; yourself).
    self assert: (coords at: 2) = (Dictionary new add: #x -> 2; add: #y -> 2; yourself).
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
  
  testXYMarkerSetsTheGivenPoint [
    board := Board from: 'XXXX'.
    board placeMarker: #O x: 1 y: 1.
    self assert: (board x: 1 y: 1) = #O.
  ]
  
  testCoordMarkerSetsTheGivenPoint [
    board := Board from: 'XXXX'.
    board placeMarker: #O coord: (Dictionary new add: #x -> 1; add: #y -> 1; yourself).
    self assert: (board x: 1 y: 1) = #O.
  ]
]