io = require './io'
canvas = require './canvas'



moveLeft = ->
    blockX-- if blockX > 2
    printBlock 1

moveRigh = ->
    blockX++ if blockX < 15 - blockWidth + 1
    printBlock 1
#
# moveUp = ->
#     #blockY-- if blockY > 2
#     printBlock 1
#
# moveDown = ->
#     #blockY++ if blockY < 15
#     printBlock 1
#
#

io.init()
process.on 'exit', io.finish

io.registerInputCallback 'q', process.exit

io.registerInputCallback 'left', moveLeft
io.registerInputCallback 'right', moveRigh

c = new canvas.Canvas
c.init 9,15
c.print()
