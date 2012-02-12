TestCase subclass: PlayerTest [

  testTwoPlayersAreEqualIfTheirMarkerIsTheSame [
    | player1 player2 |
    player1 := Player marker: 'X'.
    player2 := Player marker: 'X'.
    self assert: player1 = player2.
  ]
  
  testTwoPlayersAreNotEqualIfTheirMarkerIsNotTheSame [
    | player1 player2 |
    player1 := Player marker: 'X'.
    player2 := Player marker: 'O'.
    self deny: player1 = player2.
  ]

]