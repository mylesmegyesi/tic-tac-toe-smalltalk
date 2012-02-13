Player subclass: Human [
  | IO |
  
  setIO: value [ IO := value ]
  
  makeMove: board [
    | gotTheMove theMove |
    gotTheMove := false.
    [gotTheMove] whileFalse: [[
        theMove := board placeMarker: marker coord: IO getMove.
        gotTheMove := true.
      ]
      on: Error
      do: []
    ]
  ]
]