Player subclass: Human [
  | IO |
  
  setIO: value [ IO := value ]
  
  makeMove: board [
    board placeMarker: marker coord: IO getMove
  ]
]