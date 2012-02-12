Interactor subclass: SetupGame [
  
  SetupGame class >> new [
    ^super new yourself.
  ]
  
  execute [
    UI displayGreeting: 'Hello! Welcome to Tic Tac Toe!'.
    UI displayNewGameOptions.
  ]
  
]