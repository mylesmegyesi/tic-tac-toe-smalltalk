Object subclass: Player [
  | marker |

  Player class >> marker: marker [
    ^self new
      marker: marker;
      yourself.
  ]
  
  marker [ ^marker ]
  marker: value [ marker := value ]
  
  = otherPlayer [
    ^marker = otherPlayer marker.
  ]

]