Object subclass: MockUI [

  Commands := OrderedCollection new.
  
  MockUI class >> new [
    ^super new yourself
  ]
  
  commands [ ^Commands ]
  
  displayGreeting: greeting [
    Commands add: #displayGreeting
  ]
  
  displayNewGameOptions [
    Commands add: #displayNewGameOptions
  ]
  
]