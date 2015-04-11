charm = require('charm')(process);
keypress = require 'keypress'



defaultPosition =
  x: 1
  y: 20

tableData =
  'top': '─'
  'top-mid': '┬'
  'top-left': '┌'
  'top-right': '┐'
  'bottom': '─'
  'bottom-mid': '┴'
  'bottom-left': '└'
  'bottom-right': '┘'
  'left': '│'
  'left-mid': '├'
  'mid': '─'
  'mid-mid': '┼'
  'right': '│'
  'right-mid': '┤'
  'middle': '│'

exports.init = ->
  charm.reset()
  charm.cursor no
  keypress process.stdin

exports.finish = ->
  charm
    .cursor yes
    .write '\n'

exports.printXY = (x, y, ch, color) ->
  charm
    .foreground color
    .position x, y
    .write ch
#    .position defaultPosition[x], defaultPosition[y]

exports.printTableFrame = (x, y, width, height) ->
  charm
    .foreground 'green'
    .position x+i,y
    .write tableData['top']
    .position x+i, y+height+1
    .write tableData['bottom'] for i in [1..width]

  charm
    .foreground 'green'
    .position x, y+i
    .write tableData['left']
    .position x+width+1, y+i
    .write tableData['right'] for i in [1..height]

  charm
    .foreground 'green'
    .position x,y
    .write tableData['top-left']
    .position x+width+1, y
    .write tableData['top-right']
    .position x, y+height+1
    .write tableData['bottom-left']
    .position x+width+1, y+height+1
    .write tableData['bottom-right']

    .position 1,20

  # charm
  #   .foreground 'blue'
  #   .position x+i,y+1
  #   .write "#{i}" for i in [1..width]
  #
  # charm
  #   .foreground 'blue'
  #   .position x+1,y+i
  #   .write "#{i}" for i in [1..height]

inputCallbacks = []
exports.registerInputCallback = (key, f) ->
  inputCallbacks[key] = f


process.stdin.on 'keypress',  (ch, key) ->
  charm
    .left 1
    .write " "                      # silent it
    .foreground "red"               # color
    .position defaultPosition['x'], defaultPosition['y']
                                    # on the same line
    .write "Key: "                  # do not erase this
    .erase "end"                    # erase previous key data
    .write "#{key.name}"  # key data

  for k, f of inputCallbacks
    f() if k is key.name
