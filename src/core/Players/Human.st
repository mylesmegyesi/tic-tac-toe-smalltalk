Player subclass: Human [
  | IO |
  
  setIO: value [ IO := value ]
  io [ ^IO ]
  nicePrompt [ ^'Please enter your next move: ']
  meanPrompt [ ^'Stop That: ']
  
  makeMove: board prompt: prompt [
    [board placeMarker: marker coord: (IO getMove: prompt)]
    on: Error
    do: [
      self makeMove: board prompt: (self meanPrompt)
      ]
  ]
  
  makeMove: board [
    self makeMove: board prompt: (self nicePrompt).
  ]
]