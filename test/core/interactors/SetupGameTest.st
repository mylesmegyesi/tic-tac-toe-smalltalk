TestCase subclass: SetupGameTest [
  | mockUI setupGame |

  setUp [
    mockUI := MockUI new.
    setupGame := SetupGame new.
    Interactor setUI: mockUI.
  ]
  
  testTellsTheUIToDisplayAGreeting [
    setupGame execute.
    self assert: (mockUI commands at: 1) = #displayGreeting
  ]
  
  testTellsTheUIToDisplayTheNewGameForm [
    setupGame execute.
    self assert: (mockUI commands at: 2) = #displayNewGameOptions
  ]

]