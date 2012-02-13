Object subclass: MockStream [
  
  MockStream class >> new: a [
    ^(ReadWriteStream on: a)
  ]
  
]