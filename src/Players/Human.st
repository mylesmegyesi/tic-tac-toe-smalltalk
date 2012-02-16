Player subclass: Human [
  | IO |
  
  setIO: value [ IO := value ]
  io [ ^IO ]
  nicePrompt [ ^'Please enter your move (ex: 1 1, for row 1 column 1):: '] 
  meanPrompt [ ^'Invalid move (coordinates not recognized or cell is already taken): ']
  
  makeMove: board prompt: prompt [
    [board placeMarker: marker index: (IO getMove: prompt)]
    on: Error
    do: [
      self makeMove: board prompt: (self meanPrompt)
      ]
  ]
  
  makeMove: board [
    self makeMove: board prompt: (self nicePrompt).
  ]
]
