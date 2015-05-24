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
      this.rowData[i] = 0

  printTableFrame: ->
    io.printTableFrame this.startX, this.startY, this.width, this.height

  print: ->
    this.printTableFrame()
    for row in [1 .. this.height]
      this.printRow row, this.rowData[row]

  printBlock: (row, block) ->
    for blockData, i in block
      console.log blockData, i
      this.updateRow row+i, blockData

  updateRow: (row, newData) ->
    this.printRow (this.rowData[row] & (newData ^ this.rowData[row])), ' ', 'black'
    this.printRow (newData & (newData ^ this.rowData[row])), '*', this.blockColor

    this.rowData[row] = newData

  printRow: (row, data, ch = '*', color = 'white') ->
    for i in [1..(utils.binaryDataLength data) + 1]
      this.printChar i, row, ch, color if (((data >> 1) << 1) ^ data) is 1
      data = data >> 1

  printChar: (x, y, ch, color) ->
    io.printXY x + this.startX, this.startY + this.height - y + 1, ch, color



exports.Canvas = Canvas
