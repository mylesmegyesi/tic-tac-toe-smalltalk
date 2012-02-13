TestCase subclass: BoardTest [
  | board |
  
  testCreatesACellForEachCharacterGiven [
    | cells |
    board := Board from: 'XXXX' player1: #X player2: #O empty: #' '.
    cells := board cells.
    self assert: cells size = 4.
    cells do: [ :cell |
      self assert: cell = #X
    ].
    self assert: board empty = #' '
  ]
  
  testCopiesItself [
    | newBoard |
    board := Board from: 'XXXX' player1: #X player2: #O empty: #' '.
    newBoard := board copy.
    board placeMarker: #O coord: (Dictionary new add: #x -> 1; add: #y -> 1; yourself).
    self assert: (newBoard x: 1 y: 1) = #X.
    self assert: (newBoard x: 2 y: 1) = #X.
    self assert: (newBoard x: 1 y: 2) = #X.
    self assert: (newBoard x: 2 y: 2) = #X.
    self assert: newBoard player1 = #X.
    self assert: newBoard player2 = #O.
    self assert: newBoard size = 2.
    self assert: newBoard empty = #' '.
  ]
  
  testAllEqualToReturnsTrueIfAllItemsInARowEqualsTheGivenComparator [
    board := Board from: 'XXXOOO   ' player1: #X player2: #O empty: #' '.
    self assert: (board row: 1 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInARowDoNotEqualTheGivenComparator [
    board := Board from: 'XXXOOOXXY' player1: #X player2: #O empty: #' '.
    self deny: (board row: 3 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsTrueIfAllItemsInAColumnEqualsTheGivenComparator [
    board := Board from: 'XOOXOOXOO' player1: #X player2: #O empty: #' '.
    self assert: (board column: 1 allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInAColumnTheGivenComparator [
    board := Board from: 'X   O XO ' player1: #X player2: #O empty: #' '.
    self deny: (board column: 2 allEqualTo: #O)
  ]
  
  testAllEqualToReturnsTrueIfAllItemsInDiagonal1IsEqualToTheGivenComparator [
    board := Board from: 'X   X   X' player1: #X player2: #O empty: #' '.
    self assert: (board diagonal1allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInDiagonal1AreNotEqualToTheGivenComparator [
    board := Board from: 'X   X   O' player1: #X player2: #O empty: #' '.
    self deny: (board diagonal1allEqualTo: #X)
  ]
  
  testAllEqualToReturnsTrueIfAllItemsInDiagonal2IsEqualToTheGivenComparator [
    board := Board from: '  X X X  ' player1: #X player2: #O empty: #' '.
    self assert: (board diagonal2allEqualTo: #X)
  ]
  
  testAllEqualToReturnsFalseIfAllItemsInDiagonal2AreNotEqualToTheGivenComparator [
    board := Board from: '  X X O  ' player1: #X player2: #O empty: #' '.
    self deny: (board diagonal2allEqualTo: #X)
  ]
  
  testFullReturnsFalseIfTheBoardInstFull [
    board := Board from: '         ' player1: #X player2: #O empty: #' '.
    self deny: board full.
    board := Board from: 'XXXXXXXX ' player1: #X player2: #O empty: #' '.
    self deny: board full.
  ]
  
  testFullReturnsTrueIfTheBoardIsFull [
    board := Board from: 'OOOOOOOOO' player1: #X player2: #O empty: #' '.
    self assert: board full.
  ]
  
  testEmptyCellsReturnsTheCoordinatesWhereTheCellMatchesTheGivenEmptyCell [
    | coords |
    board := Board from: 'X X ' player1: #X player2: #O empty: #' '.
    coords := board emptyCells.
    self assert: coords size = 2.
    self assert: (coords at: 1) = (Dictionary new add: #x -> 2; add: #y -> 1; yourself).
    self assert: (coords at: 2) = (Dictionary new add: #x -> 2; add: #y -> 2; yourself).
  ]
  
  testXYGetsTheCellAtTheGivenPoint [
    board := Board from: 'XOY ' player1: #X player2: #O empty: #' '.
    self assert: (board x: 1 y: 1) = #X.
    self assert: (board x: 2 y: 1) = #O.
    self assert: (board x: 1 y: 2) = #Y.
    self assert: (board x: 2 y: 2) = #' '
  ]

  testXYGetsTheCellAtTheGivenPointFurther [
    board := Board from: 'abcdefghi' player1: #X player2: #O empty: #' '.
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
  
  testPlaceMarkerSetsTheGivenPoint [
    board := Board from: 'XXXX' player1: #X player2: #O empty: #' '.
    board placeMarker: #O coord: (Dictionary new add: #x -> 1; add: #y -> 1; yourself).
    self assert: (board x: 1 y: 1) = #O.
  ]
  
  testGetsTheOtherPlayersMarker [
    board := Board from: 'XXXX' player1: #X player2: #O empty: #' '.
    self assert: (board otherPlayer: #X) = #O.
    self assert: (board otherPlayer: #O) = #X.
  ]
]