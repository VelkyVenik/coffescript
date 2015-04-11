exports.binaryDataLength = (data) ->
  length = 0
  while data > 0
    data = data >> 1
    length++

  length
