Object subclass: MockIO [
  | moveToReturn throwOnGetMove getMoveCalledCount |

  moveToReturn: value [ moveToReturn := value ]
  throwOnGetMove: value [ throwOnGetMove := value ]
  getMoveCalledCount [ ^ getMoveCalledCount ]
  getMoveCalledCount: value [ getMoveCalledCount := value ]
  
  MockIO class >> new [
    ^super new
      getMoveCalledCount: 0;
      throwOnGetMove: false;
      yourself
  ]
  
  getMove [
    getMoveCalledCount := getMoveCalledCount + 1.
    throwOnGetMove & (getMoveCalledCount = 1) ifTrue: [
      self error: 'wat'
    ].
    ^moveToReturn
  ]
  
]