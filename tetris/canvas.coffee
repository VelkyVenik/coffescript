io = require './io'
utils = require './utils'

class Canvas
  rowData: []
  width: 0
  height: 0
  startX: 1
  startY: 1

  blockColor: 'red'

  init: (_width, _height) ->
    this.width = _width
    this.height = _height

    for i in [1..this.height]
      this.rowData[i] = 511

  printTableFrame: ->
    io.printTableFrame this.startX, this.startY, this.width, this.height

  print: ->
    this.printTableFrame()
    for row in [1 .. this.height]
      this.printRow row, this.rowData[row]

  updateRow: (row, newData) ->
    this.printRow (this.rowData[row] & (newData ^ this.rowData[row])), ' ', 'black'
    this.printRow (newData & (newData ^ this.rowData[row])), '*', blockColor

    this.rowData[row] = newData

  printRow: (row, data, ch = '*', color = 'white') ->
    for i in [0..(utils.binaryDataLength data)]
      this.printChar i, row, ch, color if (((data >> 1) << 1) ^ data) is 1
      data = data >> 1

  printChar: (x, y, ch, color) ->
    io.printXY x + this.startX + 1, this.startY + this.height - y + 1, ch, color



exports.Canvas = Canvas
