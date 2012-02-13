Object subclass: MockIO [
  | moves throwOnGetMove getMoveCalledCount gameOverCalledCount gameOverState printBoardCalledCount |

  addMove: move [ moves add: move ]
  moves: value [ moves := value ]
  throwOnGetMove: value [ throwOnGetMove := value ]
  getMoveCalledCount [ ^ getMoveCalledCount ]
  getMoveCalledCount: value [ getMoveCalledCount := value ]
  gameOverCalledCount: value [ gameOverCalledCount := value ]
  gameOverCalledCount [ ^gameOverCalledCount ]
  gameOverState [ ^gameOverState ]
  printBoardCalledCount: value [ printBoardCalledCount := value ]
  printBoardCalledCount [ ^printBoardCalledCount ]
  
  MockIO class >> new [
    ^super new
      getMoveCalledCount: 0;
      gameOverCalledCount: 0;
      throwOnGetMove: false;
      moves: OrderedCollection new;
      printBoardCalledCount: 0;
      yourself
  ]
  
  getMove: prompt [
    | move |
    getMoveCalledCount := getMoveCalledCount + 1.
    throwOnGetMove & (getMoveCalledCount = 1) ifTrue: [
      self error: 'wat'
    ].
    move := moves at: 1.
    moves removeAtIndex: 1.
    ^move
  ]
  
  gameOver: state [
    gameOverCalledCount := gameOverCalledCount + 1.
    gameOverState := state.
  ]
  
  printBoard: board [
    printBoardCalledCount := printBoardCalledCount + 1.
  ]
  
]