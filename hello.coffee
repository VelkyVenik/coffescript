charm = require('charm')(process);
keypress = require 'keypress'

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


printTable = (x, y, width, height) ->
  charm
    .position x+i,y
    .write tableData['top']
    .position x+i, y+height
    .write tableData['bottom'] for i in [1..width-1]

  charm
    .position x, y+i
    .write tableData['left']
    .position x+width, y+i
    .write tableData['right'] for i in [1..height-1]

  charm
    .position x,y
    .write tableData['top-left']
    .position x+width, y
    .write tableData['top-right']
    .position x, y+height
    .write tableData['bottom-left']
    .position x+width, y+height
    .write tableData['bottom-right']

charm.reset()
charm.cursor no
keypress process.stdin

line = 0
process.stdin.on 'keypress',  (ch, key) ->
  charm
    .delete "char"                  # silent
    .foreground "red"               # color
    .position 1,line                # on the same line
    .write "Key: "                  # do not erase this
    .erase "end"                    # erase previous key data
    .write "#{ch} (#{key.name})\n"  # key data

  process.exit() if key.name is 'q'


printTable 1,1,15,15

charm
  .position i+2, i+2
  .foreground i+1
  .write s for s,i in 'Hello World :)'

charm
  .down 2
  .position (x,y) ->
    line = y+1
